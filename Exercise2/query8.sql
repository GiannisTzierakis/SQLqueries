select 
	count(distinct passengers.id) as Count
from 
	passengers, routes , flights_has_passengers , airports , flights
where 
	airports.city = "Athens"
    and flights.date between '2010-01-01' and '2015-01-01'
    and passengers.id = flights_has_passengers.passengers_id
	and flights_has_passengers.flights_id = flights.id
	and flights.routes_id = routes.id
    and routes.source_id = airports.id
    and flights.id in 
    (select flights_has_passengers.flights_id
    from flights_has_passengers 
    group by flights_has_passengers.passengers_id
    having count(*) > 5)