package ar.com.java.humanRes.entities;

public class Regions {
    private int regionId;
    private String regionName;

    public Regions() {
    }

    public Regions(String regionName) {
        this.regionName = regionName;
    }

    public Regions(int regionId, String regionName) {
        this.regionId = regionId;
        this.regionName = regionName;
    }

    public int getRegionId() {
        return this.regionId;
    }

    public void setRegionId(int regionId) {
        this.regionId = regionId;
    }

    public String getRegionName() {
        return this.regionName;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName;
    }

    public String toString() {
        return "Regions{regionId=" + this.regionId + ", regionName=" + this.regionName + '}';
    }
}
