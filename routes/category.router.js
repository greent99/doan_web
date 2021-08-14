var express = require('express');
var router = express.Router();
const {isAuth} = require('../middlewares/auth.mdw')
const categoryController = require('../controllers/category.controller')

/* GET home page. */

router.get('/', categoryController.getAll);

router.post('/', categoryController.create)

router.get('/:id', categoryController.getById);

router.put('/:id', categoryController.update)

router.delete('/:id', categoryController.delete)

module.exports = router;
