package ar.com.java.humanRes.entities;

public class Jobs {
    private String jobId;
    private String jobTitle;
    private int minSalary;
    private int maxSalary;
    private int controlNumber;

    public Jobs() {
    }

    public Jobs(String jobId, String jobTitle, int minSalary, int maxSalary) {
        this.jobId = jobId;
        this.jobTitle = jobTitle;
        this.minSalary = minSalary;
        this.maxSalary = maxSalary;
    }

    public Jobs(String jobId, String jobTitle, int minSalary, int maxSalary, int controlNumber) {
        this.jobId = jobId;
        this.jobTitle = jobTitle;
        this.minSalary = minSalary;
        this.maxSalary = maxSalary;
        this.controlNumber = controlNumber;
    }

    public String toString() {
        return "Jobs{jobId=" + this.jobId + ", jobTitle=" + this.jobTitle + ", minSalary=" + this.minSalary + ", maxSalary=" + this.maxSalary + ", controlNumber=" + this.controlNumber + '}';
    }

    public String getJobId() {
        return this.jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public String getJobTitle() {
        return this.jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public int getMinSalary() {
        return this.minSalary;
    }

    public void setMinSalary(int minSalary) {
        this.minSalary = minSalary;
    }

    public int getMaxSalary() {
        return this.maxSalary;
    }

    public void setMaxSalary(int maxSalary) {
        this.maxSalary = maxSalary;
    }

    public int getControlNumber() {
        return this.controlNumber;
    }

    public void setControlNumber(int controlNumber) {
        this.controlNumber = controlNumber;
    }
}

