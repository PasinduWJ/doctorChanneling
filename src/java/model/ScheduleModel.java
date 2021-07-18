package model;

import bean.ScheduleBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ScheduleModel {

    static Connection conn=Database.getConnection();
    
    public static boolean addSchedule(ScheduleBean sc) {

        boolean bstate = false;

        if (!getScheduleToUpdate(sc)) {

            try {

                PreparedStatement stmt = conn.prepareStatement("insert into schedule(DocID,date,timeFrom,timeTo,noPatient) "
                        + " values(?,?,?,?,?) ");

                stmt.setString(1, sc.getId());
                stmt.setString(2, sc.getDate());
                stmt.setString(3, sc.getTimeFrom());
                stmt.setString(4, sc.getTimeTo());
                stmt.setInt(5, sc.getNoPatient());
//            stmt.setString(6, sc.getId());
//            stmt.setString(7, sc.getDate());

                int i = stmt.executeUpdate();
                if (i > 0) {
                    bstate = true;
                }
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bstate;
    }

    public static List getAllSchedule(String id) {

        ArrayList list = new ArrayList();
        try {

            PreparedStatement stmt = conn.prepareStatement("select * from schedule where DocID=? ORDER BY date,timeFrom ");

            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                ScheduleBean sc = new ScheduleBean();

                sc.setScheduleID(rs.getInt("scheduleID"));
                sc.setDate(rs.getString("date"));
                sc.setTimeFrom(rs.getString("timeFrom"));
                sc.setTimeTo(rs.getString("timeTo"));
                sc.setNoPatient(rs.getInt("noPatient"));

                list.add(sc);

            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List getAllScheduleD(String id) {

        ArrayList list = new ArrayList();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd");

        LocalDate date = LocalDate.now();
        String day = dtf.format(date);

        try {

            PreparedStatement stmt = conn.prepareStatement("select * from schedule where DocID=? ORDER BY date,timeFrom");

            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                ScheduleBean sc = new ScheduleBean();

                sc.setScheduleID(rs.getInt("scheduleID"));
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

    public static boolean editSchedule(ScheduleBean sc) {

        boolean bstate = false;
        try {
   
            PreparedStatement stmt = conn.prepareStatement("update schedule set timeFrom=?, timeTo=?, noPatient=? where scheduleID =?");

            stmt.setString(1, sc.getTimeFrom());
            stmt.setString(2, sc.getTimeTo());
            stmt.setInt(3, sc.getNoPatient());
            stmt.setInt(4, sc.getScheduleID());

            int rs = stmt.executeUpdate();
            if (rs > 0) {
                bstate = true;
            }
           
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bstate;
    }

    public static boolean deleteSchedule(String scheduleID) {

        boolean bstate = false;

        try {

            PreparedStatement stmt = conn.prepareStatement("delete from schedule WHERE scheduleID = ?");

            stmt.setInt(1, Integer.parseInt(scheduleID));

            int rs = stmt.executeUpdate();
            if (rs > 0) {
                bstate = true;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bstate;
    }

    public static void getSchedule(ScheduleBean sc) {

        try {

            PreparedStatement stmt = conn.prepareStatement("select * from schedule where scheduleID=? ORDER BY date,timeFrom");

            stmt.setInt(1, sc.getScheduleID());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                sc.setId(rs.getString("DocID"));
                sc.setDate(rs.getString("date"));
                sc.setTimeFrom(rs.getString("timeFrom"));
                sc.setTimeTo(rs.getString("timeTo"));
                sc.setNoPatient(rs.getInt("noPatient"));

            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean getScheduleToUpdate(ScheduleBean sc) {

        boolean bstate = false;

        try {
    
            PreparedStatement stmt = conn.prepareStatement("select * from schedule where DocID=? AND date =?");

            stmt.setString(1, sc.getId());
            stmt.setString(2, sc.getDate());
            ResultSet rs = stmt.executeQuery();

            bstate = rs.next();
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bstate;
    }

}
