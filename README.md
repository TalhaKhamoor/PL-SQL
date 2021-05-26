# PL-SQL
This project is based on the We Keep It Storage (WKIS) Company’s system, an accounting system. Transactions (this is a double-entry accounting system) will be taken from a holding table (NEW_TRANSACTIONS) and inserted into the TRANSACTION_DETAIL and TRANSACTION_HISTORY tables. At the same time, the appropriate account balance will be updated in the ACCOUNT table. This system follows a double entry accounting system.

** Please Ensure the WKIS database tables have been successfully created **

The PL-SQL program //

  - It is assumed that ever transaction number is unique for each transaction. A transaction is a unit - and so it will be made up of more than one row. All rows that represent a single transaction will have the same transactional history information.
  - Cursers are used to make this problem easier.
  - As long as the debits equal the credits in each transaction, it is assumed that the accounting equation for each transasction holds true.
  - After a transaction has been successfully processed, it is removed from the NEW_TRANSACTIONS table. Transactions that produce an error remain in the NEW_TRANSACTIONS table.
  - An error is one transaction does not prevent the processing of other transactions.
  - Only the first error in a transaction is recorded in the error log table. If the error is a missing transaction number, a single entry is recorded in the error log table for all rows missing a transaction number.
  - All required tables, including the error log, are created with the provided script. Do not create any additional tables or modify the existing tables. 
  - No use of table of records, or any other type of array.
  - No use of SELECT INTO againts the NEW_TRANSACTIONS table. This table is only referenced by an explicit cursor.
  - Completeted in one anonymous block
  - No use of stored programs
  - No use of GOTOs, EXITS, or SAVEPOINTS.
  - No use of hardcoded values.

Exception handling //

The program handles all exceptions and writes the transactional history information
that caused the error as well as the error message to the WKIS_ERROR_LOG table.

Errors Cauught : 

  - Missing transaction number (NULL transaction number) 
  - Debits and credits are not equal
  - Invalid account number
  - Negative value given for a transaction amount
  - Invalid transaction type 

  Unanticipated errors are also caught. The error messages for these are the system generated ones as a customized descriptive ones are a focal point.
  
  The data in NEW_TRANSACTIONS is clean. To test error handling, modify the transactional data. 
