const httpStatus = require('http-status');
const catchAsync = require('../utils/catchAsync');
const { authService, userService, otpService, tokenService, emailService } = require('../services');

const emailValidation = catchAsync(async (req, res) => {
  await userService.emailValidation(req.body);
  res.send(null);
});

const register = catchAsync(async (req, res) => {
  const user = await userService.createUser(req.body);
  const tokens = await tokenService.generateAuthTokens(user);
  res.status(httpStatus.CREATED).send({
    user,
    tokens,
  });
});

const login = catchAsync(async (req, res) => {
  const { email, password } = req.body;
  const user = await authService.loginUserWithEmailAndPassword(email, password);
  const tokens = await tokenService.generateAuthTokens(user);
  res.send({
    user,
    tokens,
  });
});

const logout = catchAsync(async (req, res) => {
  await authService.logout(req.body.refreshToken);
  res.status(httpStatus.NO_CONTENT).send();
});

const refreshTokens = catchAsync(async (req, res) => {
  const tokens = await authService.refreshAuth(req.body.refreshToken);
  res.send({
    ...tokens,
  });
});

module.exports = {
  emailValidation,
  register,
  login,
  logout,
  refreshTokens,
};
