const Token = artifacts.require("Token");
const Exchange = artifacts.require("Exchange");

module.exports = async function(callback) {
    try {
        //Fetch accounts from wallet (they are unlocked)
        const accounts = await web3.eth.getAccounts()

        //Fetch the deployed Token
        const token = await Token.deployed()
        console.log('Token fetched', token.address)

    } 
    catch(err) {
        console.log(error)
    }
    
    callback()
}