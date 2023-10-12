select distinct 
    airplanes.manufacturer, airplanes.model, 
        (select max(trips) 
        from 
        (select count(*) as trips 
        from flights 
        group by flights.airplanes_id) as results) as count
from 
    airplanes,airlines,routes,airports a1, airports a2,flights,airlines_has_airplanes
where 
    airlines.name = 'Olympic Airways' 
    and (routes.source_id = a1.id) 
    and (a1.city = 'Athens')
    and (routes.destination_id = a2.id) 
    and (a2.city = 'London')
    and (flights.routes_id = routes.id)
    and (airlines_has_airplanes.airplanes_id = airplanes.id)
    and (airlines_has_airplanes.airlines_id = airlines.id)
    and (flights.date between '2011-02-01' and '2014-07-17')
    group by airplanes.manufacturer, airplanes.model