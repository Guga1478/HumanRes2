package ar.com.java.humanRes.repositories.interfaces;

import ar.com.java.humanRes.entities.Regions;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_RegionsRepository {
    void save(Regions regions);

    void remove(Regions regions);

    void update(Regions regions);

    List<Regions> getAll();

    default Regions getByRegionId(int regionId) {
        return (Regions)this.getAll().stream().filter((ri) -> {
            return ri.getRegionId() == regionId;
        }).findAny().orElse(new Regions());
    }

    default List<Regions> getLikeRegionName(String regionName) {
        return (List)(regionName == null ? new ArrayList() : (List)this.getAll().stream().filter((ri) -> {
            return ri.getRegionName().toLowerCase().contains(regionName.toLowerCase());
        }).collect(Collectors.toList()));
    }
}