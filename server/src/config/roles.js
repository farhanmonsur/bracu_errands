const roles = ['user', 'admin'];

const roleRights = new Map();
roleRights.set(roles[0], ['getUsers', 'getErrands',]);
roleRights.set(roles[1], [
  'getUsers',
  'getErrands',
  'manageUsers',
  'manageErrands',
]);

module.exports = {
  roles,
  roleRights,
};
