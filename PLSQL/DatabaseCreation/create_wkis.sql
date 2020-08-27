DROP TABLE payroll_processing;
DROP TABLE payroll_load;
DROP TABLE transaction_detail;
DROP TABLE transaction_history;
DROP TABLE account;
DROP TABLE account_type;
DROP TABLE new_transactions;
DROP TABLE wkis_error_log;

DROP SEQUENCE wkis_seq;

CREATE SEQUENCE wkis_seq
  START WITH 1
  INCREMENT BY 2;

CREATE TABLE account_type
(account_type_code  	VARCHAR2(2),
 default_trans_type 	CHAR(1),
 description 	    	VARCHAR2(100)
);

CREATE TABLE account
(account_no		NUMBER,
 account_name		VARCHAR2(30),
 account_type_code	VARCHAR2(2),
 account_balance	NUMBER
);

CREATE TABLE transaction_detail
(account_no		NUMBER,
 transaction_no		NUMBER,
 transaction_type	CHAR(1),
 transaction_amount	NUMBER
);

CREATE TABLE transaction_history
(transaction_no		NUMBER,
 transaction_date	DATE,
 description		VARCHAR2(100)
);

CREATE TABLE payroll_load
(payroll_date		DATE,
 employee_id		VARCHAR2(9),
 amount			NUMBER,
 status			CHAR(1)
);

CREATE TABLE payroll_processing
(month_end		CHAR(1),
 payroll		CHAR(1)
);


CREATE TABLE new_transactions
(transaction_no		NUMBER,
 transaction_date	DATE,
 description		VARCHAR2(100),
 account_no		NUMBER,
 transaction_type	CHAR(1),
 transaction_amount	NUMBER
);

CREATE TABLE wkis_error_log AS
  SELECT *
    FROM transaction_history;

ALTER TABLE wkis_error_log
  ADD error_msg VARCHAR2(200);
