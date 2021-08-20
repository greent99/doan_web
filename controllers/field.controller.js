const fieldModel = require('../models/field.model')

module.exports = {
    async getAll(req, res) {
        const page = req.query.page || 1
        const pageSize = req.query.pageSize || 10
        const items = await fieldModel.getSizeAll()
        const totalItems = items.length
        const totalPages =  Math.ceil(totalItems / pageSize)
        const fields = await fieldModel.all(page, pageSize)

        return res.status(200).json({
            dataRows: fields,
            totalItems,
            totalPages,
        })
    },

    async create(req, res)
    {
        const {name, categoryid} = req.body
        id = await fieldModel.add({name, categoryid})
        if(id)
        {
            const field = await fieldModel.getById(id)
            return res.status(200).json({
                message: "Add success",
                field: field
            })
        }
        return res.status(400).json({
            message: "Something error"
        })
    },

    async getById (req, res) {
        const id = req.params.id
        
        const field = await fieldModel.getById(id)

        if(field)
            return res.status(200).json({
                message: "Success",
                field
            })
        
        return res.status(400).json({
            message: "field is not exist"
        })
    },

    async update (req, res)
    {
        const id = req.params.id
        const {name, categoryid} = req.body

        if(await fieldModel.update(id, {name, categoryid}))
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
        const field = await fieldModel.getById(id)
        if(field){
            await fieldModel.delete(id)
            return res.status(200).json({
                message: "Delete success"
            })
        }

        return res.status(400).json({
            message: "field is not exist"
        })
    }
}