gulp         = require 'gulp'
clean        = require 'gulp-clean'
concat       = require 'gulp-concat'
prefix       = require 'gulp-autoprefixer'
jade         = require 'gulp-jade'
jshint       = require 'gulp-jshint'
livereload   = require 'gulp-livereload'
stylus       = require 'gulp-stylus'
uglify       = require 'gulp-uglify'
gutil        = require 'gulp-util'
watch   	   = require 'gulp-watch'

parameters   = require '../config/parameters.coffee'

## ------------------
## ----  BUILD  -----
## ------------------

## --- JavaScript
## ------------------
gulp.task 'scripts', ->
  gulp.src parameters.js_folder + '*.js'
  .pipe jshint()

## --- Jade Templates
## ------------------
gulp.task 'templates', () ->
  gutil.log(gutil.colors.magenta('Compiling Jade files'))
	gulp.src('../app/assets/templates/*.jade')
	  .pipe(jade( pretty: true))
	  .pipe(gulp.dest('../dist/'))

## --- Stylesheets
## ------------------
gulp.task 'styles', ->
  gutil.log gutil.colors.green 'Compiling STYLUS'
  gulp.src '../app/assets/stylesheets/main.styl'
  .pipe stylus()
  .pipe prefix()
  .pipe gulp.dest '../dist/css/'



## ------------------
## ----  DIST   -----
## ------------------

## --- Concat
## ------------------
gulp.task 'concat', ->
  gulp.src '../app/assets/.css'
  .pipe concat 'main.min.css'
  .pipe gulp.dest '../dist/css/'

## --- Uglify
## ------------------
gulp.task 'uglify', ->
  gulp.src '../dist/js/*.js'
  .pipe uglify()
  .pipe gulp.dest '../dist/js/*.js'



## --- Server
## ------------------
gulp.task 'server', ->
  livereload.listen()


## --- Mr. Clean
## ------------------
gulp.task 'clean', ->
  gutil.log gutil.colors.red 'cleaning out the closet'
  gulp.src '../dist'
  .pipe clean 
    read : false
    force: true

## --- Watch
## ------------------
gulp.task 'watch', ->

  gutil.log gutil.colors.magenta 'watching JS: ' + parameters.js_folder + '*.js'
  gulp.watch parameters.js_folder           + '*.js',   ['scripts']
  
  gutil.log gutil.colors.magenta 'watching Jade: ' + parameters.templates_folder + '*.jade'
  gulp.watch parameters.templates_folder    + '*.jade', ['templates']
  
  gutil.log gutil.colors.magenta 'watching Stylus: ' + parameters.stylesheets_folder + '*.styl'
  gulp.watch parameters.stylesheets_folder  + '*.styl', ['styles'] 


## ------------------
## ----  TASKS  -----
## ------------------
gulp.task 'build', ['clean','scripts', 'templates', 'styles' ]

gulp.task 'dist', ['build','concat','uglify'] 

gulp.task 'default', ['build','server', 'watch']

