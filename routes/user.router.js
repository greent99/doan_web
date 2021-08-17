var express = require('express');
var router = express.Router();
const {isAuth} = require('../middlewares/auth.mdw')
const userController = require('../controllers/user.controller.js')

/* GET home page. */
router.get('/me', isAuth, userController.profile);

router.get('/', userController.getAll);

router.post('/', userController.create)

router.post('/:id/enrollCourse', userController.enrollCourse)

router.get('/:id', userController.getById);

router.put('/:id', userController.update)

router.delete('/:id', userController.delete)

router.get('/getByRole/:type', userController.getByRole)

module.exports = router;
