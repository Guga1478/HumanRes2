package ar.com.java.humanRes.entities;

public class Countries {
    private String countryId;
    private String countryName;
    private int regionId;
    private int countryNumber;

    public Countries() {
    }

    public Countries(String countryId, String countryName, int regionId) {
        this.countryId = countryId;
        this.countryName = countryName;
        this.regionId = regionId;
    }

    public Countries(String countryId, String countryName, int regionId, int countryNumber) {
        this.countryId = countryId;
        this.countryName = countryName;
        this.regionId = regionId;
        this.countryNumber = countryNumber;
    }

    public String toString() {
        return "Countries{countryId=" + this.countryId + ", countryName=" + this.countryName + ", regionId=" + this.regionId + ", countryNumber=" + this.countryNumber + '}';
    }

    public String getCountryId() {
        return this.countryId;
    }

    public void setCountryId(String countryId) {
        this.countryId = countryId;
    }

    public String getCountryName() {
        return this.countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public int getRegionId() {
        return this.regionId;
    }

    public void setRegionId(int regionId) {
        this.regionId = regionId;
    }

    public int getCountryNumber() {
        return this.countryNumber;
    }

    public void setCountryNumber(int countryNumber) {
        this.countryNumber = countryNumber;
    }
}
