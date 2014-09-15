gulp         = require 'gulp'
coffee  	   = require 'gulp-coffee'
jade    	   = require 'gulp-jade'
jshint  	   = require 'gulp-jshint'
livereload 	 = require 'gulp-livereload'
stylus		   = require 'gulp-stylus'
watch   	   = require 'gulp-watch'

parameters   = require '../config/parameters.coffee'

gulp.task 'coffee', ->
  console.log('hello')
  gulp.src 'build/gulpfile.coffee'
  .pipe coffee bare: true

gulp.task 'scripts', ->
  gulp.src parameters.js_folder + '*.js'
  .pipe jshint()

gulp.task 'templates', ->
	gulp.src parameters.templates_folder + '*.jade'
	.pipe jade()
	.pipe gulp.dest parameters.web_path

gulp.task 'styles', ->
  gulp.src parameters.styles_main_file
  .pipe stylus()
  .pipe gulp.dest parameters.web_path+'/css'

gulp.task 'server', ->
  livereload.listen()

gulp.task 'default', ['coffee','scripts', 'templates', 'styles', 'server'] 