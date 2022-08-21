const express = require('express');
const authRoute = require('./auth.route');
const userRoute = require('./user.route');
const errandRoute = require('./errand.route');

const router = express.Router();

router.use('/auth', authRoute);
router.use('/users', userRoute);
router.use('/errands', errandRoute);

module.exports = router;
