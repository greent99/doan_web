const userModel = require('../models/user.model')

module.exports = {
    async profile (req, res) {
        return res.status(200).json({
            message: 'oke'
        })
    }
}