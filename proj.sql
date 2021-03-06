create table Cities (
	id serial primary key,
	Name varchar (50),
	population int, 
	Country varchar (50) not null, 
	Latitude float not null,
	Longitude float not null
);

create table Users (
	id serial primary key,
	FName varchar (20) not null,
	Minitial char (1) not null,
	Lname varchar (20) not null,
	Email varchar (50) not null,
	pasword varchar (50) not null,
	City int not null references Cities
);

Create table Admins (
	id serial primary key
) inherits (Users);


CREATE FUNCTION getFullName(users) RETURNS text AS $$
declare
	usr alias for $1;
BEGIN
      RETURN usr.Fname || ' ' || usr.Minitial || ' '|| usr.lname;
END
$$ LANGUAGE plpgsql;


CREATE FUNCTION getFullName(Admins) RETURNS text AS $$
declare
	usr alias for $1;
BEGIN
      RETURN usr.Fname || ' ' || usr.Minitial || ' '|| usr.lname;
END
$$ LANGUAGE plpgsql;


Create table services (
	id int primary key,
	details varchar(240) not null,
	responce_time int,
	Phone_1 int not null,
	Phone_2 int,
	Email varchar (50) not null,
	city int not null references Cities
);

Create table disasters (
	id serial primary key,
	city int not null references cities,
	dtype int not null,
	dlevel int not null, 
	Description varchar (100) not null,
	constraint Dlev
    		check (Dlevel >= 0 and Dlevel <5)
);

CREATE FUNCTION FindAffectedUsers(Disasters) RETURNS table (
	FName varchar (20),
	Minitial char (1),
	Lname varchar (20),
	Email varchar (50),
	City int
) AS $$
declare
	DS alias for $1;
	cityid int;
BEGIN
	  select Disasters.city into cityid from Disasters where Disasters.city = DS.city;
	  return query select users.FName, users.Minitial, users.Lname, users.Email, users.City from users where users.city = cityid;
END
$$ LANGUAGE plpgsql;

Create table Downed_Services (
	id serial primary key,
	disasterID int references disasters, 
	Service int not null references Services,
	Down_Time TIMESTAMP not null, 
	Up_Time TIMESTAMP,
	Is_Active bool not null default (true)
);

CREATE FUNCTION CheckServiceStatus(Services) RETURNS bool AS $$
declare
	ser alias for $1;
	status bool;
BEGIN
	  select Is_Active into status from Downed_Services where Service = ser.id;
	  return status;
END
$$ LANGUAGE plpgsql;


CREATE FUNCTION CheckDownedServiceStatus(Downed_Services) RETURNS bool AS $$
declare
	DS alias for $1;
	status bool;
BEGIN
	  select Is_Active into status from Downed_Services where id = DS.id;
	  return status;
END
$$ LANGUAGE plpgsql;

Create table Relief_Aid (
	id serial primary key,
	Start_Time timestamp not null,
	End_Time timestamp not null,
	details varchar(240) not null,
	responce_time int,
	Phone_1 int not null,
	Phone_2 int,
	Email varchar (50) not null,
	city int not null references Cities
) inherits (services);


create table service_short as 
	select id, details, phone_1, city
	from services;
	
	
create table AAUsers (
	primary key (id),
	CHECK (city = 1)
)inherits (Users);
	
create table NUsers (
	primary key (id),
	CHECK (city = 2)
)inherits (Users);
create table GUsers  (
	primary key (id),
	CHECK (city = 3)
)inherits (Users);
create table MUsers  (
	primary key (id),
	CHECK (city = 4)
)inherits (Users);
create table AUsers (
	primary key (id),
	CHECK (city = 5)
)inherits (Users);
	
	
CREATE INDEX user_city_email on users(city,email);
CREATE INDEX aauser_city_email on aausers(city,email);
CREATE INDEX nuser_city_email on nusers(city,email);
CREATE INDEX guser_city_email on gusers(city,email);
CREATE INDEX muser_city_email on musers(city,email);
CREATE INDEX auser_city_email on ausers(city,email);
CREATE INDEX service_email_index on services(email);

