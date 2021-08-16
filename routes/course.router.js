const express = require('express');
const router = express.Router();
const courseController = require('../controllers/course.controller');

router.get('/search', courseController.search);

router.get('/', courseController.getAll)

router.post('/', courseController.create);

router.get('/:id', courseController.getById);

module.exports = router; 