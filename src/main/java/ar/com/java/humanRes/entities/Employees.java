package ar.com.java.humanRes.entities;

public class Employees {
    private int employeeId;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String hireDate;
    private String jobId;
    private int salary;
    private int commisionPct;
    private int managerId;
    private int departmentId;

    public Employees() {
    }

    public Employees(int employeeId, String firstName, String lastName, String email, String phoneNumber, String hireDate, String jobId, int salary, int commisionPct, int managerId, int departmentId) {
        this.employeeId = employeeId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.hireDate = hireDate;
        this.jobId = jobId;
        this.salary = salary;
        this.commisionPct = commisionPct;
        this.managerId = managerId;
        this.departmentId = departmentId;
    }

    public Employees(String firstName, String lastName, String email, String phoneNumber, String hireDate, String jobId, int salary, int commisionPct, int managerId, int departmentId) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.hireDate = hireDate;
        this.jobId = jobId;
        this.salary = salary;
        this.commisionPct = commisionPct;
        this.managerId = managerId;
        this.departmentId = departmentId;
    }

    public String toString() {
        return "Employees{employeeId=" + this.employeeId + ", firstName=" + this.firstName + ", lastName=" + this.lastName + ", email=" + this.email + ", phoneNumber=" + this.phoneNumber + ", hireDate=" + this.hireDate + ", jobId=" + this.jobId + ", salary=" + this.salary + ", commisionPct=" + this.commisionPct + ", managerId=" + this.managerId + ", departmentId=" + this.departmentId + '}';
    }

    public int getEmployeeId() {
        return this.employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return this.phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getHireDate() {
        return this.hireDate;
    }

    public void setHireDate(String hireDate) {
        this.hireDate = hireDate;
    }

    public String getJobId() {
        return this.jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public int getSalary() {
        return this.salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public int getCommisionPct() {
        return this.commisionPct;
    }

    public void setCommisionPct(int commisionPct) {
        this.commisionPct = commisionPct;
    }

    public int getManagerId() {
        return this.managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public int getDepartmentId() {
        return this.departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }
}
