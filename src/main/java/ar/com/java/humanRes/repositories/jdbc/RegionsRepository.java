package ar.com.java.humanRes.repositories.jdbc;

import ar.com.java.humanRes.entities.Regions;
import ar.com.java.humanRes.repositories.interfaces.I_RegionsRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RegionsRepository implements I_RegionsRepository {
    private Connection conn;

    public RegionsRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void save(Regions regions) {
        if(regions==null)return;
        String query = "insert into regions (regionId,regionName) values(?,?)";
        try ( PreparedStatement ps = this.conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)){
            ps.setInt(1, regions.getRegionId());
                    ps.setString(2, regions.getRegionName());
                    ps.execute();
                    ResultSet rs = ps.getGeneratedKeys();
                    if (rs.next())regions.setRegionId(rs.getInt(1));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void remove(Regions regions) {
        if(regions==null)return;
        try (PreparedStatement ps = this.conn.prepareStatement("delete from regions where regionId=?")){
            ps.setInt(1, regions.getRegionId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Regions regions) {
        if(regions==null)return;
        try (PreparedStatement ps = this.conn.prepareStatement("update region set regionId=?, regionName=? where regionId=?")){
            ps.setInt(1, regions.getRegionId());
                    ps.setString(2, regions.getRegionName());
                    ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<Regions> getAll() {
        List<Regions> list = new ArrayList();
        try (ResultSet rs = this.conn.createStatement().executeQuery("select * from jobs")){
            while(rs.next()) {
                    list.add(new Regions(
                            rs.getInt("regionId"), 
                            rs.getString("regionName")));
                }
        } catch (Exception e) {
        }
        return list;
    }
    
}
