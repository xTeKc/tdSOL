pragma solidity ^0.5.0;

import './Token.sol';
import 'openzeppelin-solidity/contracts/math/SafeMath.sol';

// Deposit & Withdraw Funds
// Manage Orders - Make or Cancel
// Handle Trades - Charge Fees

// TODO
//[x] Set the fee account
//[x] Deposit Ether
//[] Withdraw Ether
//[x] Deposit Tokens
//[] Withdraw Tokens
//[] Check balances
//[] Make order
//[] Cancel order
//[] Fill order
//[] Charge fees

contract Exchange {
	using SafeMath for uint;

    address public feeAccount; //the fee account that receives exchange fees
    uint256 public feePercent; //the fee percentage
    address constant ETHER = address(0); // stor Ether in tokens mapping with blank address

	mapping(address => mapping(address => uint256)) public tokens;

    // Events
    event Deposit(address token, address user, uint256 amount, uint256 balance);
    event Withdraw(address token, address user, uint256 amount, uint256 balance);


    constructor(address _feeAccount, uint256 _feePercent) public {
        feeAccount = _feeAccount;
        feePercent = _feePercent;
    }

    // Fallback : reverts if Ether is sent to this smart contract by mistake
    function() external {
        revert();
    }

    function depositEther() payable public {
        tokens[ETHER][msg.sender] = tokens[ETHER][msg.sender].add(msg.value);
        emit Deposit(ETHER, msg.sender, msg.value, tokens[ETHER][msg.sender]);
    }

    function withdrawEther(uint _amount) public {
        require(tokens[ETHER][msg.sender] >= _amount);
        tokens[ETHER][msg.sender] = tokens[ETHER][msg.sender].sub(_amount);
        msg.sender.transfer(_amount);
        emit Withdraw(ETHER, msg.sender, _amount, tokens[ETHER][msg.sender]);
    } 

    function depositToken(address _token, uint256 _amount) public {
        //TODO dont allow Ether deposits
        require(_token != ETHER);
        require(Token(_token).transferFrom(msg.sender, address(this), _amount));
        tokens[_token][msg.sender] = tokens[_token][msg.sender].add(_amount);
        emit Deposit(_token, msg.sender, _amount, tokens[_token][msg.sender]);
    }

}


