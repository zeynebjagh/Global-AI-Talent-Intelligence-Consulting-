CREATE DATABASE IF NOT EXISTS AI_Job_Market;
USE AI_Job_Market;


CREATE TABLE dim_job (
  job_id int PRIMARY KEY AUTO_INCREMENT,
  job_title varchar(255),
  experience_level varchar(50),
  employment_type varchar(50)
);

CREATE TABLE dim_company (
  company_id int PRIMARY KEY AUTO_INCREMENT,
  company_name varchar(255),
  company_location varchar(100),
  company_size varchar(50)
);

CREATE TABLE dim_date (
  date_id int PRIMARY KEY AUTO_INCREMENT,
  work_year int
);

CREATE TABLE dim_location (
  location_id int PRIMARY KEY AUTO_INCREMENT,
  location_name varchar(100)
);


CREATE TABLE fact_ai_jobs (
  job_posting_id int PRIMARY KEY AUTO_INCREMENT,
  job_id int,
  company_id int,
  date_id int,
  location_id int,
  salary_in_usd decimal(10,2),
  remote_ratio varchar(20),
  
  CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES dim_job (job_id),
  CONSTRAINT fk_company FOREIGN KEY (company_id) REFERENCES dim_company (company_id),
  CONSTRAINT fk_date FOREIGN KEY (date_id) REFERENCES dim_date (date_id),
  CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES dim_location (location_id)
);