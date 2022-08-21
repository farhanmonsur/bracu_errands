const httpStatus = require('http-status');
const pick = require('../utils/pick');
const ApiError = require('../utils/ApiError');
const catchAsync = require('../utils/catchAsync');
const { errandService, storageService } = require('../services');

const createErrand = catchAsync(async (req, res) => {
  const userId = req.user.id;
  const contact = req.user.phone;
  const body = {
    creatorId: userId,
    description: req.body.description,
    contact: contact,
  }
  const errand = await errandService.createErrand(body);
  res.status(httpStatus.CREATED).send(errand);
});

const getErrand = catchAsync(async (req, res) => {
  const errand = await errandService.getErrandById(req.params.errandId);
  if (!errand) {
    throw new ApiError(httpStatus.NOT_FOUND, 'Errand not found');
  }
  res.send(errand);
});

const getErrands = catchAsync(async (req, res) => {
  const filter = pick(req.query, ['creatorId', 'performerId']);
  const options = pick(req.query, ['sortBy', 'limit', 'page']);
  const result = await errandService.queryErrands(filter, options);
  res.send(result);
});

const updateErrand = catchAsync(async (req, res) => {
  const errand = await errandService.updateErrandById(req.params.errandId, req.body);
  res.send(errand);
});

const deleteErrand = catchAsync(async (req, res) => {
  const errand = await errandService.getErrandById(req.params.errandId);
  if (!errand) {
    throw new ApiError(httpStatus.NOT_FOUND, 'Errand not found');
  }
  await errandService.deleteErrandById(req.params.errandId);
  res.status(httpStatus.NO_CONTENT).send();
});

module.exports = {
  createErrand,
  getErrands,
  getErrand,
  updateErrand,
  deleteErrand,
};
