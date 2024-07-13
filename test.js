const mysql = require('mysql2');

const pool =mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'mekat',
    database:'testdb',
    connectionLimit: 10
});

// pool.query('select * from tbl_review', (err, results, fields) => {
//     if(err){
//         return console.log(err.message);
//     }
//     return console.log(results);
// });

// const ReviewID = 60000008;
// pool.query('select * from tbl_review where ReviewID=? ',[ReviewID], (err, results, fields) => {
//     if(err){
//         return console.log(err.message);
//     }
//     return console.log(results);
// });

module.exports = pool;


