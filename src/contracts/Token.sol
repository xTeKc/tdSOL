pragma solidity ^0.5.0;


contract Token {

	string public name = 'Digital Gold';
	string public symbol = 'DGLD';
	uint256 public decimals = 18;
	uint256 public totalSupply;

	//Track balances
	mapping (address => uint256) public balanceOf;

	//Send tokens


	constructor() public {
		totalSupply = 1000000 * (10 ** decimals);
		balanceOf[msg.sender] = totalSupply;
	}

}

