const userModel = require('../models/user.model')
const categoryModel = require('../models/category.model')

module.exports = {
    async profile (req, res) {
        return res.status(200).json({
            message: 'oke'
        })
    },

    async getAll(req, res) {
        const categories = await categoryModel.all()

        return res.status(200).json({
            category: categories
        })
    },

    async create(req, res)
    {
        const {name} = req.body
        id = await categoryModel.add({name})
        console.log(id)
        if(id)
        {
            const category = await categoryModel.getById(id)
            return res.status(200).json({
                message: "Add success",
                category: category
            })
        }
        return res.status(400).json({
            message: "Something error"
        })
    },

    async getById (req, res) {
        const id = req.params.id
        
        const user = await accountModel.singleById(id)

        if(user)
            return res.status(200).json({
                message: "Success",
                user
            })
        
        return res.status(400).json({
            message: "User is not exist"
        })
    },

    async update (req, res)
    {
        const id = req.params.id
        const {gender, username, fullname} = req.body

        if(await accountModel.update(id, {gender, username, fullname}))
            return res.status(200).json({
                message: "Update success"
            })
        
        return res.status(400).json({
            message: 'Something error'
        })
    },

    async delete (req, res)
    {
        const id = req.params.id
        const user = await accountModel.singleById(id)
        const userId = user.userid
        console.log(`${id} - ${user.userid}`)
        if(user){
            await accountModel.delete(id)
            await userModel.delete(userId)
            return res.status(200).json({
                message: "Delete success"
            })
        }

        return res.status(400).json({
            message: "User is not exist"
        })
    }
}