const database = require('../utils/db')
const table_name = 'accounts'
const crypto = require('crypto')

module.exports = {
    async getByEmail(email) {
        const query = `SELECT * FROM ${table_name} where email = ${email}`
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
    }
}