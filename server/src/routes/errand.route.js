const express = require('express');
const auth = require('../middlewares/auth');
const validate = require('../middlewares/validate');
const errandValidation = require('../validations/errand.validation');
const errandController = require('../controllers/errand.controller');

const router = express.Router();

router
  .route('/')
  .post(auth('manageErrands'), validate(errandValidation.createErrand), errandController.createErrand)
  .get(auth('getErrands'), validate(errandValidation.getErrands), errandController.getErrands);

router
  .route('/:errandId')
  .get(auth('getErrands'), validate(errandValidation.getErrand), errandController.getErrand)
  .patch(auth('manageErrands'), validate(errandValidation.updateErrand), errandController.updateErrand)
  .delete(auth('manageErrands'), validate(errandValidation.deleteErrand), errandController.deleteErrand);

module.exports = router;
