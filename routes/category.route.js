const express = require('express');
const router = express.Router();
const categoryController = require('../controllers/category.controller');

router.get('/getAll', categoryController.getAll);

module.exports = router; 