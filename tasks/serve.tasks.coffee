config = require './.tasks.config.coffee'

module.exports = (gulp, $) ->
  bsInit = (baseDir) ->
    $.browserSync.init {
      server: {
        baseDir: baseDir,
        routes: {
          '/bower_components': 'bower_components'
        }
      }
    }

  gulp.task 'serve:dist', config.serveTasks, () ->
    bsInit 'dist'

  gulp.task 'serve:tmp', config.serveTasks, () ->
    bsInit [ '.tmp', 'src' ]

  gulp.task 'serve:tmp:live', [ 'serve:tmp' ], () ->
    gulp.start 'watch'

  gulp.task 'serve:dist:live', [ 'serve:dist' ], () ->
    gulp.start 'watch'
