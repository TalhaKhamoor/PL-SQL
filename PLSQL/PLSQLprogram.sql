/********************************************************************************************
* Author: Talha Khamoor                                                                     *
* Date: Feb 28, 2020                                                                        *
* Description:  Takes every new transaction from new transactions table and inserts it      *
*                into the transaction detail. Also inserts into transaction history table   *
*                , however each unique transaction. Then updates the account balance based  *
*                off the equality of transaction type and default transaction type. Finaly  *
*                it deletes the proccesed record from the new transactions table.           *
*                                                                                           *
*********************************************************************************************/

SET SERVEROUTPUT ON
-- Start of PLSQL Block we declare variables
DECLARE
-- Cursor used to loop through new transactions
    CURSOR c_new_transactions IS
        SELECT * 
        FROM new_transactions;
-- Cursor used to loop through accounts
    CURSOR c_account IS
        SELECT *
        FROM ACCOUNT;
-- Constant Variables
    k_debit                 CHAR(1) := 'D';
    k_credit                CHAR(2) := 'C';
-- Local Variables
    v_transaction_no        NUMBER;
    v_oldtransaction_no     NUMBER := 0;
    v_account_type_code     VARCHAR2(2);
    v_default_trans_type    CHAR(1);
-- Begin of PLSQL BLOCK
BEGIN
-- For loop to itterate through new transactions by cursor
    For r_new_transactions IN c_new_transactions LOOP
-- Assigning transaction number variable value from transaction table 
        v_transaction_no := r_new_transactions.transaction_no;
-- if the transaction no is not equal to old one (first iteration its obviously not)
        if (v_transaction_no != v_oldtransaction_no) THEN 
-- Then we insert that record from new transacions into the history table
            Insert INTO TRANSACTION_HISTORY
            VALUES (r_new_transactions.transaction_no,
                   r_new_transactions.transaction_date,
                   r_new_transactions.description);
-- end if
        END IF;
-- Inserting every record from new transactions into detail table
        INSERT INTO TRANSACTION_DETAIL
        VALUES (r_new_transactions.account_no,
               r_new_transactions.transaction_no,
               r_new_transactions.transaction_type,
               r_new_transactions.transaction_amount);
-- setting varaible old transaction number too the current record transaction number
        v_oldtransaction_no := v_transaction_no;
-- For loop to itterate through accounts using account cursor
        for r_account IN c_account LOOP
-- If statement to figure out which account were working with based of new transaction account nunmber
            if (r_account.account_no = r_new_transactions.account_no) THEN
-- Setting variable account type code
                v_account_type_code := r_account.account_type_code;
-- end if and loop
            END IF;
        END LOOP;
-- Using select into to insert value into variable account type code 
        SELECT default_trans_type
        INTO v_default_trans_type
        FROM Account_type
        WHERE account_type_code = v_account_type_code;
-- if statement to check equality of default transaction type and transaction type (for debit)
        if (v_default_trans_type = k_debit) AND (r_new_transactions.transaction_type = k_debit) THEN
-- if the if statement holds true it adds transaction amount to the appropriate account balance
            UPDATE ACCOUNT
            SET account_balance = account_balance + r_new_transactions.transaction_amount
            WHERE Account_no = r_new_transactions.account_no;
-- if statement to check equality of default transaction type and transaction type (for credit)
        ELSE IF (v_default_trans_type = k_credit) AND (r_new_transactions.transaction_type = k_credit) THEN
-- if the if statement holds true it adds transaction amount to the appropriate account balance
            UPDATE ACCOUNT
            SET account_balance = account_balance + r_new_transactions.transaction_amount
            WHERE Account_no = r_new_transactions.account_no;
-- Else 
        ELSE
-- if the other two if's hold untrue we minus from account balance for appropriate account by transaction amount
            UPDATE ACCOUNT
            SET account_balance = account_balance - r_new_transactions.transaction_amount
            WHERE Account_no = r_new_transactions.account_no;
-- ending both if and else if
            END IF;
        END IF;
-- after all the above lines of code are ran we delete the record from new transactions table
        DELETE FROM new_transactions
        WHERE transaction_no = r_new_transactions.transaction_no AND transaction_type = r_new_transactions.transaction_type;
-- end of loop that goes through each new transactions
    END LOOP;
-- saving all changes
    COMMIT;
-- end of PLSQL block
END;
/
