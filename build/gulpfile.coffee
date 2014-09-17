gulp         = require 'gulp'
gutil        = require 'gulp-util'
coffee  	   = require 'gulp-coffee'
concat       = require 'gulp-concat'
clean        = require 'gulp-clean'
jade    	   = require 'gulp-jade'
jshint  	   = require 'gulp-jshint'
livereload 	 = require 'gulp-livereload'
stylus		   = require 'gulp-stylus'
watch   	   = require 'gulp-watch'

parameters   = require '../config/parameters.coffee'

gulp.task 'coffee', ->
  console.log('hello world')
  gulp.src 'build/gulpfile.coffee'
  .pipe coffee bare: true


gulp.task 'scripts', ->
  gulp.src parameters.js_folder + '*.js'
  .pipe jshint()


gulp.task 'templates', () ->
  gutil.log(gutil.colors.magenta('Compiling Jade files'))
	gulp.src('../app/assets/templates/*.jade')
	  .pipe(jade( pretty: true))
	  .pipe(gulp.dest('../dist/'))


gulp.task 'styles', ->
  gutil.log gutil.colors.green 'Compiling STYLUS'
  gulp.src '../app/assets/stylesheets/*.styl'
  .pipe stylus()
  .pipe concat ('main.min.css')
  .pipe gulp.dest '../dist/css/'


gulp.task 'server', ->
  livereload.listen()


gulp.task 'watch', ->
  gulp.watch parameters.js_folder           + '*.js',   ['scripts']
  gulp.watch parameters.templates_folder    + '*.jade', ['templates']
  gulp.watch parameters.stylesheets_folder  + '*.styl', ['styles'] 


gulp.task 'build', ['coffee','scripts', 'templates', 'styles' ] 

gulp.task 'default', ['build','server', 'watch']


## TODO

gulp.task 'clean', ->
  gutil.log gutil.colors.red 'cleaning out the closet'
  gulp.src '../dist'
  .pipe clean 
    read : false
    force: true




