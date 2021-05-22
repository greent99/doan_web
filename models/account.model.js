const db = require('../utils/db')
const table_name = 'accounts'
const crypto = require('crypto')

module.exports = {
    async singleByEmail(email) {
        const accounts = await db(table_name).where('email', email)
        if(accounts.length === 0)
            return null
        return accounts[0]
    }, 

    async singleById(id) {
        const accounts = await db(table_name).where('id', id)
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

    patchRFToken(id, rfToken) {
        return db('accounts').where('id', id).update('refresh_token', rfToken);
    },

    async isValidRFToken(id, rfToken) {
        const list = await db('accounts').where('id', id).andWhere('refresh_token', rfToken);
        if (list.length > 0) {
          return true;
        }
    
        return false;
    },

    async add(account){
        return db(table_name).insert(account)
    }
}