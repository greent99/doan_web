const categoryModel = require('../models/category.model');

module.exports = {
    async getAll(){
        const categogies = await categoryModel.all();
        return res.status(200).json({
            categories: categogies
        });
    }
}