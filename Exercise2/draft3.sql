select 
	passengers.name, passengers.surname

from
	passengers, flights_has_passengers
    
where passengers.id in
	(select passengers.id
    from passengers, flights_has_passengers, flights, routes, airports
    where passengers.id = flights_has_passengers.passengers_id
    and flights_has_passengers.flights_id = flights.id
    and flights.date >= '2014-01-01' and flights.date <= '2015-01-01'
    and flights.routes_id = routes.id
    and routes.source_id = airports.id
    and airports.name = 'Athens El. Venizelos'
    group by flights.id
    having count(*) >= 4);