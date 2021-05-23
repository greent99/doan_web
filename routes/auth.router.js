const express = require('express');
const router = express.Router();
const authController = require('../controllers/auth.controller')
const registerUserSchema = require('../schema/registerUser.json')
const loginUserSchema = require('../schema/loginUser.json')
const refreshUserSchema = require('../schema/refreshTokenUser.json')
const validator = require('../middlewares/validate.mdw')

router.post('/register', validator(registerUserSchema), authController.register)

router.post('/login', validator(loginUserSchema), authController.login)

router.post('/refresh', validator(refreshUserSchema), authController.refresh)

router.post('/send-activate-mail', authController.sendMailToActive)

router.get('/activate-email', authController.activateEmail)

module.exports = router; 