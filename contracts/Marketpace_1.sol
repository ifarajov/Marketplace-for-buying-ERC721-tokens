pragma solidity ^0.6.0;

import "./CarToken.sol";
import "./ERC20.sol";


contract Marketplace_1 is ERC20 {


    CarToken public token;

    
    address newCarToken = address(new CarToken());
    

   

    function buy(uint _carId) public {
        require(newCarToken != address(this),"You cannot buy own token");
        // We approve the transfer directly to avoid creating two trx
        // then we send the token to the sender
        
        token.Selling(_carId);
        _transfer(msg.sender, newCarToken, token.cost);

    }
}

