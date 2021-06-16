pragma solidity ^0.5.0;

import './Token.sol';

// Deposit & Withdraw Funds
// Manage Orders - Make or Cancel
// Handle Trades - Charge Fees

// TODO
//[x] Set the fee account
//[] Deposit Ether
//[] Withdraw Ether
//[] Deposit Tokens
//[] Withdraw Tokens
//[] Check balances
//[] Make order
//[] Cancel order
//[] Fill order
//[] Charge fees

contract Exchange {

    address public feeAccount; //the fee account that receives exchange fees
    uint256 public feePercent; //the fee percentage

    constructor(address _feeAccount, uint256 _feePercent) public {
        feeAccount = _feeAccount;
        feePercent = _feePercent;
    }

    function depositToken(address _token, uint256 _amount) public {
        require(Token(_token).transferFrom(msg.sender, address(this), _amount));
        //send tokens to this contract
        //manage deposit
        //emit event
    }

}


