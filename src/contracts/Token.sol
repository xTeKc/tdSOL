//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//import openzeppelin contract for secure math
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Token {
	//declare using safemath from import
	using SafeMath for uint;

	//state variables
	string public name = 'Digital Gold';
	string public symbol = 'DGLD';
	uint256 public decimals = 18;
	uint256 public totalSupply;

	//define msg.sender of contract
	//address payable public msg.sender;

	//mapping an address to an amount
	mapping(address => uint256) public balanceOf;
	//mapping an address to another address, then to an amount
	mapping(address => mapping(address => uint256)) public allowance;

	//event for the transfer of one address to another
	event Transfer(address indexed from, address indexed to, uint256 value);
	//event for the approval of amount
	event Approval(address indexed msg.sender, address indexed spender, uint256 value);

	//setting totalSupply and msg.sender, with the msg.sender = to the totalSupply
	constructor() {
		totalSupply = 1000000 * (10 ** decimals);
		balanceOf[msg.sender] = totalSupply;
		//make msg.sender be equal to msg.sender
		//msg.sender == msg.sender;
	}

	//transfer func with local variables of _to and _value
	//making transfer from supply and to the address _to with a num _value of, return a bool
	function transfer(address _to, uint256 _value) public returns (bool success) {
		//req balance of the supply to be greater than or equal to the _value
		require(balanceOf[msg.sender] >= _value);
		_transfer(msg.sender, _to, _value);
		return true;
	}

    //private _transfer func with local variables of _from address, _to address and _value 
	function _transfer(address _from, address _to, uint256 _value) internal {
		//req the _to address to Not be the msg.sender(address[0])
		require(_to != address(0));
		balanceOf[_from] = balanceOf[_from].sub(_value);
		balanceOf[_to] = balanceOf[_to].add(_value);
		emit Transfer(_from, _to, _value);		
	}

	function approve(address _spender, uint256 _value) public returns (bool success) {
		//req _spender to not be the msg.sender(address[0])
		require(_spender != address(0));
		allowance[msg.sender][_spender] = _value;
		emit Approval(msg.sender, _spender, _value);
		return true;
	}

	function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
		require(_value <= balanceOf[_from]);
		require(_value <= allowance[_from][msg.sender]);
		allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);
		_transfer(_from, _to, _value);
		return true;
	}

}

