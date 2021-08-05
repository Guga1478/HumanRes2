package ar.com.java.humanRes.repositories.interfaces;

import ar.com.java.humanRes.entities.Locations;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_LocationsRepository {
    void save(Locations locations);

    void remove(Locations locations);

    void update(Locations locations);

    List<Locations> getAll();

    default Locations getByLocationId(int locationId) {
        return (Locations)this.getAll().stream().filter((l) -> {
            return l.getLocationId() == locationId;
        }).findAny().orElse(new Locations());
    }

    default List<Locations> getByCity(String city) {
        return (List)(city == null ? new ArrayList() : (List)this.getAll().stream().filter((l) -> {
            return l.getCity().toLowerCase().contains(city.toLowerCase());
        }).collect(Collectors.toList()));
    }
}