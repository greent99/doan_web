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
                const account = await accountModel.getByEmail(req.body.email)
                if(account)
                    return res.status(400).json({
                        message: 'Email exist'
                    })
                
                const newUser = {
                        fullname: ''
                }
                newUser = await userModel.add(newUser)
                if(!newUser) throw 'Can not add user'

                const newAccount = {
                    email: req.body.email,
                    userid: newUser.id
                }

                accountModel.setPassword(req.body.password, newAccount)
                

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