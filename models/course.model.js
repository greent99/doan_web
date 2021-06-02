const db = require('../utils/db');
const { all, getById, add } = require('./user.model');
const table_course = 'courses';
const table_user_course = 'user_course';

module.exports = {
    async all() {
        return db(table_course);
    },

    async getById(id) {
        const courses = await db(table_course).where('id', id)
        if (courses.length === 0)
            return null
        return courses[0];
    },

    async add(course) {
        return db(table_course).insert(course);
    },

    async del(id) {
        const course = await getById(id);
        if (course.length === 0)
            return;
        return db(table_course).where('id', id).del();
    },

    async update(course) {
        const tmpCourse = await getById(course.id);
        if (tmpCourse.length === 0)
            return;
    },

    async getTotal(keySearch) {
        return db(table_course).where('name', 'like', `%${keySearch}%`).orWhere('author', 'like', `%${keySearch}%`).length;
    },

    async search(keySearch, pageIndex, pageSize) {
        let offset = (pageIndex - 1) * pageSize;
        return db(table_course).where('name', 'like', `%${keySearch}%`).orWhere('author', 'like', `%${keySearch}%`).limit(pageSize).offset(offset);
    },

    async getTop10NewCourse(){
        return db(table_course).orderBy('uploaddate').limit(10);
    },

    //get 10 most registered courses
    async getTop10Most(){
        return db(table_user_course)
    }
}