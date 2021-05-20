const mysql = require('mysql2')

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
});

const getConnection = function() {
    return new Promise((resolve, reject) => {
        pool.getConnection(((err, connection) => {
            if (err) return reject(err);
            return resolve(connection);
        }))
    });
}

module.exports = {
    queryWithLimit(sql, connection, pageIndex, pageSize) {
        pageIndex = pageIndex || 1;
        pageSize = pageSize || 100;
        return new Promise((resolve, reject) => {
            const thisConnection = connection || pool;
            const query = sql + ` LIMIT ${(pageIndex - 1) * pageSize}, ${pageSize}`;
            console.log(query)
            thisConnection.query(query, (error, results) => {
                if (error) return reject(error);
                return resolve(results);
            });
        });
    },

    queryWithCondition(sql, condition, connection) {
        return new Promise((resolve, reject) => {
            const thisConnection = connection || pool;
            thisConnection.query(sql, condition, (err, results) => {
                if (err) return reject(err);
                resolve(results);
            })
        })
    },

    query(sql, connection) {
        return new Promise((resolve, reject) => {
            const thisConnection = connection || pool;
            thisConnection.query(sql, function(error, results) {
                if (error) return reject(error);
                resolve(results);
            });
        })
    },

    add(entity, tableName, connection) {
        return new Promise((resolve, reject) => {
            const thisConnection = connection || pool;
            thisConnection.query(`insert into ${tableName} set ?`, entity, (error, results) => {
                if (error) return reject(error);
                resolve(results);
            })
        })
    },

    delete(condition, tableName, connection) {
        return new Promise((resolve, reject) => {
            const thisConnection = connection || pool;
            thisConnection.query(`delete from ${tableName} where ?`, condition, (error, results) => {
                if (error) return reject(error);
                resolve(results);
            })
        })
    },

    update(entity, condition, tableName, connection) {
        return new Promise((resolve, reject) => {
            const thisConnection = connection || pool;
            thisConnection.query(`update ${tableName} set ? where ?`, [entity, condition], (error, results) => {
                if (error) return reject(error);
                resolve(results);
            })
        })
    },

    getConnection
}