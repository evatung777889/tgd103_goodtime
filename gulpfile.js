const { src, dest, series, parallel, watch } = require("gulp"),
    autoprefixer = require('gulp-autoprefixer'),
    sourcemaps = require('gulp-sourcemaps'),
    imagemin = require('gulp-imagemin'),
    clean = require('gulp-clean'),
    uglify = require("gulp-uglify"),
    rename = require("gulp-rename"),
    cleanCSS = require("gulp-clean-css"),
    babel = require('gulp-babel'),
    sass = require("gulp-sass")(require("sass")),
    fileInclude = require("gulp-file-include"),
    browserSync = require('browser-sync'),
    reload = browserSync.reload;

// 搬家語法
function move() {
    return src("src/html/index.html").pipe(dest("dist/html"));
}
exports.m = move;


// 清除舊檔案
function clear() {
    return src('dist', { read: false, allowEmpty: true }) // 不去讀檔案結構，增加刪除效率  / allowEmpty : 允許刪除空的檔案
        .pipe(clean({ force: true })); //強制刪除檔案 
}

exports.c = clear

//  css minify
function cssMinify() {
    return src("src/css/style.css").pipe(cleanCSS()).pipe(dest("dist/css"));
}

exports.zipCSS = cssMinify;


// js minify
function jsMinify() {
    return src("src/js/*.js").pipe(uglify()).pipe(dest("dist/js"));
}

// js es6 -> es5
function babel5() {
    return src('src/js/*.js')
        .pipe(babel({
            presets: ['@babel/env']
        }))
        .pipe(uglify())
        .pipe(dest('dist/js'));
}

exports.es5 = babel5;
exports.zipJS = jsMinify;


// sass complier
// 沒壓縮css
function sass2css() {
    return src("src/scss/*.scss")
        .pipe(sourcemaps.init())
        .pipe(sass.sync().on("error", sass.logError)) // sass ->css
        .pipe(sourcemaps.write())
        .pipe(autoprefixer({
            cascade: false
        }))
        .pipe(dest("src/css"))
        .pipe(dest("dist/css"));
}

// 有壓縮
function sassMinify() {
    return src("src/scss/*.scss")
        .pipe(sourcemaps.init())
        .pipe(sass.sync().on("error", sass.logError)) // sass ->css
        .pipe(sourcemaps.write())
        .pipe(cleanCSS()) // minify css
        .pipe(autoprefixer({
            cascade: false
        }))
        .pipe(
            rename({
                extname: ".css",
            })
        )
        .pipe(dest("dist/css"));
}

exports.css2sass = sass2css;
exports.zipSASS = sassMinify;


// html template
function html() {
    return src("src/html/*.html")
        .pipe(
            fileInclude({
                prefix: "@@",
                basepath: "@file",
            })
        )
        .pipe(dest("dist/html"));
}

exports.template = html


// 打包圖片
function img() {
    return src(['src/img/**/*.*', 'src/img/*.*']).pipe(dest('dist/img'))
}

//圖片壓縮
function imgMinify() {
    return src(['src/img/**/*.*', 'src/img/*.*'])
        .pipe(imagemin([
            imagemin.mozjpeg({ quality: 80, progressive: true }) // 壓縮品質      quality越低 -> 壓縮越大 -> 品質越差 
        ]))
        .pipe(dest('dist/img'))
}

exports.zipIMG = imgMinify;






// 監看所有變動
function watchfile() {
    watch(['src/*.html', 'src/html/*.html'], html)
    watch(['src/scss/*.scss', 'src/scss/**/*.scss', 'src/scss/**/**/*.scss'], sass2css)
    watch('src/js/*.js', jsMinify)
    watch(['src/img/**/*.*', 'src/img/*.*'], img)
}


//瀏覽器同步
function browser(done) {
    browserSync.init({
        server: {
            baseDir: "./dist/html",
            index: "index.html"
        },
        port: 3000
    });
    watch(['src/*.html', 'src/html/*.html'], html).on('change', reload)
    watch(['src/scss/*.scss', 'src/scss/**/*.scss', 'src/scss/**/**/*.scss'], sass2css).on('change', reload)
    // watch('src/js/*.js', jsMinify).on('change', reload)
    // watch(['src/img/**/*.*', 'src/img/*.*'], img).on('change', reload)
    done();
}

//開發用
exports.default = series(parallel(html, sass2css), browser);

// 打包上線用x
exports.package = series(clear, parallel(html, jsMinify, sassMinify, babel5, imgMinify))