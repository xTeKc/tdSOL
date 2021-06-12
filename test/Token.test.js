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
			const result = await token.symbol()
			result.should.equal('DGLD')
		})

		it('tracks the decimals', async () => {
			const result = await token.decimals()
			result.should.equal('decimals')			
		})

		it('tracks the total supply', async () => {
			const result = await token.totalSupply()
			result.should.equal('total supply')			
		})


	})

})