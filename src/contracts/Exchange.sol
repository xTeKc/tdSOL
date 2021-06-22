//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//import Token contract to use within this contract
import './Token.sol';
//use secure math with openzeppelin contract
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Exchange {
    //declare using safemath
	using SafeMath for uint256;

    //define the msg.sender as a payable address
    address payable public owner;
    address public feeAccount; //the fee account that receives exchange fees
    uint256 public feePercent; //the fee percentage
    address constant ETHER = address(0); // stor Ether in tokens mapping with blank address

	mapping(address => mapping(address => uint256)) public tokens;

    // a way to store the order
    mapping (uint256 => _Order) public orders;
    uint256 public orderCount;
    mapping(uint256 => bool) public orderCancelled;
    mapping (uint256 => bool) public orderFilled;

    // Events
    event Deposit(address token, address user, uint256 amount, uint256 balance);

    event Withdraw(address token, address user, uint256 amount, uint256 balance);

    // outside contract
        event Order(
            uint256 id, 
            address user,
            address tokenGet,
            uint256 amountGet,
            address tokenGive,
            uint256 amountGive,
            uint256 timestamp
    );

        event Cancel(
            uint256 id, 
            address user,
            address tokenGet,
            uint256 amountGet,
            address tokenGive,
            uint256 amountGive,
            uint256 timestamp
    );

        event Trade(
            uint256 id, 
            address user,
            address tokenGet,
            uint256 amountGet,
            address tokenGive,
            uint256 amountGive,
            address userFill,
            uint256 timestamp
    );    

    // a way to model order; inside contract
        struct _Order {
            uint256 id;
            address user;
            address tokenGet;
            uint256 amountGet;
            address tokenGive;
            uint256 amountGive;
            uint256 timestamp;
    }
    
    //define the feeAccount and feePercent once throughout contract life
    constructor(address _feeAccount, uint256 _feePercent) {
        feeAccount = _feeAccount;
        feePercent = _feePercent;
        //define msg.sender = msg.sender
        msg.sender == owner;
    }

    // Fallback : reverts if Ether is sent to this smart contract by mistake
    fallback() external {
        revert();
    }

    function depositEther() payable public {
        tokens[ETHER][msg.sender] = tokens[ETHER][msg.sender].add(msg.value);
        emit Deposit(ETHER, msg.sender, msg.value, tokens[ETHER][msg.sender]);
    }

    function withdrawEther(uint256 _amount) public {
        require(tokens[ETHER][msg.sender] >= _amount);
        tokens[ETHER][msg.sender] = tokens[ETHER][msg.sender].sub(_amount);
        owner.transfer(_amount);
        emit Withdraw(ETHER, msg.sender, _amount, tokens[ETHER][msg.sender]);
    } 

    function depositToken(address _token, uint256 _amount) public {
        //TODO dont allow Ether deposits
        require(_token != ETHER);
        require(Token(_token).transferFrom(msg.sender, address(this), _amount));
        tokens[_token][msg.sender] = tokens[_token][msg.sender].add(_amount);
        emit Deposit(_token, msg.sender, _amount, tokens[_token][msg.sender]);
    }

    function withdrawToken(address _token, uint256 _amount) public {
        require(_token != ETHER);
        require(tokens[_token][msg.sender] >= _amount);
        tokens[_token][msg.sender] = tokens[_token][msg.sender].sub(_amount);
        require(Token(_token).transfer(msg.sender, _amount));
        emit Withdraw(_token, msg.sender, _amount, tokens[_token][msg.sender]);
    }

    function balanceOf(address _token, address _user) public view returns (uint256) {
        return tokens[_token][_user];
    }

    function makeOrder(address _tokenGet, uint256 _amountGet, address _tokenGive, uint256 _amountGive) public {
        orderCount = orderCount.add(1);
        orders[orderCount] = _Order(orderCount, msg.sender, _tokenGet, _amountGet, _tokenGive, _amountGive, block.timestamp);
        emit Order(orderCount, msg.sender, _tokenGet, _amountGet, _tokenGive, _amountGive, block.timestamp);
    }

    function cancelOrder(uint256 _id) public {
        _Order storage _order = orders[_id];
        require(address(_order.user) == msg.sender);
        require(_order.id == _id); // the order must exist
        orderCancelled[_id] = true;
        emit Cancel(_order.id, msg.sender, _order.tokenGet, _order.amountGet, _order.tokenGive, _order.amountGive, block.timestamp);
    }

    function fillOrder(uint256 _id) public {
        require(_id > 0 && _id <= orderCount);
        require(!orderFilled[_id]);
        require(!orderCancelled[_id]);
        _Order storage _order = orders[_id];
        _trade(_order.id, _order.user, _order.tokenGet, _order.amountGet, _order.tokenGive, _order.amountGive);
        // Mark Order as filled
        orderFilled[_order.id] = true;
    }

    function _trade(uint256 _orderId, address _user, address _tokenGet, uint256 _amountGet, address _tokenGive, uint256 _amountGive) internal {
        // Fee is paid by the user that fills the order, (msg.sender)
        // Fee deducted from _amountGet
        uint256 _feeAmount = _amountGet.mul(feePercent).div(100);

        // execute the Trade
        tokens[_tokenGet][msg.sender] = tokens[_tokenGet][msg.sender].sub(_amountGet.add(_feeAmount));
        tokens[_tokenGet][_user] = tokens[_tokenGet][_user].add(_amountGet);
        tokens[_tokenGet][feeAccount] = tokens[_tokenGet][feeAccount].add(_feeAmount);
        tokens[_tokenGive][_user] = tokens[_tokenGive][_user].sub(_amountGive);
        tokens[_tokenGive][msg.sender] = tokens[_tokenGive][msg.sender].add(_amountGive);

        emit Trade(_orderId, _user, _tokenGet, _amountGet, _tokenGive, _amountGive, msg.sender, block.timestamp);
    }

}


