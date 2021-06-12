const Token = artifacts.require('./Token')

contract('Token', (accounts) => {

	descrbibe('deployment', () => {
		it('tracks the name', async () => {
			token = await Token.new()
			//Read token name here.. 
			//Check the token name is 'Digital Gold'
		})
	})

})