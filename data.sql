/* Populate database with sample data. */
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '2020-02-03', 0, true, 10.23), 
('Gabumon', '2018-11-15', 2, true, 8), 
('Pikachu', '2021-01-07', 1, false, 15.04), 
('Devimon', '2017-05-12', 5, true, 11)
('Charmander', '2020-02-08', 0, false, 11), 
('Plantmon', '2021-11-15', 2, true, 5.7), 
('Squirtle', '1993-04-02', 3, false, 12.13), 
('Angemon', '2005-06-12', 1, true, 45), 
('Boarmon', '2005-06-07', 7, true, 20.4), 
('Blossom', '1998-10-13', 3, true, 17), 
('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob', 45),
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'),
       ('Digimon');



UPDATE animals SET species_id=1;
UPDATE animals SET species_id=2
WHERE name like '%mon';

UPDATE animals SET owner_id=1
WHERE name='Agumon';

UPDATE animals SET owner_id=2
WHERE name='Gabumon' OR name='Pikachu';

UPDATE animals SET owner_id=3
WHERE name='Devimon' OR name='Plantmon';

UPDATE animals SET owner_id=4
WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';

UPDATE animals SET owner_id=5
WHERE name='Angemon' OR name='Boarmon';

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Vet William Tatcher', 45, '2000-03-23'),
       ('Vet Maisy Smith', 26, '2019-01-17'),
       ('Vet Stephanie Mendez', 64, '1981-05-04'),
       ('Vet Jack Harkness', 38, '2008-01-07');

INSERT INTO specialization (vet_id, species_id)
VALUES (1, 1),
       (3, 1),
       (3, 2),
       (4, 2);

INSERT INTO visits (date, vet_id, animal_id)
VALUES ('2020-05-24', 1, 1),
       ('2020-07-22', 3, 1),
       ('2021-02-02', 4, 2),
       ('2020-01-05', 2, 3),
       ('2020-03-08', 2, 3),
       ('2020-05-14', 2, 3),
       ('2021-05-04', 3, 4),
       ('2021-02-24', 4, 5),
       ('2019-12-21', 2, 6),
       ('2019-08-10', 1, 6),
       ('2021-04-07', 2, 6),
       ('2019-09-29', 3, 7),
       ('2020-10-03', 4, 8),
       ('2020-11-04', 4, 8),
       ('2019-01-24', 2, 9),
       ('2019-05-15', 2, 9),
       ('2020-02-27', 2, 9),
       ('2020-08-03', 2, 9),
       ('2020-05-24', 3, 10),
       ('2021-01-11', 1, 10);