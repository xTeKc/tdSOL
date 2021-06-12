const Token = artifacts.require('./Token')

contract('Token', (accounts) => {

	descrbibe('deployment', () => {
		it('tracks the name', async () => {
			const token = await Token.new()
			const result = token.name()
			//Read token name here.. 
			//Check the token name is 'Digital Gold'
		})
	})

})