const db = require('../utils/db')
const { all, getById, add } = require('./user.model')
const table_name = 'courses'

module.exports = {
    async all() {
        return db(table_name);
    },

    async getById(id) {
        const courses = await db(table_name).where('id', id)
        if (courses.length === 0)
            return null
        return courses[0];
    },

    async add(course) {
        return db(table_name).insert(course);
    },

    async del(id) {
        const course = getById(id);
        if (course.length === 0)
            return;
        return db(table_name).where('id', id).del();
    },

    async update(course) {
        const course = getById(course.id);
        if (course.length === 0)
            return;

    },

    async getTotal(keySearch) {
        return db(table_name).where('name', 'like', `%${keySearch}%`).orWhere('author', 'like', `%${keySearch}%`).length;
    },

    async search(keySearch, pageIndex, pageSize) {
        let offset = (pageIndex - 1) * pageSize;
        return db(table_name).where('name', 'like', `%${keySearch}%`).orWhere('author', 'like', `%${keySearch}%`).limit(pageSize).offset(offset);
    }
}