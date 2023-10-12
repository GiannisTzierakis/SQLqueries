select
    count(distinct flights.id) as flights
from 
    passengers, routes , flights_has_passengers , airports , flights
where 
    (routes.source_id = airports.id) 
    and (airports.city= 'Athens') 
    and (passengers.id = flights_has_passengers.passengers_id)
    and (flights_has_passengers.flights_id = flights.id)
    and (flights.routes_id = routes.id)
    and flights.id in 
        (select flights_has_passengers.flights_id
        from flights_has_passengers
        group by flights_has_passengers.flights_id
        having (count(*) >= 5 and count(*) <= 7)
        )