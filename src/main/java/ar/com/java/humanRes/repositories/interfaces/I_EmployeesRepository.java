package ar.com.java.humanRes.repositories.interfaces;

import ar.com.java.humanRes.entities.Employees;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_EmployeesRepository {
    void save(Employees employees);

    void remove(Employees employees);

    void update(Employees employees);

    List<Employees> getAll();

    default Employees getByEmployeeId(int employeeId) {
        return (Employees)this.getAll().stream().filter((e) -> {
            return e.getEmployeeId() == employeeId;
        }).findAny().orElse(new Employees());
    }

    default List<Employees> getLikeLastName(String lastName) {
        return (List)(lastName == null ? new ArrayList() : (List)this.getAll().stream().filter((e) -> {
            return e.getLastName().toLowerCase().contains(lastName.toLowerCase());
        }).collect(Collectors.toList()));
    }

    default List<Employees> getLikeDepartmentId(int departmentId) {
        return (List)this.getAll().stream().filter((e) -> {
            return e.getDepartmentId() == departmentId;
        }).collect(Collectors.toList());
    }

    default List<Employees> getLikeManagerId(int managerId) {
        return (List)this.getAll().stream().filter((e) -> {
            return e.getManagerId() == managerId;
        }).collect(Collectors.toList());
    }
}
