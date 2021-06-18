const { default: Web3 } = require("web3");

const Token = artifacts.require("Token");
const Exchange = artifacts.require("Exchange");

module.exports = async function (deployer) {
  const accounts = await Web3.eth.getAccounts()

  await deployer.deploy(Token);
  await deployer.deploy(Exchange, 'fee account', 10);
};
