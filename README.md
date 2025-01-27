# METACRAFTERS ETH-AVAX INTERMEDIATE PROJECT 3

This Solidity program defines a custom ERC20 token contract that allows minting, burning, and ownership management functionalities.

## Description

This Solidity contract extends the ERC20 standard to create a custom token with additional features like minting, burning, and owner-only functions. It demonstrates basic Solidity syntax and usage of OpenZeppelin's ERC20 implementation.

1. owner: A public variable that stores the address of the contract owner. The owner has special privileges such as minting new tokens and changing ownership.
   
2. onlyOwner: A modifier that restricts access to certain functions to the contract owner only. It checks if the caller's address (msg.sender) is the same as the owner's address.
   
3. constructor(string memory name, string memory symbol): The constructor initializes the contract with a name and a symbol for the token. It also sets the deployer's address as the owner of the contract.
   
4. mint(address to, uint256 amount): This function allows the owner to mint new tokens. It creates the specified amount of tokens and assigns them to the specified address (to). The function uses the onlyOwner modifier to ensure that only the owner can call it.
   
5. burn(uint256 amount): This function allows any token holder to burn (destroy) their own tokens. It reduces the caller's token balance by the specified amount and decreases the total supply of tokens.
    
6. transfer(address to, uint256 amount): This function overrides the default ERC20 transfer function. It transfers the specified amount of tokens from the caller's address (msg.sender) to the specified address (to). It returns true if the transfer is successful.
    
7. changeOwner(address newOwner): This function allows the current owner to transfer ownership of the contract to a new address. It checks that the new owner's address is not a zero address (an invalid address). The function uses the onlyOwner modifier to ensure that only the current owner can call it.

## Getting Started

### Executing program

1. To run this program, you can use Remix at https://remix.ethereum.org/.
2. Create a new file by clicking on the "+" icon in the left-hand sidebar.
3. Save the file with a .sol extension.

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    // Public variable to store the owner's address
    address public owner; 

    // Modifier to restrict access to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can access this function");
        _;
    }

    // Constructor to initialize the contract with a name and symbol
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender; 
    }

    // Function to mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount); 
    }

    // Function to burn tokens 
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Override transfer function to transfer tokens
    function transfer(address to, uint256 amount) override public returns (bool) {
        _transfer(msg.sender, to, amount); 
        return true; 
    }

    // Function to change the owner of the contract
    function changeOwner(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address"); 
        owner = newOwner; 
    }
}
```
To compile the code,

1. Go to the 'Solidity Compiler' tab on the left.
2. Set the Compiler to 0.8.7 or a compatible version, and click Compile.
   
Once compiled,

1. Go to the 'Deploy & Run Transactions' tab on the left.
2. click Deploy.

After deploying, you can interact with the contract.

## Authors

Athulya Jayan V


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
