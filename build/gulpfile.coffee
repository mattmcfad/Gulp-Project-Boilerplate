gulp         = require 'gulp'
gutil        = require 'gulp-util'
coffee  	   = require 'gulp-coffee'
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
  gutil.log('Compiling Jade', gutil.colors.red('files'))
	gulp.src('../app/assets/templates/*.jade')
	  .pipe(jade( pretty: true))
	  .pipe(gulp.dest('../dist/'))


gulp.task 'styles', ->
  gulp.src parameters.stylesheets_folder + '*.stylus'
  .pipe stylus()
  .pipe gulp.dest parameters.web_path + '/css'


gulp.task 'server', ->
  livereload.listen()


gulp.task 'watch', ->
  gulp.watch parameters.js_folder           + '*.js',   ['scripts']
  gulp.watch parameters.templates_folder    + '*.jade', ['templates']
  gulp.watch parameters.stylesheets_folder  + '*.styl', ['styles'] 


gulp.task 'build', ['coffee','scripts', 'templates', 'styles' ] 

gulp.task 'default', ['build','server', 'watch']




