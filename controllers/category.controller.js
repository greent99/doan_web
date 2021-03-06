const userModel = require('../models/user.model')
const categoryModel = require('../models/category.model')

module.exports = {
    async profile (req, res) {
        return res.status(200).json({
            message: 'oke'
        })
    },

    async getAll(req, res) {
        const page = req.query.page || 1
        const pageSize = req.query.pageSize || 10
        const items = await categoryModel.getSizeAll()
        const totalItems = items.length
        const totalPages =  Math.ceil(totalItems / pageSize)
        const categories = await categoryModel.all(page, pageSize)

        return res.status(200).json({
            dataRows: categories,
            totalItems,
            totalPages,
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
        
        const category = await categoryModel.getById(id)

        if(category)
            return res.status(200).json({
                message: "Success",
                category
            })
        
        return res.status(400).json({
            message: "Category is not exist"
        })
    },

    async update (req, res)
    {
        const id = req.params.id
        const {name} = req.body

        if(await categoryModel.update(id, {name}))
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
        const category = await categoryModel.getById(id)
        if(category){
            await categoryModel.delete(id)
            return res.status(200).json({
                message: "Delete success"
            })
        }

        return res.status(400).json({
            message: "Category is not exist"
        })
    }
}