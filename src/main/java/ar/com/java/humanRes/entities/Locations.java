package ar.com.java.humanRes.entities;

public class Locations {
    private int locationId;
    private String streetAddress;
    private String postalCode;
    private String city;
    private String stateProvince;
    private String countryId;

    public Locations() {
    }

    public Locations(int locationId, String streetAddress, String postalCode, String city, String stateProvince, String countryId) {
        this.locationId = locationId;
        this.streetAddress = streetAddress;
        this.postalCode = postalCode;
        this.city = city;
        this.stateProvince = stateProvince;
        this.countryId = countryId;
    }

    public Locations(String streetAddress, String postalCode, String city, String stateProvince, String countryId) {
        this.streetAddress = streetAddress;
        this.postalCode = postalCode;
        this.city = city;
        this.stateProvince = stateProvince;
        this.countryId = countryId;
    }

    public String toString() {
        return "Locations{locationId=" + this.locationId + ", streetAddress=" + this.streetAddress + ", postalCode=" + this.postalCode + ", city=" + this.city + ", stateProvince=" + this.stateProvince + ", countryId=" + this.countryId + '}';
    }

    public int getLocationId() {
        return this.locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public String getStreetAddress() {
        return this.streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getPostalCode() {
        return this.postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStateProvince() {
        return this.stateProvince;
    }

    public void setStateProvince(String stateProvince) {
        this.stateProvince = stateProvince;
    }

    public String getCountryId() {
        return this.countryId;
    }

    public void setCountryId(String countryId) {
        this.countryId = countryId;
    }
}

