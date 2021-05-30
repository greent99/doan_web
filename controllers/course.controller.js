const { search } = require('../models/course.model');
const courseModel = require('../models/course.model');

module.exports = {
    async search(req, res) {
        const keySearch = req.query.keySearch;
        const pageIndex = req.query.pageIndex;
        const pageSize = req.query.pageSize;

        const courses = await courseModel.search(keySearch, pageIndex, pageSize);
        const totalCourse = await courseModel.totalCourse(keySearch);

        return res.status(200).json({
            listCourse: courses,
            total: totalCourse
        });
    }
}