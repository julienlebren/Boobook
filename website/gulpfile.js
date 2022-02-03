/**
 * Gulp Packages
 */

// General
const gulp = require('gulp')
const del = require('del')
const gulpif = require('gulp-if')
const useref = require('gulp-useref')
const plumber = require('gulp-plumber')
const rename = require('gulp-rename')
const imagemin = require('gulp-imagemin')
const browserSync = require('browser-sync').create()

// Scripts
const uglify = require('gulp-uglify')

// Styles
const sass = require('gulp-sass')(require('sass'))
const minify = require('gulp-cssnano')

// Pug
const pug = require('gulp-pug-i18n')
const { marked } = require('marked')

const baseLang = 'en'
const filesToMove = `dist/localized/${baseLang}`

// Buil tasks to run and watch
const buildTypes = ['scripts', 'styles', 'pug', 'static']

// Paths to project folders
const paths = {
    input: 'src/**',
    output: 'dist/',
    scripts: {
        watch: 'src/js/**',
        input: 'dist/js/**',
        output: 'dist/js/'
    },
    styles: {
        watch: 'src/sass/**',
        input: 'src/sass/*.{scss,sass}',
        output: 'dist/css/',
        wiredep: 'src/sass'
    },
    pug: {
        watch: ['src/pages/**', 'src/i18n/*.yml'],
        input: 'src/pages/*.pug',
        output: 'dist/',
        locales: 'src/i18n/*.yml',
        filename: 'localized/{{lang}}/{{basename}}.html',
        wiredep: 'src/pages'
    },
    static: {
        input: ['src/static/**', 'src/static/.*'],
        output: 'dist/'
    }
}



/**
 * Gulp Tasks
 */

// Compile Pug files into output folder
gulp.task('build:pug', () => {
    return gulp.src(paths.pug.input)
        .pipe(plumber())
        .pipe(useref({
            searchPath: ['.', 'src']
        }))
        .pipe(gulpif('**/*.pug',
            pug({
                i18n: {
                    locales: paths.pug.locales,
                    filename: paths.pug.filename
                },
                data: {
                    // Markdown
                    md: (t) => marked(t)
                        // Add &nbsp; before punctuation
                        .replace(/ (\!|\?|:)/g, '&nbsp;$1')
                }
            })))
        //.pipe(gulpif('**/*.html', gulp.dest(paths.pug.output))
        .pipe(gulp.dest(paths.pug.output))
        .pipe(browserSync.stream())
})

// Minify, and concatenate scripts
gulp.task('build:scripts', gulp.series('build:pug'), () => {
    return gulp.src(paths.scripts.input)
        .pipe(plumber())
        .pipe(uglify())
        .pipe(gulp.dest(paths.scripts.output))
        .pipe(browserSync.stream())
})

// Process and minify Sass files
gulp.task('build:styles', () => {
    return gulp.src(paths.styles.input)
        //.pipe(plumber())
        .pipe(sass())
        //.pipe(flatten())
        //.pipe(prefix())
        //.pipe(cssimport({}))
        .pipe(gulp.dest(paths.styles.output))
        .pipe(rename({suffix: '.min'}))
        .pipe(minify({
            discardComments: {
                removeAll: true
            }
        }))
        .pipe(gulp.dest(paths.styles.output))
        .pipe(browserSync.stream())
})

// Copy static files into output folder
gulp.task('build:static', () => {
    return gulp.src(paths.static.input)
        .pipe(plumber())
        // Optimize images
        .pipe(imagemin())
        .pipe(gulp.dest(paths.static.output))
        .pipe(browserSync.stream())
})

// Copy font files into output folder
gulp.task('build:fonts', () => {
    return gulp.src(paths.fonts.input)
        .pipe(plumber())
        .pipe(gulp.dest(paths.fonts.output))
        .pipe(browserSync.stream())
})

// Remove pre-existing content from output folder
gulp.task('clean:dist', async () => {
    const delDist = () => del(paths.output)
    let tries = 5
    // Try to delete folder multiple times
    return delDist()
        .catch((e) => {
            if (tries != 0) {
                tries--
                return new Promise((resolve) => {
                    setTimeout(resolve, 500)
                }).then(delDist)
            }
            throw e
        })
})

// Move files from baseLang dir to main dir
gulp.task('move', async () => {
    gulp.src(`${filesToMove}/*.*`)
        .pipe(gulp.dest('dist/.'))
})


/**
 * Task Runners
 */

// Watch files and serve files with Browsersync
gulp.task('serve', () => {
    buildTypes.forEach((type) => {
        const path = paths[type].watch || paths[type].input
        gulp.watch(path, gulp.series(`build:${type}`))
    })
    browserSync.init({
        server: paths.output
    })
})

// Build project
gulp.task('build', gulp.series(buildTypes.map((t) => `build:${t}`), 'move'))

// Clean, build project and move default localized
gulp.task('default', gulp.series('clean:dist', 'build'))

// Watch files
gulp.task('watch', (cb) => {
    buildTypes.forEach((type) => {
      const path = paths[type].watch || paths[type].input
      gulp.watch(path, gulp.series(`build:${type}`))
    })
    cb()
  })
  
// Serve files with Browsersync
gulp.task('browserSync', (cb) => {
    browserSync.init({
        server: paths.output,
    })
    cb()
})

gulp.task('start', gulp.series('default', 'watch', 'browserSync'))