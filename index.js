const pool = require('./test.js');

document.getElementById('submit').addEventListener('click', function() {
    var input = parseInt(document.getElementById('input').value);
    var result = document.getElementById('result');

    pool.query('SELECT * FROM tbl_review WHERE ReviewID = ?', [input], (err, results, fields) => {
        if (err) {
            console.log(err.message);
            result.textContent = 'Error fetching data';
            return;
        }
        if (results.length > 0) {
            // Assuming you want to print the first result's review value
            result.textContent = results[0].Description;
            console.log(results)
              // Adjust this to the correct field name
        } else {
            result.textContent = 'No review found with this ID';
        }
    });
});
