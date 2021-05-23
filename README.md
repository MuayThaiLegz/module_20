# Smart contract

## Challenge: A fintech startup company has recently hired you. This company is disrupting the finance industry with its own cross-border, Ethereum-compatible blockchain that connects financial institutions.

What You're Creating
The completed Solidity JointSavings smart contract.

A folder named Execution_Results that contains at least eight images. These images should confirm that the deposit and withdrawal transactions, which are designed to test the JointSavings functionality in the JavaScript VM, worked as expected.

### Instructions

The steps for this Challenge are divided into the following sections:

1 Create a Joint Savings Account Contract in Solidity

2 Compile and Deploy Your Contract in the JavaScript VM

3 Interact with Your Deployed Smart Contract

#### Create a Joint Savings Account Contract in Solidity


1. From the provided starter code, open the Solidity file named joint_savings.sol in the Remix IDE.

2. Define a new contract named JointSavings.

3. Define the following variables in the new contract:

   Two variables of type address payable named accountOne and accountTwo

   A variable of type address public named lastToWithdraw

   Two variables of type uint public named lastWithdrawAmount and contractBalance
   
 -----

4. Define a function named withdraw that accepts two arguments: amount of type uint and recipient of type payable address. In this function, code the following:

   Define a require statement that checks if recipient is equal to either accountOne or accountTwo. If it isn’t, the require statement returns the “You don't own this account!”      text.

   Define a require statement that checks if balance is sufficient for accomplishing the withdrawal operation. If there are insufficient funds, it returns the “Insufficient          funds!” text.

   Add an if statement to check if lastToWithdraw is not equal (!=) to recipient. If it’s not equal, set it to the current value of recipient.

   Call the transfer function of the recipient, and pass it the amount to transfer as an argument.

   Set lastWithdrawAmount equal to amount.

   Set the contractBalance variable equal to the balance of the contract by using address(this).balance to reflect the new balance of the contract.
   
   -----

5. Define a public payable function named deposit. In this function, code the following:

6. Set the contractBalance variable equal to the balance of the contract by using address(this).balance.
Define a public function named setAccounts that takes two address payable arguments, named account1 and account2. In the body of the function, set the values of accountOne and accountTwo to account1 and account2, respectively.

7. Add a fallback function so that your contract can store ether that’s sent from outside the deposit function.


#### Compile and Deploy Your Contract in the JavaScript VM

1. Compile your smart contract. If an error occurs, review your code, and make the necessary changes for a successful compilation.

2. In the Remix IDE, navigate to the “Deploy & Run Transactions” pane, and then make sure that “JavaScript VM” is selected as the environment.

3. Click the Deploy button to deploy your smart contract, and then confirm that it successfully deployed.

-----

#### Interact with Your Deployed Smart Contract


Now that your contract is deployed, it’s time to test its functionality! After each step, capture a screenshot of the execution, and then save it in a folder named Execution_Results. You’ll share this folder with your final submission.

To interact with your deployed smart contract, complete the following steps:

1. Use the setAccounts function to define the authorized Ethereum address that will be able to withdraw funds from your contract.

2. Test the deposit functionality of your smart contract by sending the following amounts of ether. 
 *Transaction 1: Send 1 ether as wei.
 *Transaction 2: Send 10 ether as wei.
 *Transaction 3: Send 5 ether.

3. After each transaction, use the contractBalance function to verify that the funds were added to your contract:
         
4. Once you’ve successfully deposited funds into your contract, test the contract’s withdrawal functionality by withdrawing 5 ether into accountOne and 10 ether into              accountTwo. After each transaction, use the contractBalance function to verify that the funds were withdrawn from your contract. Also, use the lastToWithdraw and                lastWithdrawAmount functions to verify that the address and amount were correct.

--------

### Full Contract Code
```
pragma solidity ^0.5.0;

contract JointSavings{
    address payable  accountOne;
    address payable  accountTwo;
    address public lastToWithdraw;
    uint public lastToWithdrawAmount;
    uint public contractBalance;
    
    
    function withdraw(uint amount, address payable recipient) public {
        require (recipient == accountOne || recipient == accountTwo, "You don't own this account");
        require  (amount <= contractBalance , "You don't have enough funds!");
        if (lastToWithdraw != recipient) {
            lastToWithdraw == recipient;
        }
        recipient.transfer(amount);
        lastToWithdrawAmount = amount;
        contractBalance = address(this).balance;
    }
 
    function deposit () public payable {
        contractBalance = address(this).balance;
    }

    function setAccounts(address payable account1, address payable account2) public{
        accountOne = account1 ;
        accountTwo =  account2 ;
        
    }
    
    function() external payable {}
    
    
}
```
-----

#Technologies

*Solidity is a statically-typed programming language designed for developing smart contracts that run on the Ethereum Virtual Machine, also known as EVM. As specified by Wood it is designed around the ECMAScript syntax to make it familiar for existing web developers; unlike ECMAScript it has static typing and variadic return types.

![solidity](https://blockchainsimplified.com/blog/solidity-programming-the-smart-contract-language-in-ethereum/solidity-programming-definition.jpg)
------

#Remix

*Remix IDE allows developing, deploying and administering smart contracts for Ethereum like blockchains. It can also be used as a learning platform. Start coding online.

![remix](https://miro.medium.com/max/1080/1*mkTfH_SzupDN-sNAiAZn2g.png)
