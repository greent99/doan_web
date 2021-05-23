const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: process.env.EMAIL_USER, //email ID
        pass: process.env.EMAIL_PASSWORD //Password
    }
});

function sendMail(email, contents) {
    let details = {
        from: process.env.EMAIL_USER, // sender address same as above
        to: email, // Receiver's email id
        subject: 'Your OTP is ', // Subject of the mail.
        html: contents // Sending OTP
    };


    transporter.sendMail(details, function(error, data) {
        if (error)
            console.log(error);
        else
            console.log(data);
    });
}

module.exports = sendMail