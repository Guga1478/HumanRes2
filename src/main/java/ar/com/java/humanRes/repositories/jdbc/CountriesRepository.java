package ar.com.java.humanRes.repositories.jdbc;

import ar.com.java.humanRes.entities.Countries;
import ar.com.java.humanRes.repositories.interfaces.I_CountriesRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CountriesRepository implements I_CountriesRepository {

    private Connection conn;

    public CountriesRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void save(Countries countries) {
        if (countries == null) return;        
        String query = "insert into countries(countryId,countryName,regionId,countryNumber) values(?,?,?,?)";
        try ( PreparedStatement ps = this.conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, countries.getCountryId());
            ps.setString(2, countries.getCountryName());
            ps.setInt(3, countries.getRegionId());
            ps.setInt(4, countries.getCountryNumber());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next())countries.setCountryNumber(rs.getInt(1));
            
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void remove(Countries countries) {
        if (countries == null) {
            return;
        }
        try ( PreparedStatement ps = this.conn.prepareStatement("delete from countries where countryNumber=?")) {
            ps.setInt(1, countries.getCountryNumber());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Countries countries) {
        if (countries == null) {
            return;
        }
        try ( PreparedStatement ps = this.conn.prepareStatement("update countries set countryId=?, contryName=?, regionId=?, countryNumber=?")) {
            ps.setString(1, countries.getCountryId());
            ps.setString(2, countries.getCountryName());
            ps.setInt(3, countries.getRegionId());
            ps.setInt(4, countries.getCountryNumber());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<Countries> getAll() {
        List<Countries> list = new ArrayList();
        try ( ResultSet rs = this.conn.createStatement().executeQuery("select * from countries")) {
            while (rs.next()) {
                list.add(new Countries(
                        rs.getString("countryId"),
                        rs.getString("countryName"),
                        rs.getInt("regionId"),
                        rs.getInt("countryNumber")
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
