CREATE DATABASE medical;

CREATE TABLE patients ( 
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    PRIMARY KEY(id)
);

CREATE TABLE medical_histories ( 
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_at INT , 
    status VARCHAR(250),
    PRIMARY KEY(id)
);

CREATE TABLE treatments ( 
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(250),
    name VARCHAR(250),
    PRIMARY KEY(id)
);

CREATE TABLE invoices ( 
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount decimal,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE invoice_items ( 
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price decimal,
    quantity INT,
    total_price decimal,
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY(id)
);



