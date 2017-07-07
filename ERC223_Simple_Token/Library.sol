pragma solidity ^0.4.11;

import './Storage.sol';
import './SafeMath.sol';
import './Initializable.sol';


contract ERC223ReceivingContract
{
    function tokenFallback(address, uint256, bytes) {}
}

contract DEX_LogicLibrary is Initializable {
    
    event Transfer(address indexed from, address indexed to, uint indexed value, bytes data);

    function transfer(address _to, uint _value, bytes _data)
    {
        /* Only hardcoded addresses could be `delegatecall`ed */
        address _storage = 0x3d467a2c129f644ac315dd6a11427574c631f443;
        
        uint codeLength;
        assembly {
            codeLength := extcodesize(_to)
        }
        
        if(!_storage.call(bytes4(sha3("decrease_balance(address,uint256)")), msg.sender, _value))
        {
            throw;
        }
        if(!_storage.call(bytes4(sha3("increase_balance(address,uint256)")), _to, _value))
        {
            throw;
        }
        
        if(codeLength>0) {
            ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
            receiver.tokenFallback(msg.sender, _value, _data);
        }
        Transfer(msg.sender, _to, _value, _data);
    }
    
    function transfer(address _to, uint _value)
    {
        address _storage = 0x3d467a2c129f644ac315dd6a11427574c631f443;
        
        uint codeLength;
        bytes memory _empty;

        assembly {
            codeLength := extcodesize(_to)
        }
        
        if(!_storage.call(bytes4(sha3("decrease_balance(address,uint256)")), msg.sender, _value))
        {
            throw;
        }
        if(!_storage.call(bytes4(sha3("increase_balance(address,uint256)")), _to, _value))
        {
            throw;
        }
        
        if(codeLength>0) {
            ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
            
            receiver.tokenFallback(msg.sender, _value, _empty);
        }
        Transfer(msg.sender, _to, _value, _empty);
    }
}