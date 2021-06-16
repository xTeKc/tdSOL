import { tokens, EVM_REVERT } from './helpers'

const Exchange = artifacts.require('./Exchange')

require('chai')
	.use(require('chai-as-promised'))
	.should()

contract('Exchange', ([deployer, feeAccount]) => {
	let exchange

	beforeEach(async () => {
		token = await Exchange.new()
	})

	describe('deployment', () => {



	})

// 	describe('sending tokens', () => {
// 		let amount
// 		let result

// 	describe('success', async () => {
// 		beforeEach(async () => {
// 			amount = tokens(100)
// 			result = await token.transfer(receiver, amount, { from: deployer })
// 		})

// 		it('transfers token balances', async () => {
// 			let balanceOf

// 			balanceOf = await token.balanceOf(deployer)
// 			balanceOf.toString().should.equal(tokens(999900).toString())
// 			balanceOf = await token.balanceOf(receiver)
// 			balanceOf.toString().should.equal(tokens(100).toString())
// 		})

// 		it('emits Transfer event', async () => {
// 			const log = result.logs[0]
// 			log.event.should.equal('Transfer')
// 			const event = log.args
// 			event.from.toString().should.equal(deployer, 'from value is correct')
// 			event.to.should.equal(receiver, 'to is correct')
// 			event.value.toString().should.equal(amount.toString(), 'value is correct')
// 		})		
// 	})

// 	describe('failure', async () => {

// 		it('rejects insufficient balances', async () => {
// 			let invalidAmount
// 			invalidAmount = tokens(100000000) //100 mil (greater than total supply - invalid)
// 			await token.transfer(receiver, invalidAmount, { from: deployer }).should.be.rejectedWith(EVM_REVERT)

// 			invalidAmount = tokens(10) //recipient has no tokens
// 			await token.transfer(deployer, invalidAmount, { from: receiver }).should.be.rejectedWith(EVM_REVERT)
// 		})
	
// 		it('rejects invalid recipients', async () => {
// 			await token.transfer(0x0, amount, { from: deployer }).should.be.rejected
// 		})

// 	})	

// 	})

// 	describe('approving tokens', () => {
// 		let amount
// 		let result 

// 		beforeEach(async () => {
// 			amount = tokens(100)
// 			result = await token.approve(exchange, amount, { from: deployer })
// 		})

// 	describe('success', () => {
// 		it('allocates an allowance for delegated token spending on exchange', async () => {
// 			const allowance = await token.allowance(deployer, exchange)
// 			allowance.toString().should.equal(amount.toString())
// 		})

// 		it('emits an Approval event', async () => {
// 			const log = result.logs[0]
// 			log.event.should.equal('Approval')
// 			const event = log.args
// 			event.owner.toString().should.equal(deployer, 'owner value is correct')
// 			event.spender.should.equal(exchange, 'spender is correct')
// 			event.value.toString().should.equal(amount.toString(), 'value is correct')
// 		})			

// 	})

// 	describe('failure', () => {
// 		it('rejects invalid spenders', async () => {
// 			await token.approve(0x0, amount, { from: deployer }).should.be.rejected
// 		})
// 	})

// 	})

// 	describe('delegated token transfers', () => {
// 		let amount
// 		let result

// 		beforeEach(async () => {
// 			amount = tokens(100)
// 			await token.approve(exchange, amount, { from: deployer })
// 		})

// 	describe('success', async () => {
// 		beforeEach(async () => {
// 			result = await token.transferFrom(deployer, receiver, amount, { from: exchange })
// 		})

// 		it('transfers token balances', async () => {
// 			let balanceOf

// 			balanceOf = await token.balanceOf(deployer)
// 			balanceOf.toString().should.equal(tokens(999900).toString())
// 			balanceOf = await token.balanceOf(receiver)
// 			balanceOf.toString().should.equal(tokens(100).toString())
// 		})

// 		it('resets the allowance', async () => {
// 			const allowance = await token.allowance(deployer, exchange)
// 			allowance.toString().should.equal('0')
// 		})		

// 		it('emits Transfer event', async () => {
// 			const log = result.logs[0]
// 			log.event.should.equal('Transfer')
// 			const event = log.args
// 			event.from.toString().should.equal(deployer, 'from value is correct')
// 			event.to.should.equal(receiver, 'to is correct')
// 			event.value.toString().should.equal(amount.toString(), 'value is correct')
// 		})		
// 	})

// 	describe('failure', async () => {

// 		it('rejects insufficient amounts', async () => {
// 			const invalidAmount = tokens(100000000) //100 mil (greater than total supply - invalid)
// 			await token.transferFrom(deployer, receiver, invalidAmount, { from: exchange }).should.be.rejectedWith(EVM_REVERT)
// 		 })

// 		it('rejects invalid recipients', async () => {
// 			await token.transferFrom(deployer, 0x0, amount, { from: exchange }).should.be.rejected
// 	})


// 	})	

// 	})	

 })

