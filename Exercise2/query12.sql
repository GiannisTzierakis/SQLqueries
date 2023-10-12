select
	airlines.name, count(passengers.id) as count
from 
	airports, routes, flights, flights_has_passengers, airlines, passengers
where
	airports.city = 'London' and airlines.id = routes.airlines_id
    and airports.id = routes.source_id or airports.id = routes.destination_id
    and flights.routes_id = routes_id
    and flights_has_passengers.flights_id = flights_id
    and passengers.id = flights_has_passengers.passengers_id
    
group by passengers.id
order by passengers.id, airlines.id desc
limit 0, 5