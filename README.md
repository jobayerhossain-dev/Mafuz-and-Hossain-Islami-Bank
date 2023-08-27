# Mafuz-and-Hossain-Islami-Bank
Simple banking system with MySQL integration

### This is a simple command-line based banking system implemented in Python with MySQL integration. The program allows users to perform basic banking operations such as creating accounts, depositing money, withdrawing funds, and viewing account details.

## Features

- Create a new bank account with the account holder's name, city, and mobile number (11 digits).
- Deposit money into an existing account, updating the account balance.
- Withdraw funds from an account, provided the balance is sufficient.
- View account details, including the account holder's information and current balance.
- Transactions are recorded with details such as the transaction type, account number, and amount.
- MySQL database is used to store account information and transaction history.

## How to Use

1. Make sure you have MySQL installed and running locally.
2. For connect database run this command ``` pip install mysql-connector-python ``` in editor terminal.
3. Modify the database connection parameters (host, user, passwd, port) in the code to match your MySQL configuration.
4. Run the Python script 'main.py'.
5. Choose options from the menu to perform different banking operations.

## Data Validation

Data validation has been incorporated into the code to ensure accurate and secure input. The program prompts users for valid 11-digit mobile numbers and positive integer values for deposit and withdrawal amounts.

## Contributing
Data validation has been incorporated into the code to ensure accurate and secure input. The program prompts users for valid 11-digit mobile numbers and positive integer values for deposit and withdrawal amounts.

## License

This project is licensed under the [MIT License](LICENSE).
