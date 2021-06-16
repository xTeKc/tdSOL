pragma solidity ^0.5.0;

contract Exchange {

    address public feeAccount; //fee account that receives exchange fees

    constructor(address _feeAccount) public {
        feeAccount = _feeAccount;
    }

}


// Deposit & Withdraw Funds
// Manage Orders - Make or Cancel
// Handle Trades - Charge Fees

// TODO
//Set the fee account
//Deposit Ether
//Withdraw Ether
//Deposit Tokens
//Withdraw Tokens
//Check balances
//Make order
//Cancel order
//Fill order
//Charge fees