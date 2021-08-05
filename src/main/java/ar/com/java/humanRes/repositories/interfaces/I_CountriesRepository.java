package ar.com.java.humanRes.repositories.interfaces;

import ar.com.java.humanRes.entities.Countries;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_CountriesRepository {
    void save(Countries countries);

    void remove(Countries countries);

    void update(Countries countries);

    List<Countries> getAll();

    default Countries getByRegionId(int regionId) {
        return (Countries)this.getAll().stream().filter((c) -> {
            return c.getRegionId() == regionId;
        }).findAny().orElse(new Countries());
    }

    default List<Countries> getLikeCountryName(String countryName) {
        return (List)(countryName == null ? new ArrayList() : (List)this.getAll().stream().filter((c) -> {
            return c.getCountryName().toLowerCase().contains(countryName.toLowerCase());
        }).collect(Collectors.toList()));
    }

    default Countries getByCountryId(String countryId) {
        return (Countries)this.getAll().stream().filter((c) -> {
            return c.getCountryId() == countryId;
        }).findAny().orElse(new Countries());
    }

    default Countries getByCountryNumber(int countryNumber) {
        return (Countries)this.getAll().stream().filter((c) -> {
            return c.getCountryNumber() == countryNumber;
        }).findAny().orElse(new Countries());
    }
}