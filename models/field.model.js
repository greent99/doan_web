const db = require('../utils/db');
const table_name="fields"

module.exports = {
    async all(page, pageSize) {
        const offset = (page - 1) * pageSize
        return db(table_name)
        .join('categories', 'fields.categoryid', 'categories.id')
        .limit(pageSize).offset(offset)
        .select('fields.*', 'categories.name as category_name')
    },

    async getSizeAll () {
        return db(table_name)
    },

    async getById(id) {
        const categories = await db(table_name).where('id', id)
        if (categories.length === 0)
            return null
        return categories[0];
    },

    async add(field) {
        return db(table_name).insert(field).returning('id')
    },

    async delete(id) {
        return db(table_name).where('id', id).del();
    },

    async update(id, field) {
        await db(table_name).where('id', id).update(field)
    },

}