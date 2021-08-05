package ar.com.java.humanRes.repositories.jdbc;

import ar.com.java.humanRes.entities.Countries;
import ar.com.java.humanRes.entities.Departments;
import ar.com.java.humanRes.repositories.interfaces.I_DepartmentsRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DepartmentsRepository implements I_DepartmentsRepository {

    private Connection conn;

    public DepartmentsRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void save(Departments departments) {
        if (departments == null) {
            return;
        }
        String query = "insert into departments (departmentId,departmentName,managerId,locationId) values(?,?,?,?)";
        try ( PreparedStatement ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, departments.getDepartmentId());
            ps.setString(2, departments.getDepartmentName());
            ps.setInt(3, departments.getManagerId());
            ps.setInt(4, departments.getLocationId());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                departments.setDepartmentId(rs.getInt(1));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void remove(Departments departments) {
        if (departments == null) {
            return;
        }
        try ( PreparedStatement ps = conn.prepareStatement("delete from departments where departmentId=?")) {
            ps.setInt(1, departments.getDepartmentId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Departments departments) {
        if (departments == null) {
            return;
        }
        try ( PreparedStatement ps = conn.prepareStatement("update departments set departmentId=?, departmentName=?, managerId=?, locationId=? where departmentId=?")) {
            ps.setInt(1, departments.getDepartmentId());
            ps.setString(2, departments.getDepartmentName());
            ps.setInt(3, departments.getManagerId());
            ps.setInt(4, departments.getLocationId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<Departments> getAll() {
        List<Departments> list = new ArrayList();
        try(ResultSet rs = this.conn.createStatement().executeQuery("select * from departments")){
            while(rs.next()) {
                    list.add(new Departments(
                            rs.getInt("departmentId"),
                            rs.getString("departmentName"), 
                            rs.getInt("managerId"), 
                            rs.getInt("locationId")));
                }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
