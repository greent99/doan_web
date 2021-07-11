const express = require('express');
const lessonModel = require('../models/lesson.model');

const router = express.Router();

router.get('/detail/:courseid/:lessonid', async function(req, res) {
    const courseid = +req.params.courseid;
    const lessonid = +req.params.lessonid;
    const lesson = await lessonModel.getLessonDetail(courseid, lessonid);
    if (lesson === null) {
        return res.status(204).end();
    }

    res.json(lesson);
})

router.get('/video/:courseid/:lessonid', async function(req, res) {
    const courseid = +req.params.courseid;
    const lessonid = +req.params.lessonid;
    const lesson = await lessonModel.getVideoByLesson(courseid, lessonid);
    if (lesson === null) {
        return res.status(204).end();
    }

    res.json(lesson);
})

// const schema = require('../schemas/film.json');
// router.post('/', require('../middlewares/validate.mdw')(schema), async function(req, res) {
//     const film = req.body;
//     const ids = await filmModel.add(film);
//     film.film_id = ids[0];
//     res.status(201).json(film);
// })

// router.delete('/:id', function(req, res) {

// })


module.exports = router;