pragma solidity ^0.5.0;


contract Token {

string public name = 'Digital Gold';
string public symbol = 'DGLD';
uint256 public decimals = 18;
uint256 public totalSupply;

//Track balances
//Send tokens

constructor() public {
	totalSupply = 1000000 * (10 ** decimals);
}

}

