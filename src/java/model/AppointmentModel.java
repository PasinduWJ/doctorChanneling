package model;

import bean.AppointmentBean;
import bean.ScheduleBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AppointmentModel {
    
    static Connection conn=Database.getConnection();
    
    public static List getAllSchedule() {
        ArrayList list = new ArrayList();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd");

        LocalDate date = LocalDate.now();
        String day = dtf.format(date);

        try {
            
            PreparedStatement stmt = conn.prepareStatement("select * from schedule ORDER BY date,timeFrom");

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                ScheduleBean sc = new ScheduleBean();

                sc.setScheduleID(rs.getInt("scheduleID"));
                sc.setId(rs.getString("DocID"));
                sc.setDate(rs.getString("date"));
                sc.setTimeFrom(rs.getString("timeFrom"));
                sc.setTimeTo(rs.getString("timeTo"));
                sc.setNoPatient(rs.getInt("noPatient"));

                try {

                    Date today = sdf.parse(day);
                    Date d2 = sdf.parse(sc.getDate());
                    if (today.compareTo(d2) < 0) {
                        list.add(sc);
                    }

                } catch (Exception e) {

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean addAppointment(String NIC, int scheduleID) {

        boolean bstate = false;
        try {

            PreparedStatement stmt = conn.prepareStatement("insert into appointment (scheduleID ,NIC) values(?,?)");

            stmt.setInt(1, scheduleID);
            stmt.setString(2, NIC);

            int i = stmt.executeUpdate();
            if (i > 0) {
                bstate = true;

            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AppointmentModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bstate;
    }

    public static List getMyAppointment(String NIC) {

        ArrayList list = new ArrayList();
 
        try {

            PreparedStatement stmt = conn.prepareStatement("select * from appointment where NIC=?");

            stmt.setString(1, NIC);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                AppointmentBean app = new AppointmentBean();

                app.setScheduleID(rs.getInt("scheduleID"));
                app.setAppID(rs.getInt("appID"));

                list.add(app);

            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void deleteAppointment(String appID) {

        try {

            PreparedStatement stmt = conn.prepareStatement("delete from appointment WHERE appID = ?");

            stmt.setInt(1, Integer.parseInt(appID));

            int rs = stmt.executeUpdate();
            
        } catch ( SQLException e) {
            e.printStackTrace();
        }
    }

    public static List getDocAppointmet(AppointmentBean app) {
        ArrayList list = new ArrayList();
       
        try {

            PreparedStatement stmt = conn.prepareStatement("select * from appointment WHERE scheduleID=?");

            stmt.setInt(1, app.getScheduleID());
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                app.setNIC(rs.getString("NIC"));
                app.setAppID(rs.getInt("appID"));

                list.add(app);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int getScheduleCount(int sid) {

        int i = 0;
        try {

            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM appointment WHERE scheduleID=?");

            stmt.setInt(1, sid);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                i++;
            }
            System.out.println(i + "................");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
    
    
    public static int getNoPatient(int sid) {

        int i = 0;
        try {

            PreparedStatement stmt = conn.prepareStatement("SELECT noPatient FROM appointment WHERE scheduleID=?");

            stmt.setInt(1, sid);
            ResultSet rs = stmt.executeQuery();

            i = rs.getInt("noPatient");
//             System.out.println(i);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

}
