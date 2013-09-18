(function(){
    var scriptFiles = [
        'src/*.coffee'
    ];

    module.exports = function(grunt) {
        grunt.initConfig({
            coffee: {
                compile: {
                    options:{
                        join: false,
                        sourceMap: false
                    },
                    files: [{
                        expand: true,
                        cwd: "src",
                        src: "*.coffee",
                        dest: "./",
                        ext: ".js"
                    }]
                }
            },
            watch: {
                scripts: {
                    files : scriptFiles,
                    tasks: ['coffee:compile','test'],
                    options: {
                        interrupt: true,
                    },
                },
                test: {
                    files: [
                        'test/**/*.js'
                    ],
                    tasks: ['test']
                },
            },
            exec: {
                test: {
                    // command: 'node test/mocha-runner.js',
                    command: 'echo "tests not implemented"',
                    stdout: true
                }
            },
            notify_hooks: {
                options: {
                    enabled: true,
                    max_jshint_notifications: 3, // maximum number of notifications from jshint output
                    title: "twain"
                }
            }
        });

        // Default task
        grunt.registerTask('compile', ['coffee'])
        grunt.registerTask('dev', ['compile','watch']);
        grunt.registerTask('default','dev');
        grunt.registerTask('test', ['exec:test']);
        grunt.loadNpmTasks('grunt-contrib-watch');
        grunt.loadNpmTasks('grunt-contrib-coffee');
        grunt.loadNpmTasks('grunt-notify');
        grunt.loadNpmTasks('grunt-exec');

        // This is required if you use any options.
        grunt.task.run('notify_hooks');
    }; // module.exports

})();
