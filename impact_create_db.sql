-- create DATABASE 
CREATE DATABASE IF NOT EXISTS impact;

-- tell server to use this dastabse
USE impact;

-- disable foreign key checks so tables casn be created in any order
SET foreign_key_checks=0;

-- create officer TABLE 
DROP TABLE IF EXISTS officer;
CREATE TABLE officer (
    id INT NOT NULL AUTO_INCREMENT,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    age INT UNSIGNED NOT NULL,
    addr_number VARCHAR(20) NOT NULL,
    addr_street VARCHAR(50) NOT NULL,
    addr_apt_num VARCHAR(20) NOT NULL,
    addr_city VARCHAR(50) NOT NULL,
    addr_state VARCHAR(2) NOT NULL,
    addr_zip VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

-- create volunteer TABLE 
DROP TABLE IF EXISTS volunteers;
CREATE TABLE volunteers(
    id INT NOT NULL AUTO_INCREMENT ,
    fname VARCHAR(50) NOT NULL ,
    lname VARCHAR(50) NOT NULL ,
    age INT UNSIGNED  NOT NULL ,
    addr_number VARCHAR(20) NOT NULL ,
    addr_street VARCHAR(50) NOT NULL ,
    addr_apt_num VARCHAR(20) NOT NULL ,
    addr_city VARCHAR(50) NOT NULL ,
    addr_state VARCHAR(2) NOT NULL ,
    addr_zip VARCHAR(20) NOT NULL ,
    PRIMARY KEY (id)
);

-- create voluntary events TABLE 
DROP TABLE IF EXISTS voluntary_events;
CREATE TABLE voluntary_events (
    id INT NOT NULL AUTO_INCREMENT ,
    event_name VARCHAR(255) NOT NULL ,
    mission VARCHAR(255) NOT NULL ,
    objectives VARCHAR(255) NOT NULL ,
    phone VARCHAR(20) NOT NULL ,
    addr_number VARCHAR(20) NOT NULL ,
    addr_street VARCHAR(50) NOT NULL ,
    addr_apt_num VARCHAR(20) NOT NULL ,
    addr_city VARCHAR(50) NOT NULL ,
    addr_state VARCHAR(20) NOT NULL ,
    addr_zip VARCHAR(20) NOT NULL ,
    date_of_volunteer DATE  ,
    officer_in_charge INT NOT NULL ,
    PRIMARY KEY (id),
    FOREIGN KEY (officer_in_charge) REFERENCES officer(id) 
);

-- create joins an event TABLE 
DROP TABLE IF EXISTS joins_an_event;
CREATE TABLE joins_an_event(
    event_of_interest INT(1)    ,
    request_date DATE NOT NULL ,
    end_date DATE ,
    event_id INT NOT NULL ,
    volunteer_id INT NOT NULL ,
    PRIMARY KEY (event_id, volunteer_id) ,
    FOREIGN KEY (event_id) REFERENCES voluntary_events(id) ,
    FOREIGN KEY (volunteer_id) REFERENCES volunteers(id) 
);

-- create office TABLE 
DROP TABLE IF EXISTS office;
CREATE TABLE office(
    id INT NOT NULL AUTO_INCREMENT ,
    job_title VARCHAR(255)  ,
    responsibilities VARCHAR(255),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS holds_an_office;
CREATE TABLE holds_an_office(
    office_id INT   ,
    officer_id INT  ,
    start_date DATE NOT NULL,
    end_date DATE   ,
    PRIMARY KEY (office_id, officer_id) ,
    FOREIGN key (office_id) REFERENCES office(id)   ,
    FOREIGN KEY (officer_id) REFERENCES officer(id)
);
-- enable foreign key checks
SET foreign_key_checks=1;
