//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Token {
	using SafeMath for uint;

	string public name = 'Digital Gold';
	string public symbol = 'DGLD';
	uint256 public decimals = 18;
	uint256 public totalSupply;

	//define owner of contract
	address payable public owner;

	//mapping an address to an amount
	mapping(address => uint256) public balanceOf;
	//mapping an address to another address, then to an amount
	mapping(address => mapping(address => uint256)) public allowance;

	//event for the transfer of one address to another
	event Transfer(address indexed from, address indexed to, uint256 value);
	//event for the approval of amount
	event Approval(address indexed owner, address indexed spender, uint256 value);

	constructor() {
		totalSupply = 1000000 * (10 ** decimals);
		balanceOf[owner] = totalSupply;
		//make owner be equal to msg.sender
		owner == msg.sender;
	}

	function transfer(address _to, uint256 _value) public returns (bool success) {
		require(balanceOf[owner] >= _value);
		_transfer(owner, _to, _value);
		return true;
	}

	function _transfer(address _from, address _to, uint256 _value) internal {
		require(_to != address(0));
		balanceOf[_from] = balanceOf[_from].sub(_value);
		balanceOf[_to] = balanceOf[_to].add(_value);
		emit Transfer(_from, _to, _value);		
	}

	function approve(address _spender, uint256 _value) public returns (bool success) {
		require(_spender != address(0));
		allowance[owner][_spender] = _value;
		emit Approval(owner, _spender, _value);
		return true;
	}

	function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
		require(_value <= balanceOf[_from]);
		require(_value <= allowance[_from][owner]);
		allowance[_from][owner] = allowance[_from][owner].sub(_value);
		_transfer(_from, _to, _value);
		return true;
	}

}

