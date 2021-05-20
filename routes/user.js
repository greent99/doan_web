const express = require('express');
const router = express.Router();
const userController = require('../controllers/user.controller')
const registerUserSchema = require('../schema/registerUser.json')
const validator = require('../middlewares/validate.mdw')

router.route('/me')
  .get(userController.getAll);

router.post('/register', validator(registerUserSchema), userController.register)

module.exports = router;