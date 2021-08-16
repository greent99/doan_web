const { search } = require('../models/course.model');
const courseModel = require('../models/course.model');
const uploadFile = require('../middlewares/upload.mdw');

module.exports = {
    async getAll(req, res){
        const page = req.query.page || 1
        const pageSize = req.query.pageSize || 10
        const items = await courseModel.getSizeAll()
        const totalItems = items.length
        const totalPages =  Math.ceil(totalItems / pageSize)
        const courses = await courseModel.all(page, pageSize)

        return res.status(200).json({
            dataRows: courses,
            totalItems,
            totalPages,
        })
    },

    async search(req, res) {
        const keySearch = req.query.keySearch;
        const pageIndex = req.query.pageIndex;
        const pageSize = req.query.pageSize;
        const typeFilter = req.query.typeFilter;

        const courses = await courseModel.search(keySearch, pageIndex, pageSize, typeFilter);
        const totalRow = await courseModel.getCountSearch(keySearch, typeFilter);

        return res.status(200).json({
            listCourse: courses[0][0],
            total: totalRow[0][0][0].count
        });
    },

    async create(req, res) {
        await uploadFile(req, res)

        const {name, fieldid, author, description, status, price} = req.body
        const id = await courseModel.add({
            name,
            field: fieldid,
            author,
            description,
            statuscode: status,
            price,
            uploaddate: new Date(), 
            imgpath: `/images/${req.file.originalname}`
        })

        if(id)
            return res.status(200).json({
                message: "Add success"
            })
        
        return res.status(400).json({
            message: "Something error"
        })
    },

    async getById (req, res) {
        const id = req.params.id
        
        const course = await courseModel.getById(id)

        if(field)
            return res.status(200).json({
                message: "Success",
                course
            })
        
        return res.status(400).json({
            message: "Course is not exist"
        })
    }
}