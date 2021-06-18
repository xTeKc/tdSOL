const Token = artifacts.require("Token");
const Exchange = artifacts.require("Exchange");

module.exports = async function (deployer) {
  await deployer.deploy(Token);
  await deployer.deploy(Exchange, 'fee account', 10);
};
