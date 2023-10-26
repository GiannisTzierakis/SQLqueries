select distinct
	airlines.name, count(distinct flights.id) as Count
from 
	airlines,airplanes,flights,airlines_has_airplanes, routes, airports
where 
	airplanes.manufacturer = "Boeing"
    and airlines_has_airplanes.airlines_id = airlines.id
    and airlines_has_airplanes.airplanes_id = airplanes.id
    and flights.routes_id = routes.id
    and routes.airlines_id = airlines.id
    and flights.airplanes_id = airplanes.id
    group by airlines.name
    order by airlines.name