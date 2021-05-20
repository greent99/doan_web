const database = require('../utils/db')
const table_name = 'accounts'
const crypto = require('crypto')

module.exports = {
    async singleByEmail(email) {
        const query = `SELECT * FROM ${table_name} where email = "${email}"`
        const accounts = await database.query(query, null)
        if(accounts.length === 0)
            return null
        return accounts[0]
    }, 

    async singleById(id) {
        const query = `SELECT id, email, createdat FROM ${table_name} where id = ${id}`
        const accounts = await database.query(query, null)
        if(accounts.length === 0)
            return null
        return accounts[0]
    },

    setPassword(password, account)
    {
        account.salt = crypto.pseudoRandomBytes(16).toString('hex')
        account.hash = crypto.pbkdf2Sync(password, account.salt, 1000, 64, 'sha512').toString('hex')
    },

    validPassword(inputPassword, account){
        if(account.hash && account.salt){
            const hash = crypto.pbkdf2Sync(inputPassword, account.salt, 1000, 64, 'sha512').toString('hex')
            return account.hash === hash
        }
        return false
    },

    async add(entity){
        const result = await database.add(entity, table_name)
        const rows = await database.query(`SELECT * FROM ${table_name} WHERE id = ${result.insertId}`)
        if (rows.length === 0)
            return null
        return rows[0]
    }
}