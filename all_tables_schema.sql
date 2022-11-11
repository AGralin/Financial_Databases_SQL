DROP TABLE IF EXISTS card_holders CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;

CREATE TABLE card_holders (
  cardholder_id INT PRIMARY KEY,
  name VARCHAR NOT NULL
);

CREATE TABLE credit_card (
  card VARCHAR(20) PRIMARY KEY,
  cardholder_id INT,
  FOREIGN KEY (cardholder_id) REFERENCES card_holders(cardholder_id)
);

CREATE TABLE merchant_category (
  merchant_type_id INT PRIMARY KEY,
  merchant_type VARCHAR NOT NULL
);

CREATE TABLE merchant (
  merchant_id INT PRIMARY KEY,
  merchant_name VARCHAR,
  merchant_type_id INT,
  FOREIGN KEY (merchant_type_id) REFERENCES merchant_category (merchant_type_id)
);

CREATE TABLE transaction (
  transaction_id INT PRIMARY KEY,
  date TIMESTAMP,
  amount INT,
  card VARCHAR (20),
  merchant_id INT,
  FOREIGN KEY (card) REFERENCES credit_card (card),
  FOREIGN KEY (merchant_id) REFERENCES merchant (merchant_id)
);


