const database = require('../utils/db')
const table_name = 'users'

module.exports = {
    async all() {
        const query = `SELECT * from ${table_name}`
        return await database.query(query, null)
    },

    async getById(id) {
        const query = `SELECT * FROM ${table_name} where id = ${id}`
        const users = await database.query(query, null)
        if(users.length === 0)
            return null;
        return users[0]
    },

    async add(entity)
    {
        const result = await database.add(entity, table_name)
        const rows = await database.query(`SELECT * FROM ${table_name} WHERE bucket_id = ${result.insertId}`)
        if (rows.length === 0)
            return null
        return rows[0]
    },

    async del(id)
    {
        const condition = {bucket_id : id}
        let result = await database.delete(condition, table_name)
        return result
    }
}