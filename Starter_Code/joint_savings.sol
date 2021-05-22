pragma solidity ^0.5.0;

contract joint_savings{
    address payable  accountOne;
    address payable  accountTwo;
    address public lastToWithdraw;
    uint public lastToWithdrawAmount;
    uint public contractBalance;
    
    
    function withdraw(uint amount, address payable recipient) public {
        require (recipient == accountOne || recipient == accountTwo, "You don't own this account");
        require  (address(this).balance >= amount, "You don't have enough funds!");
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
        accountOne = account1;
        accountTwo = account2;
        
    }
    
    function() external payable {}
    
    
}