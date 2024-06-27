// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public owner; // Public variable to store the owner's address

    // Modifier to restrict access to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can access this function");
        _;
    }

    // Constructor to initialize the contract with a name and symbol
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender; // Set the deployer's address as the initial owner
    }

    // Function to mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount); // Call internal _mint function from ERC20
    }

    // Function to burn tokens 
    function burn(uint256 amount) public {
        _burn(msg.sender, amount); // Call internal _burn function from ERC20
    }

    // Override transfer function to transfer tokens
    function transfer(address to, uint256 amount) override public returns (bool) {
        _transfer(msg.sender, to, amount); // Call internal _transfer function from ERC20
        return true; // Return true upon successful transfer
    }

    // Function to change the owner of the contract
    function changeOwner(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address"); // Ensure the new owner address is valid
        owner = newOwner; // Update the owner to the new address
    }
}
