const courseModel = require('../models/course.model');
const uploadFile = require('../middlewares/upload.mdw');

module.exports = {
    async getAll(req, res) {
        const keySearch = req.query.keySearch;
        const page = req.query.page || 1
        const pageSize = req.query.pageSize || 10
        const sortType = req.query.sortType;
        const category = req.query.category;

        const courses = await courseModel.search(keySearch, page, pageSize, sortType, category);
        const items = await courseModel.getCountSearch(keySearch, sortType, category);
        const totalItems = items.length
        const totalPages =  Math.ceil(totalItems / pageSize)

        return res.status(200).json({
            dataRows: courses,
            totalItems,
            totalPages
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

        if(course)
            return res.status(200).json({
                message: "Success",
                course
            })
        
        return res.status(400).json({
            message: "Course is not exist"
        })
    },

    async getReview(req, res) {
        const id = req.params.id
        const course = await courseModel.getById(id)

        if(course)
        {
            const reviews = await courseModel.getReviews(id)
            return res.status(200).json({
                message: 'Success',
                reviews,
                course
            })
        }

        return res.status(400).json({
            message: "Course is not exist"
        })
    },

    async addReview (req, res) {
        const id = req.params.id
        const course = await courseModel.getById(id)
        const {userid, point, comment} = req.body
        if(course)
        {
            const result = await courseModel.addReview(id, {
                userid, point, comment,
                createddat: new Date()
            })
            return res.status(200).json({
                message: "Add success"
            })
        }

        return res.status(400).json({
            message: "Course is not exist"
        })
    },

    async addToWatchList (req, res)
    {
        const id = req.params.id
        const course = await courseModel.getById(id)

        if(course)
        {
            const userid = req.body.userid
            await courseModel.addToWatchList(id, userid)
            return res.status(200).json({
                message: 'Success',
            })
        }

        return res.status(400).json({
            message: "Course is not exist"
        })
    },

    async addLesson (req, res) {
        const id = req.params.id
        const course = await courseModel.getById(id)
        const {description, videourl} = req.body

        if(course)
        {
            const ids = await courseModel.addLesson(courseid, {
                description, videourl, courseid
            })
            const id = ids[0]
            if(id)
                return res.status(200).json({
                    message: 'Success'
                })
            
            return res.status(400).json({
                message: 'Something error when create lesson'
            })
        }

        return res.status(400).json({
            message: "Course is not exist"
        })
    }
}