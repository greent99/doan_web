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

}