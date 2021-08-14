const db = require('../utils/db');
const { all, getById, add } = require('./user.model');
const table_name="categories"

module.exports = {
    async all() {
        return db(table_name);
    },

    async getById(id) {
        const categories = await db(table_name).where('id', id)
        if (categories.length === 0)
            return null
        return categories[0];
    },

    async add(category) {
        return db(table_name).insert(category).returning('id')
    },

    async del(id) {
        const category = await getById(id);
        if (category.length === 0)
            return;
        return db(table_name).where('id', id).del();
    },

    async update(course) {
        const tmpCourse = await getById(course.id);
        if (tmpCourse.length === 0)
            return;
    },

}