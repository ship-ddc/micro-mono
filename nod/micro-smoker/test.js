'use strict';

var superagent = require('superagent');
var chai = require('chai');
var expect = chai.expect;
var should = require('should');

var url = process.env.API_URL + '/info';

describe('Info page', function () {
  it('Basic Site Availability Test',
    function (done) {
      superagent.get(process.env.API_URL)
        .end(function (err, res) {
          (err === null).should.equal(true);
          res.statusCode.should.equal(200);
          done();
        });
    });
});

describe('Info page', function () {
  describe('Time field', function () {
    it('Checking Info route payload for consistency', function (done) {
      superagent.get(url)
        .end(function (err, res) {
          (err === null).should.equal(true);
          res.statusCode.should.equal(200);
          should.exist(res.body.time);
          done();
        });
    });
  });
});
