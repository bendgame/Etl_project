create database comic_db;

use comic_db;

create table characters(
character_id int primary key
,character_name varchar(100)
,universe varchar(25)
);

create table char_attributes(
attribute_id int primary key
,real_name nvarchar(100)
,character_id int 
,ALIGN nvarchar(25)
,EYE nvarchar(25)
,SEX nvarchar(25)
,Year int
,foreign key(character_id) REFERENCES characters(character_id)
);

create table powers(
power_id int primary key
,power nvarchar(100)
);

create table char_powers(
power_id int
,character_id int
,foreign key(power_id) REFERENCES powers(power_id)
,foreign key(character_id) REFERENCES characters(character_id)
)

