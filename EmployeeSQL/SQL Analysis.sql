-- 1. List the following details of each employee:
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select salary.emp_no, employees.last_name, employees.first_name, employees.sex, salary.salary
from employees as employees
inner join salaries as salary
on salary.emp_no = employees.emp_no
order by salary.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager 
inner join departments 
on dept_manager.dept_no = departments.dept_no
inner join employees 
on dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments 
on dept_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where (first_name = 'Hercules') and (lower(last_name) like 'b%');

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
select departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_emp 
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
select departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_emp 
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where (dept_name = 'Sales') or (dept_name = 'Development');

-- 8. List the frequency count of employee last names 
-- (i.e., how many employees share each last name) in descending order.
select last_name,count(last_name)
from employees 
group by last_name
order by count(last_name) desc;
