CREATE TABLE doctors
(
	doctor_id SERIAL PRIMARY KEY,
	first_name CHARACTER VARYING (50) NOT NULL,
	last_name CHARACTER VARYING (50) NOT NULL,
	specialization CHARACTER VARYING (50),
	room_number INTEGER

);