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
,alignment nvarchar(25)
,eye_color nvarchar(15)
,hair_color nvarchar(20)
,gender nvarchar(25)
,first_appearance int
,foreign key(character_id) REFERENCES characters(character_id)
);

create table powers(
power_id int primary key
,power nvarchar(60)
);

create table char_powers(
power_id int
,character_id int
,foreign key(power_id) REFERENCES powers(power_id)
,foreign key(character_id) REFERENCES characters(character_id)
);

CREATE VIEW v_comic_char_data
AS
SELECT c.universe
	,c.character_id
	,c.character_name
	,a.attribute_id
	,a.real_name
	,a.alignment
	,a.eye_color
	,a.hair_color
	,a.gender
	,a.first_appearance
	,p.power_id
	,p.power
FROM characters c
LEFT JOIN char_attributes a ON a.character_id = c.character_id
LEFT JOIN char_powers cp ON cp.character_id = c.character_id
LEFT JOIN powers p ON p.power_id = cp.power_id;
