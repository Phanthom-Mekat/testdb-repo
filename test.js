const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'sql12.freesqldatabase.com',
    user: 'sql12719594',
    password: 'GHYRx2vI2f',
    database: 'sql12719594',
    port: 3306,
    connectionLimit: 10
});

pool.query('select * from tbl_review', (err, results, fields) => {
   if(err){
       return console.log(err.message);
    }
     return console.log(results);
});

// const ReviewID = 60000008;
// pool.query('select * from tbl_review where ReviewID=? ',[ReviewID], (err, results, fields) => {
//     if(err){
//         return console.log(err.message);
//     }
//     return console.log(results);
// });

module.exports = pool;


