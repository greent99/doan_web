const userModel = require('../models/user.model')
const accountModel = require('../models/account.model')
const statusModel = require('../models/status.model')
const db = require('../utils/db')
const jwt = require('jsonwebtoken');
const randomstring = require('randomstring');
const SECRET_KEY = process.env.ACCESS_TOKEN_SECRET || 'SECRET_KEY'
const mailHelper = require('../helpers/sendmail.helper')


module.exports = {
    // register
    async register (req, res) {
        const account = await accountModel.singleByEmail(req.body.email)
        if(account)
            return res.status(400).json({
                message: 'Email exist'
            })
        
        const status = await statusModel.getByCode('PENDING')
        let statusid = status ? status.id : null
        let newUser = {
                fullname: '',
                gender: '',
                statuscode: 'PENDING',
                statusid: statusid
                
        }
        ids_user = await userModel.add(newUser)
        newUser.id = ids_user[0]
        
        if(!newUser) 
            return res.status(400).json({
                message: 'Error while create account'
            })

        let newAccount = {
            username: req.body.username,
            email: req.body.email,
            userid: newUser.id
        }
        accountModel.setPassword(req.body.password, newAccount)
        ids_account = await accountModel.add(newAccount)
        newAccount.id = ids_account[0]
        
        if(newAccount)
        {
            return res.status(201).json({
                message: 'Account create success',
                data: newAccount
            })
        }
        else
        {
            return res.status(400).json({
                message: 'can not create new account'
            })
        }
    },

    // login
    async login (req, res) {
        const account = await accountModel.singleByEmail(req.body.email)

        if(account == null)
        {
            return res.status(400).json({
                message: 'Email address does not exist',
                authenticated: false
            })
        }

        if(!accountModel.validPassword(req.body.password, account))
        {
            return res.status(400).json({
                message: 'Invalid password',
                authenticated: false
            })
        }

        const user = await userModel.getById(account.userid)
        if(user.statuscode === 'PENDING')
            return res.status(400).json({
                message: "account do not active"
            })

        const payload = {
            userId: account.userid
        }
        const opts = {
            expiresIn: 10 * 60 // seconds
        }
        const accessToken = jwt.sign(payload, SECRET_KEY, opts);
        const refreshToken = randomstring.generate(80);
        await accountModel.patchRFToken(account.id, refreshToken);

        return res.status(200).json({
            authenticated: true,
            access_token: accessToken,
            refresh_token: refreshToken
        })
    },

    //refresh token
    async refresh (req, res) {
        const { access_token, refresh_token } = req.body;
        const { userId } = jwt.verify(access_token, SECRET_KEY, {
          ignoreExpiration: true
        });
      
        const ret = await accountModel.isValidRFToken(userId, refresh_token);
        if (ret === true) {
          const newAccessToken = jwt.sign({ userId }, SECRET_KEY, { expiresIn: 60 * 10 });
          return res.json({
            access_token: newAccessToken
          });
        }
      
        return res.status(400).json({
          message: 'Refresh token is revoked!'
        });
    },     
    
    //send mail to active account
    async sendMailToActive (req, res) {
        const email = req.body.email 
        if (!email)
            return res.status(400).json({
                message: 'Please provide email to active'
        })

        let account = await accountModel.singleByEmail(email)
        if(account === null)
            return res.status(400).json({
                message: 'Email not exist'
            })

        const user = await userModel.getById(account.userid)
        if(user.statuscode === 'ACTIVE')
            return res.status(400).json({
                message: 'Email actived'
            })
        
        await accountModel.getOtp(req.hostname, req.protocol, account)
        return res.status(200).json({
            message: "Email active sent, please check!"
        })
    },

    async activateEmail(req, res) {
        const otp = req.query.otp || null
        const email = req.query.email || null
        
        const account = await accountModel.singleByEmail(email)
        if(!account)
            return res.status(400).json({
                message: 'email not exist'
            })

        const currentDate = new Date()
        if(account.otp ===  otp && currentDate <= account.otpexpired)
        {
            const payload = {
                userId: account.userid
            }
            const opts = {
                expiresIn: 10 * 60 // seconds
            }
            const accessToken = jwt.sign(payload, SECRET_KEY, opts);
            const refreshToken = randomstring.generate(80);
            await accountModel.patchRFToken(account.id, refreshToken);
            await userModel.updateStatus(account.userid, 'ACTIVE')
            
            return res.status(200).json({
                message: "email active successfully",
                access_token: accessToken,
                refresh_token: refreshToken
            })
        }

        return res.status(400).json({
            message: 'invalid link active'
        })
    }

}