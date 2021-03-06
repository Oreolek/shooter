'use strict';

/* Imports */
var watchify    = require('watchify'),
    browserify  = require('browserify'),
    browserSync = require('browser-sync'),
    gulp        = require('gulp'),
    source      = require('vinyl-source-stream'),
    gutil       = require('gulp-util'),
    coffeify    = require('coffeeify'),
    sass        = require('gulp-sass'),
    minifyCSS   = require('gulp-minify-css'),
    uglify      = require('gulp-uglify'),
    buffer      = require('vinyl-buffer'),
    zip         = require('gulp-zip'),
    _           = require('lodash'),
    concat      = require('gulp-concat');

var reload = browserSync.reload;

/* Tasks */

/* Trivial file copies */

function html (target) {
  return function () {
    return gulp.src(['html/index.html','html/en.html'])
          .pipe(gulp.dest(target));
    };
}

function img (target) {
  return function () {
    return gulp.src(['img/*.png', 'img/*.jpeg', 'img/*.jpg'])
          .pipe(gulp.dest(target));
    };
}

function audio (target) {
  return function () {
    return gulp.src(['audio/*.mp3'])
          .pipe(gulp.dest(target));
    };
}

gulp.task('html', html('./build'));
gulp.task('img', img('./build/img'));
gulp.task('audio', audio('./build/audio'));

/* Less */

gulp.task('sass', function () {
  gulp.src('sass/main.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./build/css'));
});

/* Bundle libraries */

var undumBundler = browserify({debug: true});
undumBundler.require('undum-commonjs');

gulp.task('buildUndum', function () {
  return undumBundler.bundle().pipe(source('undum.js')).pipe(gulp.dest('./build/game'));
});

/* Generate JavaScript with browser sync. */

var sources = [
  './game/begin.coffee',
  './game/gameplay.coffee',
  './game/story.coffee',
  './game/end.coffee',
]

var opts = _.assign({}, watchify.args, {
  entries: ["./build/game/main.coffee"],
  debug: true,
  transform: [coffeify]
});
var bundler = watchify(browserify(opts));
bundler.external('undum-commonjs');

function bundle () {
  return bundler.bundle()
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source('bundle.js'))
    .pipe(gulp.dest('./build/game'));
};

gulp.task('copyTranslations', [], function() {
  gulp.src('./game/translations/*.coffee')
    .pipe(gulp.dest('./build/game/translations'));
});

gulp.task('concatCoffee', ['copyTranslations'], function() {
  return gulp.src(sources)
    .pipe(concat('./main.coffee'))
    .pipe(gulp.dest('./build/game'));
});

// `gulp coffee` will generate bundle
gulp.task('coffee', ['buildUndum', 'concatCoffee'], bundle);

bundler.on('update', bundle); // Re-bundle on dep updates
bundler.on('log', gutil.log); // Output build logs to terminal

/* Make a development build */

gulp.task('build', ['html', 'img', 'sass', 'coffee', 'audio'], function () {

});

/* Start a development server */

gulp.task('serve', ['build'], function () {
  browserSync({
    server: {
      baseDir: 'build'
    }
  });

  var sassListener = function () {
    reload('./build/css/main.css');
  }

  gulp.watch(['./html/*.html'], ['html']);
  gulp.watch(['./sass/*.scss'], ['sass']);
  gulp.watch(['./img/*.png', './img/*.jpeg', './img/*.jpg'], ['img']);
  gulp.watch(['./game/*.coffee', './game/translations/*.coffee'], ['coffee']);

  gulp.watch(['./build/css/main.css'], sassListener);
  gulp.watch(
    ['./build/game/bundle.js', './build/img/*', './build/index.html'],
    browserSync.reload);
});

/* Distribution tasks */

var undumDistBundler = browserify();
undumDistBundler.require('undum-commonjs');

gulp.task('undum-dist', function () {
  return undumDistBundler.bundle().pipe(source('undum.js'))
    .pipe(buffer())
    .pipe(uglify())
    .pipe(gulp.dest('./dist/game'));
});

gulp.task('html-dist', html('./dist'));
gulp.task('img-dist', img('./dist/img'));
gulp.task('audio-dist', audio('./dist/audio'));

gulp.task('sass-dist', function () {
  return gulp.src('./sass/main.scss')
        .pipe(sass({outputStyle: 'compressed'}))
        .pipe(gulp.dest('./dist/css'));
});

var distBundler = browserify({
  debug: false,
  entries: ['./build/game/main.coffee'],
  transform: ['coffeeify']
});

distBundler.external('undum-commonjs');

gulp.task('coffee-dist', ['undum-dist', 'concatCoffee'], function () {
  return distBundler.bundle()
        .pipe(source('bundle.js'))
        .pipe(buffer())
        .pipe(uglify())
        .on('error', gutil.log)
        .pipe(gulp.dest('./dist/game'));
});

gulp.task('dist', ['html-dist', 'img-dist', 'sass-dist', 'coffee-dist', 'audio-dist'],
  function () {
    return;
});

gulp.task('zip', ['dist'], function () {
  return gulp.src('dist/**')
    .pipe(zip('dist.zip'))
    .pipe(gulp.dest('.'));
});
