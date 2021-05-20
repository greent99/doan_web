const jwtHelper = require('../helpers/jwt.helper')
const accessTokenSecret = process.env.ACCESS_TOKEN_SECRET || "access-token-greent-25-02-1999"

let isAuth = async (req, res,next) => {
    const tokenFromClient = req.body.token || req.query.token || req.header['x-access-token']

    if(tokenFromClient)
    {
        try {
            const decode = await jwtHelper.verifyToken(tokenFromClient, accessTokenSecret)

            req.jwtDecoded = decode

            next()
        } catch (err) {
            console.log(`Error while verify token: ${err}`)
            return res.status(401).json({
                messesage: 'Unauthorized'
            })
        }
    }
    else
    {
        return res.status(403).json({
            messesage: 'No token provided'
        })
    }
}

module.exports = {
    isAuth: isAuth
}
