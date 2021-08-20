var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var cors = require('cors')
require('dotenv').config();

var authRouter = require('./routes/auth.router');
var userRouter = require('./routes/user.router');
var lessonRouter = require('./routes/lesson.router');
var courseRouter = require('./routes/course.router');
var categoryRouter = require('./routes/category.router')
var fieldRouter = require('./routes/field.router')
var chatbotRouter = require('./routes/chatbot.route')
var indexRouter = require('./routes/index.router')

var app = express();

app.use(cors())

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.use(express.static(path.join(__dirname, 'resources')));
app.set('view engine', 'jade');

app.use('/', indexRouter)

global.__basedir = __dirname;

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/api/auth', authRouter);
app.use('/api/user', userRouter);
app.use('/api/lesson', lessonRouter);
app.use('/api/courses', courseRouter);
app.use('/api/categories', categoryRouter);
app.use('/api/fields', fieldRouter);
app.use('/api/chatbot', chatbotRouter);



app.get('/err', function(req, res) {
    throw new Error('Error!')
})

app.use(function(req, res, next) {
    res.status(404).json({
        error_message: 'Endpoint not found!'
    })
})

app.use(function(req, res, next) {
    res.status(500).json({
        error_message: 'Something broke!'
    })
})

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});



module.exports = app;