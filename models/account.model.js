const db = require('../utils/db')
const table_name = 'accounts'
const crypto = require('crypto')
const randomstring = require('randomstring');
const sendMail = require('../helpers/sendmail.helper')

module.exports = {
    async getAll (page, type) {
        let offset = (page - 1) * 10;
        let query = db(table_name)
        if(type && type != 'All')
            query = query.where('userType', type)
        query = query.limit(10).offset(offset)
        return query
    },

    async singleByEmail(email) {
        const accounts = await db(table_name).where('email', email)
        if(accounts.length === 0)
            return null
        return accounts[0]
    }, 

    async getUserById (id) {
        return db(table_name).join('users', 'accounts.userid', 'users.id').where('accounts.id', id)
            .select('accounts.*', 'users.id as userid')
    },

    async singleById(id) {
        const accounts = await db(table_name).join('users', 'accounts.userId', 'users.id').where('accounts.id', id)
                        .select('accounts.id', 'accounts.email', 'accounts.username', 'accounts.gender', 'accounts.userType', 'accounts.statuscode', 'accounts.userid', 'users.fullname', 'users.address')
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
        return db(table_name).where('id', id).update('refresh_token', rfToken);
    },

    async isValidRFToken(id, rfToken) {
        const list = await db(table_name).where('id', id).andWhere('refresh_token', rfToken);
        if (list.length > 0) {
          return true;
        }
    
        return false;
    },

    async getOtp(hostname, protocol, account) {
		if (hostname === 'localhost') 
            hostname += ":" + process.env.PORT;

		const otp = randomstring.generate(6);
		const otpExpired = new Date();
		otpExpired.setDate(otpExpired.getDate() + 7);
		
		sendMail( account.email, `
            <b>Welcome to Elearning Website: </b>
            <p><a href="http://${hostname}/api/auth/activate-email?email=${account.email}&&otp=${otp}">CLICK HERE TO CONFIRM YOUR ACCOUNT</a></p>
            <p>This link will expired in 7 days</p>`
        );
		await db(table_name).where('id', account.id).update('otp', otp).update('otpExpired', otpExpired)
	},

    async add(account){
        const [userId] = await db(table_name).insert(account).returning('id')
        return userId
    },

    async update (id, data) {
        const {gender, username, fullname} = data
        const accounts = await db(table_name).where('id', id)
        if(accounts.length === 0)
            return null;

        await db('users').where('id', accounts[0].userid).update({fullname})
        await db(table_name).where('id', id).update({gender, username})
        return true
    },

    async delete(id)
    {
        return db(table_name).where('id', id).del()
    }
}
