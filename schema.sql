DROP TABLE IF EXISTS merchant
DROP TABLE IF EXISTS merchant_category
DROP TABLE IF EXISTS transaction
DROP TABLE IF EXISTS card_holder
DROP TABLE IF EXISTS credit_card

CREATE TABLE merchant_category (
    merchant_category_id SERIAL PRIMARY KEY,
    name VARCHAR(30)
)

CREATE TABLE merchant (
    merchant_id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    merchant_category_id integer NOT NULL,
    FOREIGN KEY (merchant_category_id) REFERENCES merchant_category(merchant_category_id)
)

CREATE TABLE card_holder (
    card_holder_id SERIAL PRIMARY KEY,
    name VARCHAR(30)
)

CREATE TABLE credit_card (
    card_number VARCHAR(20) PRIMARY KEY,
    card_holder_id integer NOT NULL,
    FOREIGN KEY (card_holder_id) REFERENCES card_holder(card_holder_id)
)

CREATE TABLE transaction (
    transaction_id SERIAL PRIMARY KEY,
    date TIMESTAMP,
    amount MONEY,
    card_number VARCHAR(20) NOT NULL,
    FOREIGN KEY (card_number) REFERENCES credit_card(card_number),
    merchant_id integer NOT NULL,
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id)
)