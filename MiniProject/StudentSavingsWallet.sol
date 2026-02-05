// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentSavingsWallet {

    // Stores balance of each user
    mapping(address => uint256) private balances;

    // Transaction structure
    struct Transaction {
        address user;
        uint256 amount;
        string txType; // "Deposit" or "Withdraw"
        uint256 timestamp;
    }

    // Array to store all transactions
    Transaction[] private transactions;

    // Events (Bonus)
    event Deposit(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);

    // Deposit ETH into the wallet
    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than 0");

        balances[msg.sender] += msg.value;

        transactions.push(
            Transaction(
                msg.sender,
                msg.value,
                "Deposit",
                block.timestamp
            )
        );

        emit Deposit(msg.sender, msg.value);
    }

    // Withdraw ETH from the wallet
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(amount > 0, "Amount must be greater than 0");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);

        transactions.push(
            Transaction(
                msg.sender,
                amount,
                "Withdraw",
                block.timestamp
            )
        );

        emit Withdrawal(msg.sender, amount);
    }

    // Check caller's balance
    function getMyBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // Get all transactions (for demo/learning)
    function getAllTransactions() public view returns (Transaction[] memory) {
        return transactions;
    }
}
