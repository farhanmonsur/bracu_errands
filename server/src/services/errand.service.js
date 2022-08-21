const httpStatus = require('http-status');
const { Errand } = require('../models');
const ApiError = require('../utils/ApiError');

/**
 * Create a errand
 * @param {Object} errandBody
 * @returns {Promise<Errand>}
 */
const createErrand = async (errandBody) => {
  const errand = await Errand.create(errandBody);
  return errand;
};

/**
 * Query for errands
 * @param {Object} filter - Mongo filter
 * @param {Object} options - Query options
 * @param {string} [options.sortBy] - Sort option in the format: sortField:(desc|asc)
 * @param {number} [options.limit] - Maximum number of results per page (default = 10)
 * @param {number} [options.page] - Current page (default = 1)
 * @returns {Promise<QueryResult>}
 */
const queryErrands = async (filter, options) => {
  const errands = await Errand.paginate(filter, options);
  return errands;
};

/**
 * Get errand by id
 * @param {ObjectId} id
 * @returns {Promise<Errand>}
 */
const getErrandById = async (id) => {
  return Errand.findById(id);
};
const getErrandByCreatorId = async (creatorId) => {
  return Errand.find({
    creatorId,
  });
};

const getErrandByPerformerId = async (performerId) => {
  return Errand.find({
    performerId,
  });
}

/**
 * Update errand by id
 * @param {ObjectId} errandId
 * @param {Object} updateBody
 * @returns {Promise<Errand>}
 */
const updateErrandById = async (errandId, updateBody) => {
  const errand = await getErrandById(errandId);
  if (!errand) {
    throw new ApiError(httpStatus.NOT_FOUND, 'Errand not found');
  }
  Object.assign(errand, updateBody);
  await errand.save();
  return errand;
};

/**
 * Delete errand by id
 * @param {ObjectId} errandId
 * @returns {Promise<Errand>}
 */
const deleteErrandById = async (errandId) => {
  const errand = await getErrandById(errandId);
  if (!errand) {
    throw new ApiError(httpStatus.NOT_FOUND, 'Errand not found');
  }
  await errand.remove();
  return errand;
};

module.exports = {
  createErrand,
  queryErrands,
  getErrandById,
  updateErrandById,
  deleteErrandById,
};
