pragma solidity ^0.4.11;

import './SafeMath.sol';
import './Storage.sol';
import './Initializable.sol';

contract ICO is Initializable {
    
    event Buy(address indexed _owner, uint256 indexed _amount);
    
    address public owner = msg.sender;
    
    uint256 public start_block = block.number;
    uint256 public end_block = block.number + 172800;
    
    DEX_StateStorage db;
    
    function Load(address _db) only_init
    {
        db = DEX_StateStorage(_db);
    }
    
    function() payable {
        if(block.number > end_block)
        {
            throw;
        }
        db.ICO_give_token(msg.sender, msg.value);
        Buy(msg.sender, msg.value);
    }
    
    function extendICO(uint256 _blocks) only_owner
    {
        end_block += _blocks;
    }
    
    function closeICO() only_owner
    {
        db.ICO_shutdown();
        suicide(owner);
    }
    
    function withdraw() only_owner
    {
        owner.send(this.balance);
    }
    
    modifier only_owner
    {
        if(msg.sender != owner)
        {
            throw;
        }
        _;
    }
}