select distinct
     airports.name, count(distinct passengers.id) as visitors
from  
	airports, airlines, flights, routes, passengers, flights_has_passengers
where 
	airlines.name = "Aegean Airlines"
	and flights.date between '2011-01-01' and '2015-01-01'
    and routes.airlines_id = airlines.id
    and (routes.source_id = airports.id or routes.destination_id = airports.id)
    and flights.routes_id = routes.id
    and flights_has_passengers.flights_id = flights.id
    and flights_has_passengers.passengers_id = passengers.id
    group by airports.name
    order by airports.name