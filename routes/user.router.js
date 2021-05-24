var express = require('express');
var router = express.Router();
const {isAuth} = require('../middlewares/auth.mdw')
const userController = require('../controllers/user.controller.js')

/* GET home page. */
router.get('/me', isAuth, userController.profile);

module.exports = router;
