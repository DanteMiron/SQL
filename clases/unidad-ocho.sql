-- INTERVALOS

select 
	hire_date,
	MAKE_INTERVAL( years := date_part('year', now())::INTEGER - EXTRACT(years from hire_date)::INTEGER) 
from 
	employees
order BY
	hire_date desc;
	
	
update employees
set hire_date = hire_date + INTERVAL '24 years'

--CLAUSULA CASE THEN


select
	first_name,
	last_name,
	hire_date,
	CASE
		when hire_date > now() - INTERVAL '1 year' then 'Rango A'
		when hire_date > now() - INTERVAL '3 year' then 'Rango B'
		when hire_date > now() - INTERVAL '6 year' then 'Rango C'
		else 'Rango D'
	END as rango_antiguedad
from employees
order by 
	hire_date desc;


