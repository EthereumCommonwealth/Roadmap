pragma solidity ^0.4.11;

contract Initializable {
    address public dexaran = msg.sender;
    
    modifier only_init
    {
        if(msg.sender != dexaran)
        {
            throw;
        }
        dexaran = 0x0;
        _;
    }
}