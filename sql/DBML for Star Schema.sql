CREATE TABLE `dim_job` (
  `job_id` int PRIMARY KEY AUTO_INCREMENT,
  `job_title` varchar(255),
  `experience_level` varchar(50),
  `employment_type` varchar(50)
);

CREATE TABLE `dim_company` (
  `company_id` int PRIMARY KEY AUTO_INCREMENT,
  `company_name` varchar(255),
  `company_location` varchar(100),
  `company_size` varchar(50)
);

CREATE TABLE `dim_date` (
  `date_id` int PRIMARY KEY AUTO_INCREMENT,
  `work_year` int
);

CREATE TABLE `dim_location` (
  `location_id` int PRIMARY KEY AUTO_INCREMENT,
  `location_name` varchar(100)
);

CREATE TABLE `fact_ai_jobs` (
  `job_posting_id` int PRIMARY KEY AUTO_INCREMENT,
  `job_id` int,
  `company_id` int,
  `date_id` int,
  `location_id` int,
  `salary_in_usd` decimal(10,2),
  `remote_ratio` varchar(20)
);

ALTER TABLE `fact_ai_jobs` ADD FOREIGN KEY (`job_id`) REFERENCES `dim_job` (`job_id`);

ALTER TABLE `fact_ai_jobs` ADD FOREIGN KEY (`company_id`) REFERENCES `dim_company` (`company_id`);

ALTER TABLE `fact_ai_jobs` ADD FOREIGN KEY (`date_id`) REFERENCES `dim_date` (`date_id`);

ALTER TABLE `fact_ai_jobs` ADD FOREIGN KEY (`location_id`) REFERENCES `dim_location` (`location_id`);

ALTER TABLE `fact_ai_jobs` ADD FOREIGN KEY (`location_id`) REFERENCES `fact_ai_jobs` (`date_id`);
