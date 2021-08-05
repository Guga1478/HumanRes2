package ar.com.java.humanRes.repositories.jdbc;

import ar.com.java.humanRes.entities.Locations;
import ar.com.java.humanRes.repositories.interfaces.I_LocationsRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LocationsRepository implements I_LocationsRepository{
    private Connection conn;

    public LocationsRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void save(Locations locations) {
        if(locations==null)return;
        String query = "insert into locations (locationId,streetAddress,postalCode,city,stateProvince,countryId) values(?,?,?,?,?,?)";
        try (PreparedStatement ps = this.conn.prepareStatement(query,PreparedStatement.RETURN_GENERATED_KEYS)){
            ps.setInt(1, locations.getLocationId());
                    ps.setString(2, locations.getStreetAddress());
                    ps.setString(3, locations.getPostalCode());
                    ps.setString(4, locations.getCity());
                    ps.setString(5, locations.getStateProvince());
                    ps.setString(6, locations.getCountryId());
                    ps.execute();
                    ResultSet rs = ps.getGeneratedKeys();
                    if (rs.next())locations.setLocationId(rs.getInt(1));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void remove(Locations locations) {
        if(locations==null)return;
        try (PreparedStatement ps = conn.prepareStatement("delete from locations where locationId=?")){
            ps.setInt(1, locations.getLocationId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Locations locations) {
        if(locations==null)return;
        try (PreparedStatement ps = conn.prepareStatement("update locations set locationId=?, streetAddress=?, postalCode=?, city=?, stateProvince=?, countryId=? where locationId=?")){
            ps.setInt(1, locations.getLocationId());
                    ps.setString(2, locations.getStreetAddress());
                    ps.setString(3, locations.getPostalCode());
                    ps.setString(4, locations.getCity());
                    ps.setString(5, locations.getStateProvince());
                    ps.setString(6, locations.getCountryId());
                    ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<Locations> getAll() {
        List<Locations> list = new ArrayList();
        try (ResultSet rs = this.conn.createStatement().executeQuery("select * from jobs")){
            while(rs.next()) {
                    list.add(new Locations(
                            rs.getInt("locationId"), 
                            rs.getString("streetAddress"),
                            rs.getString("postalCode"), 
                            rs.getString("city"), 
                            rs.getString("stateProvince"), 
                            rs.getString("countryId")));
            }
        } catch (Exception e) {
                System.out.println("");
                }
        return list;
        }
    }
    

