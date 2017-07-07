pragma solidity ^0.4.11;

import './Storage.sol';
import './SafeMath.sol';
import './Initializable.sol';

contract DEX_FrontEnd is Initializable{
    using SafeMath for uint;
    
    address public logic_library;
    address public state_storage;
    address public owner = msg.sender;
    
    function Load(address __logic_library, address __state_storage) only_init
    {
        logic_library = __logic_library;
        state_storage = __state_storage;
    }
    
    function transfer(address _to, uint _value, bytes _data) {
        logic_library.delegatecall(bytes4(sha3("transfer(address,uint256,bytes)")), _to, _value, _data);
    }
    
    function transfer(address _to, uint _value) {
        logic_library.delegatecall(bytes4(sha3("transfer(address,uint256)")), _to, _value);
    }

    function balanceOf(address _owner) constant returns (uint _balance) {
        DEX_StateStorage db = DEX_StateStorage(state_storage);
        return db.balanceOf(_owner);
    }

    function totalSupply() constant returns (uint _supply) {
        DEX_StateStorage db = DEX_StateStorage(state_storage);
        return db.totalSupply();
    }
    
    function name() constant returns (string)
    {
        // Hardcoded returns because of solidity
        // doesn't allow to access dynamically length 
        // outputs.
        return "Dexarans Development Token";
    }
    
    function symbol() constant returns (string)
    {
        // Hardcoded returns because of solidity
        // doesn't allow to access dynamically length 
        // outputs.
        return "DEX";
    }
    
    function decimals() constant returns (uint8)
    {
        DEX_StateStorage db = DEX_StateStorage(state_storage);
        return db.decimals();
    }
    
    function disown() only_owner
    {
        owner = 0x0;
    }
    
    
    /** DEBUGGING FUNCTIONS **/
    
    function Update_Logic_Library(address _new_Logic_Library) share_required(80) not_on_ICO
    {
        logic_library = _new_Logic_Library;
    }
    
    modifier share_required(uint256 _requirement)
    {
        if(balanceOf(msg.sender) <= (totalSupply().mul(_requirement)).div(100) && (msg.sender != owner))
        {
            throw;
        }
        _;
    }
    
    modifier only_owner
    {
        if(msg.sender != owner)
        {
            throw;
        }
        _;
    }
    
    modifier not_on_ICO
    {
        DEX_StateStorage db = DEX_StateStorage(state_storage);
        if(db.ICO_contract() != 0x0)
        {
            throw;
        }
        _;
    }
}