const userModel = require('../models/user.model')
const accountModel = require('../models/account.model')
const courseModel = require('../models/course.model')

module.exports = {
    async profile (req, res) {
        return res.status(200).json({
            message: 'oke'
        })
    },

    async getAll(req, res) {
        const page = req.query.page
        const data = await accountModel.getAll(page)
        const totalPage = data.length % 10 == 0 ? data.length / 10 : ((data.length /10) + 1)
        return res.status(200).json({
            dataRows:  data,
            totalItems: data.length,
            totalPages: totalPage

        })
    },

    async create(req, res)
    {
        const {email, password, username, gender, userType, fullname } = req.body
        console.log(password)
        const accountIns = await accountModel.singleByEmail(email)
        if(accountIns)
            return res.status(400).json({
                message: "Email exist"
            })

        let newUser = {
            fullname: fullname,
            statuscode: 'AVAILABLE',
        }
        userId = await userModel.add(newUser)
        const account = {
            email,
            userId: userId[0],
            username,
            gender,
            userType
        }
        await accountModel.setPassword(password, account)
        const id = await accountModel.add(account)
        if(id)
        {
            account.id = id
            return res.status(200).json({
                message: "Add success",
                user: account
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
    },

    async getByRole(req, res)
    {
        const type = req.params.type
        const users = await userModel.getByRole(type)

        return res.status(200).json({
            message: 'success',
            users
        })
    },

    async enrollCourse (req, res) {
        const userid = req.params.id
        const courseid = req.body.courseid
        const course = await courseModel.getById(courseid)
        if(course){
            const result = await userModel.enrollCourse(userid, courseid)
            if(result)
                return res.status(200).json({
                    message: 'Success',
                })
            else
                return res.status(400).json({
                    message: 'Course is exist in list',
                })
        }

        return res.status(400).json({
            message: "Course is not exist"
        })
    }
}