package ar.com.java.humanRes.repositories.jdbc;

import ar.com.java.humanRes.entities.Departments;
import ar.com.java.humanRes.entities.Employees;
import ar.com.java.humanRes.repositories.interfaces.I_EmployeesRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmployeesRepository implements I_EmployeesRepository {

    private Connection conn;

    public EmployeesRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void save(Employees employees) {
        if (employees == null) {
            return;
        }
        String query = "insert into employees (employeeId,firstName,lastName,email,phoneNumber,hireDate,jobId,salary,commisionPct,managerId,departmentId) values(?,?,?,?,?,?,?,?,?,?,?)";
        try ( PreparedStatement ps = this.conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, employees.getEmployeeId());
            ps.setString(2, employees.getFirstName());
            ps.setString(3, employees.getLastName());
            ps.setString(4, employees.getEmail());
            ps.setString(5, employees.getPhoneNumber());
            ps.setString(6, employees.getHireDate());
            ps.setString(7, employees.getJobId());
            ps.setInt(8, employees.getSalary());
            ps.setInt(9, employees.getCommisionPct());
            ps.setInt(10, employees.getManagerId());
            ps.setInt(11, employees.getDepartmentId());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                employees.setEmployeeId(rs.getInt(1));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void remove(Employees employees) {
        if (employees == null) {
            return;
        }
        try ( PreparedStatement ps = this.conn.prepareStatement("delete from employees where employeeId=?")) {
            ps.setInt(1, employees.getEmployeeId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Employees employees) {
        if(employees==null)return;
        try (PreparedStatement ps = this.conn.prepareStatement("update employees set employeeId=?, firstName=?, lastName=?, email=?, phoneNumber=?, hireDate=?,jobId=?, salary=?, commisionPct=?, managerId=?, departmentId=?, where employeeId=?")){
            ps.setInt(1, employees.getEmployeeId());
                    ps.setString(2, employees.getFirstName());
                    ps.setString(3, employees.getLastName());
                    ps.setString(4, employees.getEmail());
                    ps.setString(5, employees.getPhoneNumber());
                    ps.setString(6, employees.getHireDate());
                    ps.setString(7, employees.getJobId());
                    ps.setInt(8, employees.getSalary());
                    ps.setInt(9, employees.getCommisionPct());
                    ps.setInt(10, employees.getManagerId());
                    ps.setInt(11, employees.getDepartmentId());
                    ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<Employees> getAll() {
        List<Employees> list = new ArrayList();
        try (ResultSet rs = this.conn.createStatement().executeQuery("select * from employees")){
            while(rs.next()) {
                    list.add(new Employees(
                            rs.getInt("employeeId"), 
                            rs.getString("firstName"), 
                            rs.getString("lastName"), 
                            rs.getString("email"), 
                            rs.getString("phoneNumber"),
                            rs.getString("hireDate"), 
                            rs.getString("jobId"), 
                            rs.getInt("salary"), 
                            rs.getInt("commisionPct"),
                            rs.getInt("managerId"), 
                            rs.getInt("departmentId")));
                }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
