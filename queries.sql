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
