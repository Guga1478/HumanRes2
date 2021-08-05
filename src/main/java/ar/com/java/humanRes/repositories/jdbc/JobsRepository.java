package ar.com.java.humanRes.repositories.jdbc;

import ar.com.java.humanRes.entities.Jobs;
import ar.com.java.humanRes.repositories.interfaces.I_JobsRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JobsRepository implements I_JobsRepository{
    private Connection conn;

    public JobsRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void save(Jobs jobs) {
        if(jobs==null)return;
        String query = "insert into jobs (jobId,jobTitle,minSalary,maxSalary,controlNumber) values(?,?,?,?,?)";
        try (PreparedStatement ps = this.conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)){
            ps.setString(1, jobs.getJobId());
                    ps.setString(2, jobs.getJobTitle());
                    ps.setInt(3, jobs.getMinSalary());
                    ps.setInt(4, jobs.getMaxSalary());
                    ps.setInt(5, jobs.getControlNumber());
                    ps.execute();
                    ResultSet rs = ps.getGeneratedKeys();
                    if (rs.next())jobs.setControlNumber(rs.getInt(1));
                   
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void remove(Jobs jobs) {
        if(jobs==null)return;
        try (PreparedStatement ps = this.conn.prepareStatement("delete from jobs where controlNumber=?")){
            ps.setInt(1, jobs.getControlNumber());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Jobs jobs) {
        if(jobs==null)return;
        try (PreparedStatement ps = this.conn.prepareStatement("update jobs set jobId=?, jobTitle=?, minSalary=?, maxSalary=?, controlNumber=? where controlNumber=?")){
            ps.setString(1, jobs.getJobId());
                    ps.setString(2, jobs.getJobTitle());
                    ps.setInt(3, jobs.getMinSalary());
                    ps.setInt(4, jobs.getMaxSalary());
                    ps.setInt(5, jobs.getControlNumber());
                    ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<Jobs> getAll() {
        List<Jobs> list = new ArrayList();
        try (ResultSet rs = this.conn.createStatement().executeQuery("select * from jobs")){
            while(rs.next()) {
                    list.add(new Jobs(
                            rs.getString("jobId"), 
                            rs.getString("jobTitle"), 
                            rs.getInt("minSalary"), 
                            rs.getInt("maxSalary"), 
                            rs.getInt("controlNumber")));
                }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
