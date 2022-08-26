var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var fileupload = require("express-fileupload")
var cors = require('cors');

require('dotenv').config();
var session = require('express-session');

var indexRouter = require('./routes/index'); // index.js
var usersRouter = require('./routes/users'); // users.js
var loginRouter = require('./routes/admin/login'); // routes/admin/login.js
var adminRouter = require('./routes/admin/novedades');
var apiRouter = require('./routes/api');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use(session({
    secret: 'Fran',
    cookie: {maxAge: null},
    resave: false,
    saveUninitialized: true,
}));

secured = async (req, res, next) => {
    try {
        console.log(req.session.id_usuario);
        if (req.session.id_usuario) {
            next();
        } else {
            res.redirect('/admin/login');
        }
    } catch (error) {
        console.log(error);
    }
}// cierro catch error
// cierro secured

app.use(fileupload({
    useTempFiles: true,
    tempFileDir: '/tmp/'
}));

/* Rutas para activar esos controladores */

app.use('/', indexRouter);
app.use('/users', usersRouter); // user.js
app.use('/admin/login', loginRouter) //login.js
app.use('/admin/novedades', secured, adminRouter); // novedades.js
app.use('/api', cors(), apiRouter);


// catch 404 and forward to error handler
app.use(function (req, res, next) {
    next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

// Mostrar el favicon.ico
app.get("/favicon.ico", (req, res) => {
    return res.sendFile(path.join(__dirname + "/public/images/favicon.ico"));
});

module.exports = app;