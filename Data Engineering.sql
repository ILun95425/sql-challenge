create table "M9"."departments" (
	dept_no varchar PRIMARY KEY,
	dept_name varchar Not null
);

create table "M9"."dept_emp" (
	emp_no varchar Not Null,
	dept_no varchar Not Null,
	FOREIGN KEY (dept_no) REFERENCES "M9"."departments"(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);


create table "M9"."dept_manager" (
	dept_no varchar Not Null,
    emp_no varchar Not Null,
	FOREIGN KEY (dept_no) REFERENCES "M9"."departments"(dept_no),
	FOREIGN KEY (emp_no, dept_no) REFERENCES "M9"."dept_emp"(emp_no, dept_no),
	PRIMARY KEY (dept_no, emp_no)
);
	

ALTER DATABASE "postgres" SET datestyle TO "ISO, MDY";
create table "M9"."employees" (
	emp_no varchar Not Null,
	emp_title_id varchar Not Null,
	birth_date date Not Null,
	first_name varchar Not Null,
	last_name varchar Not Null,
	SEX CHAR(1) CHECK (SEX IN ('M', 'F')),
	hire_date date Not Null,
	dept_no varchar,
	FOREIGN KEY (emp_no, dept_no) REFERENCES "M9"."dept_emp"(emp_no, dept_no),
	PRIMARY KEY (emp_no, emp_title_id)
);

create table "M9"."salaries" (
	emp_no varchar Not Null,	
	salary int Not Null,
	dept_no varchar,
	FOREIGN KEY (emp_no, dept_no) REFERENCES "M9"."dept_emp"(emp_no, dept_no)
);


create table "M9"."titles" (
	title_id varchar Not null,	
	title varchar Not null,
	emp_title_id varchar,
    FOREIGN KEY (title_id, emp_title_id) REFERENCES "M9"."employees"(emp_no, emp_title_id)
);

--select * from "M9"."titles"

