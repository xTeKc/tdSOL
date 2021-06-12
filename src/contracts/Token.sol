pragma solidity ^0.5.0;


contract Token {

	string public name = 'Digital Gold';
	string public symbol = 'DGLD';
	uint256 public decimals = 18;
	uint256 public totalSupply;

	mapping (address => uint256) public balanceOf;

	constructor() public {
		totalSupply = 1000000 * (10 ** decimals);
		balanceOf[msg.sender] = totalSupply;
	}

	function transfer(address _to, uint256 _value) public returns (bool success) {
		balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
		balanceOf[_to] = balanceOf[_to].add(_value);
		return true;
	}

}

