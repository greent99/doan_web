const db = require('../utils/db');
const { all, getById, add } = require('./user.model');
const table_course = 'courses';
const table_user_course = 'user_course';

module.exports = {
    async all() {
        return db(table_course);
    },

    async getById(id) {
        const courses = await db(table_course).where('id', id)
        if (courses.length === 0)
            return null
        return courses[0];
    },

    async add(course) {
        return db(table_course).insert(course);
    },

    async del(id) {
        const course = await getById(id);
        if (course.length === 0)
            return;
        return db(table_course).where('id', id).del();
    },

    async update(course) {
        const tmpCourse = await getById(course.id);
        if (tmpCourse.length === 0)
            return;
    },

    // query full text search
    // typeFilter: 0-default, 1-price asc, 2-price desc, 3-have promotion
    async getCountSearch(keySearch, typeFilter)
    {
        return db.raw(`CALL SearchCourseCount('${keySearch}', ${typeFilter})`);
    },

    async search(keySearch, pageIndex, pageSize, typeFilter) {
        let offset = (pageIndex - 1) * pageSize;
        return db.raw(`CALL SearchCourse('${keySearch}', ${offset},  12, ${typeFilter})`);
    },

    async getTop10NewCourse(){
        return db(table_course).orderBy('uploaddate').limit(10);
    },

    //get 10 most registered courses
    async getTop10Most(){
        return db(table_user_course)
    },

    //get 3-4 most prominent
    async getMostProminent()
    {
        return db.raw(`SELECT count(*), uc.*, cr.* from categories as cr join courses as c on
         cr.id = c.categoryId join user_course as uc on c.id = uc.courseid group by cr.id order by
         count(*) desc limit 4`);
    },
    
     async getCourseByCategoryId(categoryId)
     {
         return db(table_course).where('categoryId', categoryId);
     }
}