pragma solidity ^0.6.0;

import "../ERC721/ERC721.sol";
import "../Ownable.sol";

contract CarToken is Ownable, ERC721("CryptoCars", "CC") {

    struct Car {
        string model;
        string color;
        uint speed;
        uint price;
    }
    
    uint public cost;

    Car[] public cars;

    event NewSale(uint indexed carId);
    event CarSold(uint indexed carId, uint price, address indexed oldOwner, address indexed newOwner);


    mapping(uint => uint) public carPrices;
    uint[] public carsForSale;
    mapping(uint => uint) public indexes; // carId => carForSale

    function mint(string memory _model, string memory _color, uint8 _speed, uint _price) public onlyOwner {
        Car memory c = Car({model: _model,color: _color,speed: _speed, price: _price});
        cars.push(c);
        uint carId = cars.length - 1;

        carPrices[carId] = _price;
        
        cost = _price;

        _mint(address(this), carId);
        
    }
    
    

    /// @notice Buy car
    /// @param _carId TokenId




    
    function toSell(uint _carId) public onlyOwner {
        // You can only sell your own ships
        carsForSale.push(_carId);
        indexes[_carId] = carsForSale.length - 1;

    }

    
    /// @param _carId Car Id
    function Selling(uint _carId) public {
        
        safeTransferFrom(address(this), msg.sender, _carId);
       
        
        // Delete the token from the list of tokens for sale
        uint256 replacer = carsForSale[carsForSale.length - 1];
        uint256 pos = indexes[_carId];
        carsForSale[pos] = replacer;
        indexes[replacer] = pos;
        carsForSale.pop();

        emit NewSale(_carId);
    
    }

}

