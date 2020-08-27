-- Inserts into ACCOUNT_TYPE

INSERT INTO account_type
VALUES
('A', 'D', 'Asset');

INSERT INTO account_type
VALUES
('L', 'C', 'Liability');

INSERT INTO account_type
VALUES
('EX', 'D', 'Expense');

INSERT INTO account_type
VALUES
('RE', 'C', 'Revenue');

INSERT INTO account_type
VALUES
('OE', 'C', 'Owners Equity');

COMMIT;

-- Inserts into ACCOUNT
--	Assets are in the 1000 range
--	Liabilities are in the 2000 range
--	Revenues are in the 3000 range
--	Expenses are in the 4000 range
--	Owners Equity is account 5555

INSERT INTO account
VALUES
(1250, 'Cash', 'A', 0);

INSERT INTO account
VALUES
(1150, 'Accounts Receivable', 'A', 0);

INSERT INTO account
VALUES
(1850, 'Investment', 'A', 0);

INSERT INTO account
VALUES
(1930, 'Building', 'A', 0);

INSERT INTO account
VALUES
(2050, 'Accounts Payable', 'L', 0);

INSERT INTO account
VALUES
(2580, 'Mortgage', 'L', 0);

INSERT INTO account
VALUES
(4006, 'Mortgage Expense', 'EX', 0);

INSERT INTO account
VALUES
(4045, 'Payroll Expense', 'EX', 0);

INSERT INTO account
VALUES
(4078, 'Utilities Expense', 'EX', 0);

INSERT INTO account
VALUES
(3058, 'Service Revenue', 'RE', 0);

INSERT INTO account
VALUES
(3073, 'Royalty Revenue', 'RE', 0);

INSERT INTO account
VALUES
(5555, 'Owners Equity', 'OE', 0);

COMMIT;

-- Inserts into NEW_TRANSACTIONS
--transaction 1
INSERT INTO new_transactions
VALUES
(wkis_seq.NEXTVAL, TRUNC(SYSDATE), 'Payment for services rendered', 1250, 'D', 30000);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Payment for services rendered', 3058, 'C', 30000);

--transaction 2
INSERT INTO new_transactions
VALUES
(wkis_seq.NEXTVAL, TRUNC(SYSDATE), 'Investment purchased', 1850, 'D', 30000);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Investment purchased', 1250, 'C', 30000);

--transaction 3
INSERT INTO new_transactions
VALUES
(wkis_seq.NEXTVAL, TRUNC(SYSDATE), 'Royalty revenue', 1250, 'D', 10000);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Royalty revenue', 3073, 'C', 10000);

--transaction 4
INSERT INTO new_transactions
VALUES
(wkis_seq.NEXTVAL, TRUNC(SYSDATE), 'New property purchased', 1930, 'D', 129400);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'New property purchased', 2580, 'C', 120000);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'New property purchased', 1250, 'C', 9400);

--transaction 5
INSERT INTO new_transactions
VALUES
(wkis_seq.NEXTVAL, TRUNC(SYSDATE), 'Invoiced for services rendered', 1150, 'D', 1400);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Invoiced for services rendered', 3058, 'C', 1400);

--transaction 6
INSERT INTO new_transactions
VALUES
(wkis_seq.NEXTVAL, TRUNC(SYSDATE), 'Payroll processed', 4045, 'D', 50000);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Payroll processed', 2050, 'C', 50000);

--transaction 7
INSERT INTO new_transactions
VALUES
(wkis_seq.NEXTVAL, TRUNC(SYSDATE), 'Monthend roll to owners equity', 3058, 'D', 31400);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Monthend roll to owners equity', 3073, 'D', 10000);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Monthend roll to owners equity', 5555, 'D', 8600);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Monthend roll to owners equity', 4045, 'C', 50000);

--transaction 8
INSERT INTO new_transactions
VALUES
(wkis_seq.NEXTVAL, TRUNC(SYSDATE), 'Payment for services rendered', 1250, 'D', 40000);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Payment for services rendered', 3058, 'C', 40000);

--transaction 9
INSERT INTO new_transactions
VALUES
(wkis_seq.NEXTVAL, TRUNC(SYSDATE), 'Mortgage payment', 4006, 'D', 15000);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Mortgage payment', 1250, 'C', 15000);

--transaction 10
INSERT INTO new_transactions
VALUES
(wkis_seq.NEXTVAL, TRUNC(SYSDATE), 'Monthend roll to owners equity', 3058, 'D', 40000);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Monthend roll to owners equity', 4006, 'C', 15000);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Monthend roll to owners equity', 5555, 'C', 25000);

--transaction 11
INSERT INTO new_transactions
VALUES
(wkis_seq.NEXTVAL, TRUNC(SYSDATE), 'Payroll processed', 4045, 'D', 5000);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Payroll processed', 2050, 'C', 5000);

--transaction 12
INSERT INTO new_transactions
VALUES
(wkis_seq.NEXTVAL, TRUNC(SYSDATE), 'Payroll paid', 2050, 'D', 10000);

INSERT INTO new_transactions
VALUES
(wkis_seq.CURRVAL, TRUNC(SYSDATE), 'Payroll paid', 1250, 'C', 10000);



COMMIT;

-- Inserts into PAYROLL_PROCESSING

INSERT INTO payroll_processing
VALUES
('Y', 'Y');

COMMIT;
