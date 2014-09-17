var gulp = require('gulp');

var jade = require('gulp-jade');

gulp.task('templates', function() {
    gulp.src('app/assets/templates/*.jade')
        .pipe(jade())
        .pipe(gulp.dest('./dist/'))
});