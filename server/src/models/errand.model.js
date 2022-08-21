const mongoose = require('mongoose');
const { toJSON, paginate } = require('./plugins');

const errandSchema = mongoose.Schema(
  {
    creatorId: {
      type: mongoose.SchemaTypes.ObjectId,
      ref: 'User',
      required: true,
    },
    performerId: {
      type: mongoose.SchemaTypes.ObjectId,
      ref: 'User',
    },
    description: {
      type: String,
      required: true,
    },
    contact: {
      type: String,
      required: true,
    },
    isActive: {
      type: Boolean,
      default: false,
    },
    isComplete: {
      type: Boolean,
      default: false,
    },
  },
  {
    timestamps: true,
  }
);

// add plugin that converts mongoose to json
errandSchema.plugin(toJSON);
errandSchema.plugin(paginate);

/**
 * @typedef Errand
 */
const Errand = mongoose.model('Errand', errandSchema);

module.exports = Errand;
