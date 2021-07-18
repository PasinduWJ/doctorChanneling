package bean;


public class ScheduleBean {
   
    private int scheduleID;
    private String id;
    private String date;
    private String timeFrom;
    private String timeTo;
    private int noPatient;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTimeFrom() {
        return timeFrom;
    }

    public void setTimeFrom(String timeFrom) {
        this.timeFrom = timeFrom;
    }

    public String getTimeTo() {
        return timeTo;
    }

    public void setTimeTo(String timeTo) {
        this.timeTo = timeTo;
    }

    public int getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(int scheduleID) {
        this.scheduleID = scheduleID;
    }

    public int getNoPatient() {
        return noPatient;
    }

    public void setNoPatient(int noPatient) {
        this.noPatient = noPatient;
    }


}
