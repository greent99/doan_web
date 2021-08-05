const { search } = require('../models/course.model');
const courseModel = require('../models/course.model');

module.exports = {
    async search(req, res) {
        const keySearch = req.query.keySearch;
        const pageIndex = req.query.pageIndex;
        const pageSize = req.query.pageSize;
        const typeFilter = req.query.typeFilter;

        const courses = await courseModel.search(keySearch, pageIndex, pageSize, typeFilter);
        const totalRow = await courseModel.getCountSearch(keySearch, typeFilter);

        return res.status(200).json({
            listCourse: courses[0][0],
            total: totalRow[0][0][0].count
        });
    }
}