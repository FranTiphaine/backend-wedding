var express = require('express');
var router = express.Router();
var novedadesModel = require('./../models/novedadesModel');
var cloudinary = require('cloudinary').v2;
var nodemailer = require('nodemailer');

router.get('/novedades', async function (req, res, next) {
    let novedades = await novedadesModel.getNovedades();

    novedades = novedades.map(novedades => {
        if (novedades.img_id) {
            const imagen = cloudinary.url(novedades.img_id, {
                width: 400,
                height: 200,
                crop: "fill"
            });
            return {
                ...novedades,
                imagen
            }
        } else {
            return {
                ...novedades,
                imagen: ''
            }
        }
    });
    res.json(novedades);
});


router.post('/contacto', async (req, res) => {
    const mail = {
        to: 'franciscotipaine@gmail.com',
        subject: 'Mensaje Casamiento',
        html: `${req.body.nombre} , ${req.body.email} se contacto a traves de la Web de Casamiento y dejo este mensaje por su casamiento: ${req.body.mensaje} <br> Su telefono es: ${req.body.telefono}`
    }

    const transport = nodemailer.createTransport({
        host: process.env.SMTP_HOST,
        port: process.env.SMTP_PORT,
        auth: {
            user: process.env.SMTP_USER,
            pass: process.env.SMTP_PASS
        }
    }); // cierra transp

    await transport.sendMail(mail)

    res.status(201).json({
        error: false,
        message: 'Mensaje enviado!'
    });

}); //cierra post/api

module.exports = router;