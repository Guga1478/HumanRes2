package ar.com.java.humanRes.repositories.interfaces;

import ar.com.java.humanRes.entities.Jobs;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_JobsRepository {
    void save(Jobs jobs);

    void remove(Jobs jobs);

    void update(Jobs jobs);

    List<Jobs> getAll();

    default Jobs getByControlNumber(int controlNumber) {
        return (Jobs)this.getAll().stream().filter((j) -> {
            return j.getControlNumber() == controlNumber;
        }).findAny().orElse(new Jobs());
    }

    default List<Jobs> getLikeJobTitle(String jobTitle) {
        return (List)(jobTitle == null ? new ArrayList() : (List)this.getAll().stream().filter((j) -> {
            return j.getJobTitle().toLowerCase().contains(jobTitle.toLowerCase());
        }).collect(Collectors.toList()));
    }

    default Jobs getByJobTitle(String jobTitle) {
        return (Jobs)this.getAll().stream().filter((j) -> {
            return j.getJobTitle() == jobTitle;
        }).findAny().orElse(new Jobs());
    }
}

