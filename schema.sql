/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
id INT GENERATED ALWAYS AS IDENTITY, 
name VARCHAR(250), 
date_of_birth DATE, 
escape_attempts INT, 
neutered BOOL, 
weight_kg real, 
species varchar(255),
PRIMARY KEY(id)
species_id int,
owner_id int
);

CREATE TABLE owners (
    id serial PRIMARY KEY NOT NULL,
    full_name varchar(100),
    age int
);

CREATE TABLE species (
    id serial PRIMARY KEY NOT NULL,
    name varchar(100)
);

ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES species (id);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specialization (
    vet_id INT,
    species_id INT
);

CREATE TABLE visits (
    date DATE,
    vet_id INT,
    animal_id INT
);