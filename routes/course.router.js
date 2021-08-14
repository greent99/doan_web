const express = require('express');
const router = express.Router();
const courseController = require('../controllers/course.controller');

router.get('/search', courseController.search);

router.post('/create', courseController.create);

module.exports = router; 