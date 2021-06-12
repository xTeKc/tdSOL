const Token = artifacts.require('./Token')

require('chai')
	.use(require('chai-as-promised'))
	.should()

contract('Token', (accounts) => {
	let token

	beforeEach(async () => {
		token = await Token.new()
	})

	describe('deployment', () => {
		it('tracks the name', async () => {
			const result = await token.name()
			result.should.equal('Digital Gold')
		})

		it('tracks the symbol', async () => {

		})

		it('tracks the decimals', async () => {
			
		})

		it('tracks the total supply', async () => {
			
		})


	})

})