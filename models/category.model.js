const db = require('../utils/db');
const { all, getById, add } = require('./user.model');
const table_name="categories"

module.exports = {
    async all(page, pageSize) {
        const offset = (page - 1) * pageSize
        return db(table_name).limit(pageSize).offset(offset)
    },

    async getSizeAll (pageSize) {
        return db(table_name)
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

    async delete(id) {
        return db(table_name).where('id', id).del();
    },

    async update(id, category) {
        await db(table_name).where('id', id).update(category)
    },

}