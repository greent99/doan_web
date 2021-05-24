const db = require('../utils/db')
const table_name = 'statuses'

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

    async getByCode(code) {
        const statuses = await db(table_name).where('code', code)
        if(statuses.length === 0)
            return null
        return statuses[0]
    } 

}