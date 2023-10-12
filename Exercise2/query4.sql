select distinct
    passengers.name, passengers.surname
from 
    passengers, airlines, flights_has_passengers,flights,routes
where 
    airlines.name = 'British Airways'
    and passengers.id = flights_has_passengers.passengers_id
    and flights.id = flights_has_passengers.flights_id
    and flights.routes_id = routes.id
    and routes.airlines_id = airlines.id
    and passengers.id not in
    (select distinct
        passengers.id
    from 
        passengers, airlines,flights_has_passengers,flights,routes
    where 
        airlines.name <> 'British Airways'
        and passengers.id = flights_has_passengers.passengers_id
        and flights.id = flights_has_passengers.flights_id
        and flights.routes_id = routes.id
        and routes.airlines_id = airlines.id
    )
    order by passengers.name