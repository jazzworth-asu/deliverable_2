CREATE DATABASE IF NOT EXISTS deliverable_2;
USE deliverable_2;

SET FOREIGN_KEY_CHECKS=0;

-- Officers
DROP TABLE IF EXISTS officers;
CREATE TABLE officers (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) AS (CONCAT(`fname`,' ',`lname`)) NOT NULL,
    fname VARCHAR(16) NOT NULL,
    lname VARCHAR(16) NOT NULL,
    job_title VARCHAR(64) NOT NULL,
    age INT NOT NULL,
    street_address VARCHAR(32) AS (CONCAT(`street`, ' ' ,`number`,' ',`apt_num`)) NOT NULL,
    street VARCHAR(8) NOT NULL,
    number VARCHAR(8) NOT NULL,
    apt_num VARCHAR(8) NOT NULL,
    address VARCHAR(128) AS (CONCAT(`street_address`, ' ' ,`city`,' ',`state`,' ', `zip`)) NOT NULL,
    city VARCHAR(16) NOT NULL,
    state VARCHAR(16) NOT NULL,
    zip VARCHAR(16) NOT NULL,
    responsibilities VARCHAR(64) NOT NULL,
    office_id INT,
    event_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (office_id) REFERENCES offices(id),
    FOREIGN KEY (event_id) REFERENCES events(id)
);

-- Offices
DROP TABLE IF EXISTS offices;
CREATE TABLE offices (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    PRIMARY KEY (id)
);

-- Volunteers
DROP TABLE IF EXISTS volunteers;
CREATE TABLE volunteers (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    age INT NOT NULL,
    street_address VARCHAR(32) AS (CONCAT(`street`, ' ' ,`number`,' ',`apt_num`)) NOT NULL,
    street VARCHAR(8) NOT NULL,
    number VARCHAR(8) NOT NULL,
    apt_num VARCHAR(8) NOT NULL,
    address VARCHAR(128) AS (CONCAT(`street_address`, ' ' ,`city`,' ',`state`,' ', `zip`)) NOT NULL,
    city VARCHAR(16) NOT NULL,
    state VARCHAR(16) NOT NULL,
    zip VARCHAR(16) NOT NULL,

    responsibilities VARCHAR(64) NOT NULL,
    PRIMARY KEY (id)
);

-- Volunteery_Events
DROP TABLE IF EXISTS volunteers_events;
CREATE TABLE volunteers_events (
    id INT NOT NULL AUTO_INCREMENT,
    volunteer_id INT NOT NULL,
    event_id INT NOT NULL,
    request_date DATE NOT NULL,
    end_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (volunteer_id) REFERENCES volunteers(id),
    FOREIGN KEY (event_id) REFERENCES events(id)
);

-- Events
DROP TABLE IF EXISTS events;
CREATE TABLE events (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    mission_id INT NOT NULL,
    code INT NOT NULL,
    officer_id INT NOT NULL,
    date_of_volunteer DATE NOT NULL,
    num_of_attendees INT NOT NULL,
    address VARCHAR(64) NOT NULL,
    phone VARCHAR(16) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (mission_id) REFERENCES missions(id),
    FOREIGN KEY (officer_id) REFERENCES officers(id)
);

-- Mission_Objectives
DROP TABLE IF EXISTS missions_objectives;
CREATE TABLE missions_objectives (
    id INT NOT NULL AUTO_INCREMENT,
    mission_id INT NOT NULL,
    objective_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (mission_id) REFERENCES missions(id),
    FOREIGN KEY (objective_id) REFERENCES objectives(id)
);

-- Mission
DROP TABLE IF EXISTS missions;
CREATE TABLE missions (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(16) NOT NULL,
    PRIMARY KEY (id)
);

-- Objectives
DROP TABLE IF EXISTS objectives;
CREATE TABLE objectives (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(16) NOT NULL,
    PRIMARY KEY (id)
);

SET FOREIGN_KEY_CHECKS=1;


