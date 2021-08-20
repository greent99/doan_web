const express = require('express');
const router = express.Router();
const chatBotController = require('../controllers/chatbot.controller');

router.post('/chatbot', chatBotController.postMessage);

router.get('/webhook', chatBotController.getMessage);

module.exports = router; 