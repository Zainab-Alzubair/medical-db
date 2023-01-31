CREATE DATABASE medical;

CREATE TABLE patients ( 
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    date_of_birth DATE NOT NULL, 
    PRIMARY KEY(id)
);

CREATE TABLE medical_histories ( 
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
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
    medical_history_id INT REFERENCES medical_histories(id),
    PRIMARY KEY(id)
);

CREATE TABLE invoice_items ( 
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price decimal,
    quantity INT,
    total_price decimal,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY(id)
);

-- Many to many relationship table--
CREATE TABLE medical_histories_treatment ( medical_histories_id INT, treatment_id INT, PRIMARY KEY(id));
ALTER TABLE medical_histories_treatment 
ADD CONSTRAINT medical_histories_fkey 
FOREIGN KEY (medical_histories_id) 
REFERENCES medical_histories(id);

ALTER TABLE medical_histories_treatment 
ADD CONSTRAINT treatment_fkey 
FOREIGN KEY (treatment_id) REFERENCES treatment(id);

---PERFORMANCE IMPROVEMENT---
CREATE index medical_histories_id_index ON medical_histories_treatment (medical_histories_id);
CREATE index medical_histories_id_index ON medical_histories_treatment (treatment_id);




