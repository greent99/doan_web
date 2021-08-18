
const db = require('../utils/db');
const table_course = 'courses';
const table_user_course = 'user_course';
const table_ratings = 'ratings'
const table_lessons = 'lessons'

module.exports = {
    async all(page, pageSize) {
        const offset = (page - 1) * pageSize
        return db(table_course).join('users', 'courses.author', 'users.id').join('fields', 'courses.field', 'fields.id')
            .select('courses.*', 'users.fullname as author_name', 'fields.name as field_name')
            .limit(pageSize).offset(offset)
    },

    async getSizeAll () {
        return db(table_course)
    },

    async getById(id) {
        const courses = await db(table_course).where('courses.id', id).join('users', 'courses.author', 'users.id').join('fields', 'courses.field', 'fields.id')
            .select('courses.*', 'users.fullname as author_name', 'fields.name as field_name')
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
    async getCountSearch(keySearch, typeFilter, category)
    {
        let query = db(table_course)
        if(keySearch)
            query = query.where('name', 'like', `%${keySearch}%`)
        if(category && category != 'all')
            query =  query.where('field', category);
        

        return query
    },

    async search(keySearch, pageIndex, pageSize, typeFilter, category) {
        let offset = (pageIndex - 1) * pageSize;
        let query = db(table_course)
        if(keySearch)
            query = query.where('name', 'like', `%${keySearch}%`)
        if(category && category != 'all')
            query =  query.where('field', category);
        if(typeFilter === 'priceAsc')
            query.orderBy('price', 'asc')
        if(typeFilter === 'priceDesc')
            query.orderBy('price', 'desc')
        query = query.limit(pageSize).offset(offset);

        return query
    },

    async getTopNewCourse(top){
        return db(table_course).orderBy('uploaddate', 'desc')
            .join('users', `${table_course}.author`, 'users.id')
            .limit(top)
            .select('courses.*', 'users.fullname as author_name' )
    },

    //get 10 most registered courses
    async getTop10Most(){
        return db(table_user_course)
    },

    async getTopPopular(top){
        return db(table_course).orderBy('viewscount', 'desc').
            join('users', `${table_course}.author`, 'users.id')
            .limit(top)
            .select('courses.*', 'users.fullname as author_name' )
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
     },

    async create(course){
        return db(table_name).insert(course).returning('id')
     },

     async getReviews(id) {
        return db(table_ratings).where('courseid', id).orderBy('createddat', 'desc')
     },

     async addReview(id, review)
     {
         review.courseid = id
         return await db(table_ratings).insert(review).returning('id')
     },

     async addToWatchList (id, userid) {
        const user_course = await db('user_course').where('userid', userid).where('courseid', id)
        if(user_course.length > 0)
            await db('user_course').where('userid', userid).where('courseid', id)
                .update({isinwatchlist: true})
        else
            await db('user_course').insert({
                courseid: id,
                userid,
                isinwatchlist: true
            })
     },

     async addLesson (courseid, lesson) {
        return await db(table_lessons).insert(lesson).returning('id')
     },

     async getLesson (courseid) {
         return db(table_lessons).where('courseid', courseid)
     },

     async checkUserInCourse (courseid, userid)
     {
         return db(table_user_course).where('userid', userid).where('courseid', courseid)
     },

     async increaseView(courseid) {
         const course = await this.getById(courseid)
         console.log(course)
         const totalView = course.viewscount + 1
         return db(table_course).where('id', courseid).update({
            viewscount: totalView
         })
     }
}