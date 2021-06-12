const Token = artifacts.require('./Token')

require('chai')
	.use(require('chai-as-promised'))
	.should()

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