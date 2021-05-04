import mongoose from 'mongoose';

const review = mongoose.Schema({
  rating: {
    type: Number,
    required: true,
    default: 0,
  },
  summary: {
    type: String,
    required: true,
  },
  recommend: {
    type: Boolean,
    default: false,
  },
  response: {
    type: String,
    default: null,
  },
  body: {
    type: String,
    required: true,
  },
  helpfulness: {
    type: Number,
    required: true,
  },
  email: {
    type: String,
    required: true,
  },
  photos: [{
    url: String,
  }],
}, {
  timestamps: true,
});

const User = mongoose.model('User', userSchema);

export default User;
