const express = require('express');
const router = express.Router();
const courseController = require('../controllers/course.controller');

router.get('/', courseController.getAll)

router.post('/', courseController.create);

router.get('/:id/reviews', courseController.getReview);

router.get('/:id', courseController.getById);

router.post('/:id/addReview', courseController.addReview)

router.post('/:id/addToWatchList', courseController.addToWatchList)

router.post('/:id/addLesson', courseController.addLesson)



module.exports = router; 