const db = require('../utils/db');
const table_name = 'lessons';

module.exports = {
    async all() {
        return db(table_name)
    },

    async getLessonDetail(courseid, lessonid) {
        const lessons = await db(table_name).where('courseid', courseid).andWhere('id', lessonid);
        if (lessons.length === 0)
            return null;
        return lessons[0]
    },

    patch(lesson) {
        return db(table_name).where('id', lesson.id).update(lesson);
    },


    async single(id) {
        const lessons = await db(table_name).where('id', id);
        if (lessons.length === 0) {
            return null;
        }

        return lessons[0];
    },

    add(lesson) {
        return db(table_name).insert(lesson);
    },

    del(id) {
        return db(table_name).where('id', id).del();
    }

}