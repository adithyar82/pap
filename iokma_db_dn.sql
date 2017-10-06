CREATE TABLE `Parents` (
	`Parent_ID` INT(8) NOT NULL AUTO_INCREMENT UNIQUE,
	`Name` TEXT NOT NULL,
	`Mobile` TEXT NOT NULL AUTO_INCREMENT UNIQUE,
	`Email` TEXT NOT NULL UNIQUE,
	`Relationship` TEXT NOT NULL UNIQUE,
	`Actions_Required` varchar(255) NOT NULL,
	`Password` TEXT NOT NULL,
	PRIMARY KEY (`Parent_ID`)
);

CREATE TABLE `Star_Levels` (
	`Star_Level_ID` INT(06) NOT NULL,
	`Name` TEXT NOT NULL,
	`Description` TEXT NOT NULL
);

CREATE TABLE `Belts` (
	`Rank` TEXT NOT NULL
);

CREATE TABLE `Success_Bands` (
	`Band_ID` INT(6) NOT NULL,
	`Name` INT NOT NULL DEFAULT '06'
);

CREATE TABLE `Activity` (
	`Student` TEXT NOT NULL,
	`Date` DATE NOT NULL,
	`Date` DATE NOT NULL
);

CREATE TABLE `Students` (
	`Student_ID` INT(06) NOT NULL AUTO_INCREMENT UNIQUE,
	`Parent_ID` INT(06) NOT NULL,
	`Name` TEXT NOT NULL,
	`Date_of_birth` DATE NOT NULL,
	`Belt` TEXT NOT NULL,
	`Success_bands` varchar(255) NOT NULL,
	`Star_Level` TEXT NOT NULL,
	`School` BOOLEAN NOT NULL,
	`Studio` BOOLEAN NOT NULL
);

CREATE TABLE `Actions_Required` (
	`Action_ID` TEXT NOT NULL UNIQUE,
	`Action` TEXT NOT NULL UNIQUE,
	`Link` TEXT NOT NULL UNIQUE
);

CREATE TABLE `Awards` (
	`Student` TEXT NOT NULL,
	`Award` TEXT NOT NULL
);

CREATE TABLE `Video_Categories` (
	`Category ID` INT(6) NOT NULL,
	`Name` TEXT NOT NULL
);

CREATE TABLE `Star_Exercises` (
	`Star_Level` TEXT NOT NULL,
	`Exercise_Id` INT(6) NOT NULL,
	`Exercise` TEXT NOT NULL,
	`Position` INT NOT NULL,
	`Description` TEXT NOT NULL,
	`Target` INT NOT NULL,
	`Units` TEXT NOT NULL
);

CREATE TABLE `Star_Results` (
	`Date` DATE NOT NULL,
	`Student` TEXT NOT NULL,
	`Star_Level` TEXT NOT NULL,
	`Exercise` TEXT NOT NULL,
	`Score` INT NOT NULL
);

CREATE TABLE `Schools` (
	`School_Id` INT(6) NOT NULL,
	`Name` TEXT NOT NULL,
	`Send_Email` BOOLEAN NOT NULL,
	`Send_Sms` BOOLEAN NOT NULL
);

CREATE TABLE `Videos` (
	`Video_Name` TEXT NOT NULL,
	`Category` TEXT NOT NULL,
	`Link` TEXT NOT NULL
);

ALTER TABLE `Parents` ADD CONSTRAINT `Parents_fk0` FOREIGN KEY (`Actions_Required`) REFERENCES `Actions_Required`(`Action_ID`);

ALTER TABLE `Activity` ADD CONSTRAINT `Activity_fk0` FOREIGN KEY (`Student`) REFERENCES `Students`(`Student_ID`);

ALTER TABLE `Students` ADD CONSTRAINT `Students_fk0` FOREIGN KEY (`Parent_ID`) REFERENCES `Parents`(`Parent_ID`);

ALTER TABLE `Students` ADD CONSTRAINT `Students_fk1` FOREIGN KEY (`Belt`) REFERENCES `Belts`(`Rank`);

ALTER TABLE `Students` ADD CONSTRAINT `Students_fk2` FOREIGN KEY (`Success_bands`) REFERENCES `Success_Bands`(`Band_ID`);

ALTER TABLE `Students` ADD CONSTRAINT `Students_fk3` FOREIGN KEY (`Star_Level`) REFERENCES `Star_Levels`(`Star_Level_ID`);

ALTER TABLE `Students` ADD CONSTRAINT `Students_fk4` FOREIGN KEY (`School`) REFERENCES `Schools`(`School_Id`);

ALTER TABLE `Awards` ADD CONSTRAINT `Awards_fk0` FOREIGN KEY (`Student`) REFERENCES `Students`(`Student_ID`);

ALTER TABLE `Star_Exercises` ADD CONSTRAINT `Star_Exercises_fk0` FOREIGN KEY (`Star_Level`) REFERENCES `Star_Levels`(`Star_Level_ID`);

ALTER TABLE `Star_Results` ADD CONSTRAINT `Star_Results_fk0` FOREIGN KEY (`Student`) REFERENCES `Students`(`Student_ID`);

ALTER TABLE `Star_Results` ADD CONSTRAINT `Star_Results_fk1` FOREIGN KEY (`Star_Level`) REFERENCES `Star_Levels`(`Star_Level_ID`);

ALTER TABLE `Star_Results` ADD CONSTRAINT `Star_Results_fk2` FOREIGN KEY (`Exercise`) REFERENCES `Star_Exercises`(`Exercise_Id`);

ALTER TABLE `Videos` ADD CONSTRAINT `Videos_fk0` FOREIGN KEY (`Category`) REFERENCES `Video_Categories`(`Category ID`);

