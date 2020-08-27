ALTER TABLE account_type
  ADD CONSTRAINT pk_wkis_account_type PRIMARY KEY(account_type_code)
  ADD CONSTRAINT ck_trans_type CHECK (default_trans_type IN ('D', 'C'));

ALTER TABLE account
  ADD CONSTRAINT pk_wkis_account PRIMARY KEY(account_no)
  ADD CONSTRAINT fk_account_to_at FOREIGN KEY(account_type_code)
      REFERENCES account_type (account_type_code);

ALTER TABLE transaction_history
  ADD CONSTRAINT pk_transaction_history PRIMARY KEY(transaction_no);

ALTER TABLE transaction_detail
  ADD CONSTRAINT pk_transaction_detail PRIMARY KEY(account_no, transaction_no)
  ADD CONSTRAINT ck_transaction_type CHECK (transaction_type IN ('D', 'C'))
  ADD CONSTRAINT fk_td_to_account FOREIGN KEY(account_no)
      REFERENCES account(account_no)
  ADD CONSTRAINT fk_td_to_transaction FOREIGN KEY(transaction_no)
      REFERENCES transaction_history(transaction_no);


