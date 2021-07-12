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

const schema = require('../schema/lesson.json');

router.post('/', require('../middlewares/validate.mdw')(schema), async function(req, res) {
    const lesson = req.body;
    const ids = await lessonModel.add(lesson);
    lesson.id = ids[0];
    res.status(201).json(lesson);
})

router.put('/:id', require('../middlewares/validate.mdw')(schema), async function(req, res) {
    const id = await lessonModel.single(req.params.id);
    if (id === null) {
        res.status(400).send({ message: 'id does not exits' });
    } else {
        var lesson = req.body;
        lesson.id = id.id;
        const ids = await lessonModel.patch(lesson);
        res.status(201).json(lesson);
    }
})

router.delete('/:id', async function(req, res) {
    const id = await lessonModel.single(req.params.id);
    if (id === null) {
        res.status(400).send({ message: 'id does not exits' });
    } else {
        const lesson = await lessonModel.del(req.params.id);
        res.status(204).end();
    }
})

module.exports = router;