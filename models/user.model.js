const db = require('../utils/db')
const statusModel = require('../models/status.model')
const table_name = 'users'

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
    }
}