require('xunit-file');

module.exports = function (grunt) {
  grunt.initConfig({
    'mocha-hack': {
      options: {
        globals: ['should'],
        timeout: 30000,
        ignoreLeaks: false,
        ui: 'bdd',
        reporter: 'xunit-file'
      },
      all: { src: ['./test.js'] }
    }
  });
  grunt.loadNpmTasks('grunt-mocha-hack');
  grunt.registerTask('default', [ 'mocha-hack:all']);
};
