package ar.com.java.humanRes.repositories.interfaces;

import ar.com.java.humanRes.entities.Departments;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_DepartmentsRepository {
    void save(Departments departments);

    void remove(Departments departments);

    void update(Departments departments);

    List<Departments> getAll();

    default Departments getByDepartmentId(int departmentId) {
        return (Departments)this.getAll().stream().filter((d) -> {
            return d.getDepartmentId() == departmentId;
        }).findAny().orElse(new Departments());
    }

    default List<Departments> getLikeDepartmentName(String departmentName) {
        return (List)(departmentName == null ? new ArrayList() : (List)this.getAll().stream().filter((d) -> {
            return d.getDepartmentName().toLowerCase().contains(departmentName.toLowerCase());
        }).collect(Collectors.toList()));
    }
}
