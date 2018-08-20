var CSToken = artifacts.require("./CSToken.sol");

module.exports = function(deployer) {
  deployer.deploy(CSToken);
};