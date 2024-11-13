SELECT action_date,
       name 
from person,
    (SELECT  order_date as action_date, person_id  FROM person_order 
    INTERSECT
    SELECT  visit_date as action_date, person_id FROM person_visits 
    ) AS total
WHERE total.person_id = person.id
ORDER BY action_date, name DESC
