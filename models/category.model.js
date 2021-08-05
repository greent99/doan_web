const db = require('../utils/db');
const { all } = require('./status.model');
const tabale_category = 'categories';

module.exports = {
    async all() {
        return db(tabale_category);
    },

    async getById(id) {
        const courses = await db(tabale_category).where('id', id)
        if (courses.length === 0)
            return null
        return courses[0];
    },

    async add(category) {
        return db(tabale_category).insert(category);
    },

    async del(id) {
        const category = await getById(id);
        if (category.length === 0)
            return;
        return db(tabale_category).where('id', id).del();
    },

    async update(category) {
        const tmpCategory = await getById(category.id);
        if (tmpCategory.length === 0)
            return;
    }
}