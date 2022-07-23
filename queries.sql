/*Queries that provide answers to the questions from all projects.*/
select * from animals where name like '%mon%';
select name from animals where date_of_birth between '2016-01-01' and '2019-01-01';
select name from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg between 10.4 and 17.3;

begin;
update animals set species = 'unspecified';
select * from animals;
commit;
rollback;


begin;
update animals set species = 'Digimon' where name like '%mon';
update animals set species = 'Pokemon' where species = 'null';
commit;

select * from animals;

begin;
delete from animals;
rollback;

select * from animals;

begin;
delete from animals where date_of_birth > '2022-01-01';
savepoint january_2022;
update animals set weight_kg = weight_kg * -1;
rollback to january_2022;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
commit;

select count(name) from animals;
select count(name) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, count(escape_attempts) from animals where escape_attempts > 0 group by neutered;
select species, min(weight_kg), max(weight_kg) from animals group by species;
select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-12-31' group by species;

-- What animals belong to Melody Pond?
SELECT a.name
  FROM owners o
 INNER JOIN animals a
    ON o.id = a.owner_id
 WHERE o.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT a.name
  FROM animals a
 INNER JOIN species s ON a.species_id = s.id
 WHERE s.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT o.full_name, a.name
  FROM animals a
  FULL OUTER JOIN owners o ON o.id = a.owner_id;

-- How many animals are there per species?
SELECT s.name, COUNT(a.species_id)
  FROM species s
 INNER JOIN animals a on s.id = a.species_id
 GROUP BY s.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT a.name
  FROM animals a
 INNER JOIN species s ON s.id = a.species_id
 INNER JOIN owners o ON a.owner_id = o.id
 WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT a.name
  FROM animals a
 INNER JOIN species s ON s.id = a.species_id
 INNER JOIN owners o ON a.owner_id = o.id
 WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

-- Who owns the most animals?
SELECT o.full_name, COUNT(a.name)
  FROM animals a
 INNER JOIN species s ON s.id = a.species_id
 INNER JOIN owners o ON a.owner_id = o.id
 GROUP BY o.full_name
 ORDER BY COUNT(a.name) DESC
 LIMIT 1;

 SELECT COUNT(DISTINCT (a.name))
  FROM animals a
 INNER JOIN visits vis ON a.id = vis.animal_id
 INNER JOIN vets v ON vis.vet_id = v.id
 WHERE v.name LIKE '%Mendez%';

-- List all vets and their specialties, including vets with no specialties.
SELECT v.name, spe.name
  FROM specialization s
 RIGHT OUTER JOIN vets v ON v.id = s.vet_id
  LEFT OUTER JOIN species spe ON spe.id = s.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT a.name
  FROM animals a
 INNER JOIN visits vis ON a.id = vis.animal_id
 INNER JOIN vets v ON vis.vet_id = v.id
 WHERE v.name LIKE '%Mendez%' AND vis.date BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT a.name, COUNT(DISTINCT(vis.date)) AS visits
  FROM animals a
 INNER JOIN visits vis ON a.id = vis.animal_id
 INNER JOIN vets v ON vis.vet_id = v.id
 GROUP BY a.name
 ORDER BY visits DESC
 LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT a.name, vis.date
  FROM animals a
 INNER JOIN visits vis ON a.id = vis.animal_id
 INNER JOIN vets v ON vis.vet_id = v.id
 WHERE v.name LIKE '%Maisy%'
 ORDER BY date ASC
 LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT a.name, a.date_of_birth, a.escape_attempts, a.neutered, v.name, v.date_of_graduation, v.age, vis.date
  FROM animals a
 INNER JOIN visits vis ON a.id = vis.animal_id
 INNER JOIN vets v ON vis.vet_id = v.id
 WHERE v.name LIKE '%Maisy%'
 ORDER BY date DESC
 LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*)
  FROM vets v
  JOIN visits vis on v.id = vis.vet_id
  JOIN animals a ON vis.animal_id = a.id
  JOIN specialization s on v.id = s.vet_id
 WHERE NOT s.species_id = a.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT a.name, COUNT(vis.date) AS visits
  FROM animals a
 INNER JOIN visits vis ON a.id = vis.animal_id
 INNER JOIN vets v ON vis.vet_id = v.id
 WHERE v.name LIKE '%Maisy%'
 GROUP BY a.name
 ORDER BY visits DESC
 LIMIT 1;
