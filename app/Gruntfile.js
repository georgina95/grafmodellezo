'use strict';

module.exports = function (grunt) {

    grunt.initConfig({
        dir: {
            webapp: 'app',
            dist: 'dist'
        },
        copy: {
            dist: {
                files: [
                    {
                        expand: true,
                        cwd: '<%=dir.app%>',
                        src: ['**', '!test/**'],
                        dest: '<%=dir.dist%>'
                    }

                ]
            }
        },

        clean: {
            dist: '<%=dir.dist%>'
        },

        openui5_preload: {
            component: {
                options: {
                    resources: {
                        cwd: 'webapp',
                        prefix: 'app/webapp',
                        src: ['**/*.js',
                            '**/*.fragment.xml',
                            '**/*.view.xml',
                            '**/*.properties',
                            'manifest.json',
                            '!test/**'
                        ]
                    },
                    dest: 'dist'
                },
                components: 'app/webapp'
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-openui5');

    //BUILD TASK
    grunt.registerTask('build', ['clean:dist', 'openui5_preload', 'copy']);

    //DEFAULT TASK
    grunt.registerTask('default', ['clean', 'build']);

};