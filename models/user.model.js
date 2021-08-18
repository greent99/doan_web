const db = require('../utils/db')
const statusModel = require('../models/status.model')
const table_name = 'users'
const table_user_course = 'user_course'

module.exports = {
    async all() {
        return db(table_name)
    },

    async getById(id) {
        const users = await db(table_name).where('id', id)
        if(users.length === 0)
            return null;
        return users[0]
    },

    async getByRole(role) {
        return db(table_name).join('accounts', 'users.id', 'accounts.userid').where('accounts.userType', role)
            .select('users.fullname', 'users.id')
    },

    async add(user)
    {
        return db(table_name).insert(user);
    },

    async updateStatus (id, code){
        const users = await db(table_name).where('id', id)
        if(users.length === 0)
            return null;
        const status = statusModel.getByCode(code)
        if(status)
            await db(table_name).where('id', id).update('statuscode', code).update('statusid', status.id)
        return true
    },

    async delete(id)
    {
        return db(table_name).where('id', id).del();
    },

    async enrollCourse (userid, courseid) {
        const user_course = await db('user_course').where('userid', userid).where('courseid', courseid)
        if(user_course.length == 0)
            return await db('user_course').insert({
                courseid,
                userid,
                isinwatchlist: false
            })
        return false
    },

    async getWatchList (userid) {
        return db(table_user_course).join('courses', `${table_user_course}.courseid`, 'courses.id')
        .join('users', `courses.author`, 'users.id')
        .where('userid', userid).where('isinwatchlist', true)
        .select(`${table_user_course}.*`, 'courses.*', 'users.fullname')
    },

    async getEnrollList (userid) {
        return db(table_user_course).join('courses', `${table_user_course}.courseid`, 'courses.id')
        .join('users', `courses.author`, 'users.id')
        .where('userid', userid)
        .select(`${table_user_course}.*`, 'courses.*', 'users.fullname')
    },

    async getListTeacherCourse(userid) {
        return db('courses').where('author', userid).where('statuscode', 'Available')
    }
}