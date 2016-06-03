'use strict';

var request = require('request');
var BASE_URL = process.env.API_URL;

var url = BASE_URL + '/info';

request(url, function (err, res, body) {
  if (err) {
    //API is not accessible, test failed
    console.log('Unable to access API');
    process.exit(1);
  }

  console.log(body);

  var jsonRes = JSON.parse(body);
  //Check whether API returns time
  if (jsonRes.time) {
    //Test passed
    process.exit(0);
  } else {
    //Test failed
    process.exit(1);
  }
});
