pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";

contract RidToken is ERC20, ERC20Detailed {
     constructor(string _name, string _symbol, uint8 _decimals, uint256 _totalSupply)
        ERC20Detailed(_name, _symbol, _decimals)
        public
    {
        _mint(msg.sender, _totalSupply);
    }
}
