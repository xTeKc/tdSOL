const Token = artifacts.require("Token");
const Exchange = artifacts.require("Exchange");

module.exports = async function(callback) {
    try {
        //Fetch accounts from wallet (they are unlocked)
        const accounts = await web3.eth.getAccounts()

        //Fetch the deployed Token
        const token = await Token.deployed()
        console.log('Token fetched', token.address)

        //Fetch the deployed Exchange
        const exchange = await Exchange.deployed()
        console.log('Exchange fetched', exchange.address)

        //Give Tokens to account[1]
        const sender = accounts[0]
        const receiver = accounts[1]
        let amount = web3.utils.toWei('10000', 'ether') // 10_000 tokens

        await token.transfer(receiver, amount, { from: sender })
        console.log(`Transferred ${amount} tokens from ${sender} to ${receiver}`)

    } 
    catch(err) {
        console.log(error)
    }
    
    callback()
}