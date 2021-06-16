pragma solidity ^0.5.0;

contract Exchange {

    address public feeAccount; //the fee account that receives exchange fees
    uint256 public feePercent; //the fee percentage

    constructor(address _feeAccount, uint256 _feePercent) public {
        feeAccount = _feeAccount;
        feePercent = _feePercent;
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