# Importing the MySQL connector library
import mysql.connector 


# Function to get integer input with validation
def get_integer_input(prompt):
    while True:
        try:
            value = int(input(prompt))  # Get user input. Convert it as an integer
            return value
        except ValueError:  # If the input cannot be converted to an integer
            print("Invalid input, Please enter a numeric value.")


# Function to get string input with validation
def get_string_input(prompt):
    while True:
        value = input(prompt)  # Prompt user for input
        if value.replace(" ", "").isalpha():  # Check alphabetic characters
            return value
        print("Invalid input, Please enter a valid string.")


# Function to get a valid 11-digit mobile number
def get_mobile_number(prompt):
    while True:
        mn = input(prompt)  # Prompt user for mobile number
        if mn.isdigit() and len(mn) == 11:  # Check mobile number digits
            return mn
        print("Invalid input, Mobile number should contain 11 digits.")


def get_gender_input(prompt):
    while True:
        gender = input(prompt).lower()
        if gender == "male" or gender == "female":
            return gender
        print("Invalid input. Please enter 'male' or 'female'.")


# Establish database connection
conn = mysql.connector.connect(host="localhost", user="root", passwd="", port="3306", autocommit=True)  # Connecting to the MySQL server
my_cursor = conn.cursor()  # Creating an object named cursor to interact with the database

# Create the 'bank_db' database if it doesn't exist
my_cursor.execute("create database if not exists bank_db")
my_cursor.execute("use bank_db")  # Using the 'bank_db' database

# create necessary tables
my_cursor.execute("create table if not exists bank_account(acc_no int primary key auto_increment,name varchar(30), gender varchar(6), city char(20),mobile_no char(11),balance int(8))")
my_cursor.execute("create table if not exists transaction(acc_no int,amount int(8),ttype char(1),foreign key (acc_no) references bank_account(acc_no))")


print("\n                           Welcome,  'Mafuz & Hossain Islami Bank'") # Bank name
while True:
    print("\n1. Create account  2. Deposit money  3. Withdraw money  4. View account details  5. Exit")
    ch = get_integer_input("Please, enter your choice here: ")  # Get user's choice

    if ch == 1:  # Create a new account
        # Gather user's information
        name = get_string_input("Enter name: ")
        gender = get_gender_input("Enter your gender (male/female): ")
        city = get_string_input("Enter city name: ")
        mn = get_mobile_number("Enter your mobile number: ")
        balance = 0  # Initial balance for a new account

        # Insert account details into 'bank_account' table
        sql = "insert into bank_account(name, gender, city, mobile_no, balance) values (%s, %s, %s, %s, %s)"
        val = (name, gender, city, mn, balance)
        my_cursor.execute(sql, val)

        # Get the last inserted account number
        my_cursor.execute("SELECT LAST_INSERT_ID()")
        account_number = my_cursor.fetchone()[0]

        # Print created account details
        print("\nYour account created successfully!")
        print("Your account number =", account_number)
        my_cursor.execute("SELECT * FROM bank_account WHERE acc_no = %s", (account_number,))
        account_details = my_cursor.fetchone()
        print(account_details)

    elif ch == 2:  # Deposit money
        accno = input("Enter account number: ")
        dp = get_integer_input("Enter amount to be deposited: ")

        ttype = "d"
        my_cursor.execute("insert into transaction values('" + accno + "','" + str(dp) + "','" + ttype + "')")
        my_cursor.execute("update bank_account set balance=balance + '" + str(dp) + "' where acc_no='" + accno + "'")
        print("Rs.", dp, " has been deposited successfully in account no. ", accno)

    elif ch == 3:  # Withdraw money
        accno = input("Enter account number: ")
        wd = get_integer_input("Enter amount to be withdrawn: ")

        select_Query = "select balance from bank_account where acc_no = '" + accno + "' "
        my_cursor.execute(select_Query)
        bal = my_cursor.fetchone()[0]
        if wd <= bal:  # Check enough balance to withdraw
            ttype = "w"
            my_cursor.execute("insert into transaction values('" + accno + "','" + str(wd) + "','" + ttype + "')")
            my_cursor.execute(
                "update bank_account set balance=balance - '" + str(wd) + "' where acc_no='" + accno + "'")
            print("Rs.", wd, " has been withdrawn successfully from account no. ", accno)
        else:
            print("Can't withdraw money. Insufficient balance!")

    elif ch == 4:  # View account details
        accno = input("Enter account number: ")
        my_cursor.execute("select * from bank_account where acc_no='" + accno + "'")
        for i in my_cursor:
            print(i)

    elif ch == 5:  # Exit
        break
