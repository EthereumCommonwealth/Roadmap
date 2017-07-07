pragma solidity ^0.4.11;

import './SafeMath.sol';
import './Initializable.sol';

contract DEX_StateStorage is Initializable {
    using SafeMath for uint;
    
    address public ICO_contract;
    
    address public frontend_contract;
    mapping(address => uint) public balances;
    
    uint256 public total_Supply;
    
    string public name = "Dexaran Treasury Token";
    string public symbol = "DEX";
    uint8 public decimals = 18;
    
    function Load(address _ICO, address __frontend_contract) only_init
    {
        ICO_contract = _ICO;
        frontend_contract = __frontend_contract;
    }
    
    function name() constant returns (string) { return name; }
    function symbol() constant returns (string) { return symbol; }
    function decimals() constant returns (uint8) {return decimals;}
    
    function totalSupply() constant returns (uint256 _supply)
    {
        return total_Supply;
    }

    function balanceOf(address _owner) constant returns (uint _balance)
    {
        return balances[_owner];
    }
    
    function increase_balance(address _owner, uint256 _amount) only_frontend
    {
        balances[_owner] = balances[_owner].add(_amount);
    }
    
    function decrease_balance(address _owner, uint256 _amount) only_frontend
    {
        balances[_owner] = balances[_owner].sub(_amount);
    }
    
    /** ICO **/
    
    function ICO_give_token(address _destination, uint256 _amount) only_ICO
    {
        balances[_destination] = balances[_destination].add(_amount);
        total_Supply = total_Supply.add(_amount);
    }
    
    function ICO_shutdown() only_ICO
    {
        ICO_contract = 0x0;
    }
    
     /** DEBUGGING FUNCTIONS **/
    
    modifier only_frontend
    {
        if(msg.sender != frontend_contract)
        {
            throw;
        }
        _;
    }
    
    modifier only_ICO
    {
        if(msg.sender != ICO_contract)
        {
            throw;
        }
        _;
    }
}