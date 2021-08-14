var express = require('express');
var router = express.Router();
const {isAuth} = require('../middlewares/auth.mdw')
const fieldController = require('../controllers/field.controller')

/* GET home page. */

router.get('/', fieldController.getAll);

router.post('/', fieldController.create)

router.get('/:id', fieldController.getById);

router.put('/:id', fieldController.update)

router.delete('/:id', fieldController.delete)

module.exports = router;
