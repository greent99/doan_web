const express = require('express');
const router = express.Router();
const courseController = require('../controllers/course.controller');

router.get('/', courseController.getAll)

router.post('/', courseController.create);

router.get('/:id/reviews', courseController.getReview);

router.get('/getTopPopular', courseController.getTopPopular)

router.get('/getTopNewest', courseController.getTopNewest)

router.get('/:id', courseController.getById);

router.post('/:id/addReview', courseController.addReview)

router.post('/:id/addToWatchList', courseController.addToWatchList)

router.post('/:id/addLesson', courseController.addLesson)

router.get('/:id/lessons', courseController.getLesson)

router.post('/:id/checkUserInCourse', courseController.checkUserInCourse)

router.post('/:id/increaseView', courseController.increaseView)

router.delete('/:id/deleteOfTeacher', courseController.deleteOfTeacher)





module.exports = router; 