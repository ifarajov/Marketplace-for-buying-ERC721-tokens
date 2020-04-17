var CarToken = artifacts.require("CarToken");

module.exports = function(deployer) {
  deployer.deploy(CarToken,"CarToken","CC");
};