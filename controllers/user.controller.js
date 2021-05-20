const userModel = require('../models/user.model')
const accountModel = require('../models/account.model')
const database = require('../utils/db')


module.exports = {
    async getAll (req,res) {
        let data = await userModel.all()
        return res.json(data)
    },

    async register (req, res) {
        const connection = await database.getConnection()
        connection.beginTransaction(async err => {
            if(err) throw err
            try {
                const account = await accountModel.singleByEmail(req.body.email)
                if(account)
                    return res.status(400).json({
                        message: 'Email exist'
                    })
                
                let newUser = {
                        fullname: '',
                        gender: ''
                }
                newUser = await userModel.add(newUser)
                
                if(!newUser) throw 'Can not add user'

                let newAccount = {
                    email: req.body.email,
                    userid: newUser.id
                }
                accountModel.setPassword(req.body.password, newAccount)
                newAccount = await accountModel.add(newAccount)
                
                if(newAccount)
                {
                    connection.commit(async err => {
                        connection.release()
                        const account = await accountModel.singleById(newAccount.id)
                        if(err) throw err
                        return res.status(201).json({
                            message: 'success',
                            data: account
                        })
                    })
                } else
                {
                    return res.status(400).json({
                        message: 'can not create new account'
                    })
                }

            } catch (err){
                return res.status(500).json({
                    result: err
                })
            }
        })
    },

    async deleteBucket(req,res){
        let id = req.params.id
        let bucket = await userModel.getById(id)
        if (bucket === null)
            return res.json({
                'message': 'bucket not exist'
            })
        let result = userModel.del(id)
        return res.json({
            'status': 'success',
            'data': result
        })
    },

}