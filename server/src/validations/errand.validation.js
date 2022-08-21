const Joi = require('joi');
const { objectId } = require('./custom.validation');

const createErrand = {
  body: Joi.object().keys({
    description: Joi.string().required(),
  }),
};

const getErrands = {
  query: Joi.object().keys({
    creatorId: Joi.string().custom(objectId),
    performerId: Joi.string().custom(objectId),
    sortBy: Joi.string(),
    limit: Joi.number().integer(),
    page: Joi.number().integer(),
  }),
};

const getErrand = {
  params: Joi.object().keys({
    errandId: Joi.string().custom(objectId),
  }),
};

const updateErrand = {
  params: Joi.object().keys({
    errandId: Joi.required().custom(objectId),
  }),
  body: Joi.object()
    .keys({
      performerId: Joi.string().custom(objectId),
      description: Joi.string(),
      isActive: Joi.boolean(),
      isComplete: Joi.boolean(),
    })
    .min(1),
};

const deleteErrand = {
  params: Joi.object().keys({
    errandId: Joi.string().required().custom(objectId),
  }),
};

module.exports = {
  createErrand,
  getErrands,
  getErrand,
  updateErrand,
  deleteErrand,
};
