// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; //first thing to contracts

contract SimpleStorage { //similar to a class

    // This gets initialized to zero
    uint256 favoriteNumber;

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People { // new type (boolean, string, uint256, etc)
        uint256 favoriteNumber;
        string name;
    }
    
    //uint256[] public favoriteNumberList;
    People[] public people;

    // This function gets a uint256 for argument and set it to uint256 favoriteNumber
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        // here, the function store update state. then retrieve we have to pay.
       // retrieve();
    }

    // pure | view. view is free only to see, unless calling inside a function thats pay gas.
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    // calldata, memory, storage  -> data locations
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

// 0xd9145CCE52D386f254917e481eB44e9943F39138
// EVM, Ethereum Virtual Machine
// compatible: Avalanche, Fanto, Polygon