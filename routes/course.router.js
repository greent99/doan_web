const express = require('express');
const router = express.Router();
const courseController = require('../controllers/course.controller');

router.get('/search', courseController.search);

module.exports = router; 