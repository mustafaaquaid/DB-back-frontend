create database airline_system;
use airline_system;
# FLIGHTS TABLE WILL BE HANDLED BY ADMIN
CREATE TABLE flight(
      Flight_ID varchar(10) primary key, 
      Flight_departure date,
      Flight_From varchar(50) not null,
      Flight_to varchar(50) not null,
      Flight_Arrival date,
      Flight_status varchar(255) not null DEFAULT "SCHEDULED" #ARRIVED & #IN-FLIGHT Triggers
);

create table passengers(
	Passport_No int(11) primary key,
	First_Name varchar(100),
	Last_Name varchar(100),
    Age int(3),
    Flight_ID varchar(10),
    foreign key (Flight_ID) references flight(Flight_id)
);

CREATE TABLE bookings(
      Booking_ID int(11) primary key auto_increment,	#auto_increment
      Passport_No int(11), #foreign key
	  foreign key (Passport_No) references passengers(Passport_No)
      ON UPDATE cascade 
      ON DELETE cascade,
      Total_Fare int(10) not null,
      Seat_Type varchar(100) not null,
	  Flight_ID varchar(10),
	  foreign key (Flight_ID) references flight(Flight_ID)

);

alter table bookings auto_increment = 10;

insert into passengers(Passport_No, First_Name, Last_Name, Age, Flight_ID) values(123 , "Mustafa", "Quaid", 21, "KHSYD101");
insert into bookings(Passport_No, Total_Fare, Seat_type, Flight_ID) values( 123, 67500, "Economy", "KHSYD101");

# QUERY FOR ADMIN TO INSERT A NEW FLIGHT IN TABLES
insert into flight (Flight_id , Flight_departure,  Flight_From       , Flight_to           , Flight_Arrival) 
			values ("KHSYD101", '2022-02-24'    , "Karachi, Pakistan", "Sydney, Australia", '2022-02-27');

select concat(First_Name," ", Last_Name) AS fullName, Age, Booking_ID AS TicketID, Total_Fare , bookings.Passport_No from bookings
	inner join passengers
    on bookings.Passport_No = passengers.Passport_No
    inner join flight
    on bookings.Flight_ID = flight.Flight_ID where bookings.Passport_No = 123 and Last_Name = "Quaid";
        
#
select * from flight;
select * from bookings;
select * from passengers;
