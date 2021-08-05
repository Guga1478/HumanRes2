package ar.com.java.humanRes.entities;

public class Departments {
    private int departmentId;
    private String departmentName;
    private int managerId;
    private int locationId;

    public Departments() {
    }

    public Departments(int departmentId, String departmentName, int managerId, int locationId) {
        this.departmentId = departmentId;
        this.departmentName = departmentName;
        this.managerId = managerId;
        this.locationId = locationId;
    }

    public Departments(String departmentName, int managerId, int locationId) {
        this.departmentName = departmentName;
        this.managerId = managerId;
        this.locationId = locationId;
    }

    public String toString() {
        return "Departments{departmentId=" + this.departmentId + ", departmentName=" + this.departmentName + ", managerId=" + this.managerId + ", locationId=" + this.locationId + '}';
    }

    public int getDepartmentId() {
        return this.departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return this.departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public int getManagerId() {
        return this.managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public int getLocationId() {
        return this.locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }
}
