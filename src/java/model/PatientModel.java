package model;

import bean.PatientBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PatientModel {

    static Connection conn=Database.getConnection();
    
    public static boolean addPatient(PatientBean patient) {
        boolean bstate = false;

        try {

            PreparedStatement stmt = conn.prepareStatement("insert into patient values(?,?,?,?,?)");

            stmt.setString(1, patient.getNIC());
            stmt.setString(2, patient.getFirstName());
            stmt.setString(3, patient.getLastName());
            stmt.setString(4, patient.getPhone());
            stmt.setString(5, patient.getPassword());

            int i = stmt.executeUpdate();
            if (i > 0) {
                bstate = true;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bstate;
    }

    public static boolean logPatient(PatientBean pat) {

        boolean bstate = false;

        try {

            PreparedStatement stmt = conn.prepareStatement("select * from patient where NIC=? and password = ?");

            stmt.setString(1, pat.getNIC());
            stmt.setString(2, pat.getPassword());

            ResultSet rs = stmt.executeQuery();

            bstate = rs.next();
//            if (rs.next()) {
//                
//                pat.setFirstName(rs.getString("firstName"));
//                pat.setLastName(rs.getString("lastName"));
//                pat.setPhone(rs.getString("phone"));
//
//                System.out.println(doc.getFirstName());
//                System.out.println(doc.getLastName());
//                System.out.println(doc.getPhone());
//                System.out.println(doc.getSpecialization());
//                bstate = true;
//            }
           
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bstate;

    }

    public static boolean editPatient(PatientBean pat) {

        boolean bstate = false;
        try {

            PreparedStatement stmt = conn.prepareStatement("update patient set firstName=?, lastName=?, password=?, phone=? where NIC=?");

            stmt.setString(1, pat.getFirstName());
            stmt.setString(2, pat.getLastName());
            stmt.setString(3, pat.getPassword());
            stmt.setString(4, pat.getPhone());
            stmt.setString(5, pat.getNIC());

            int rs = stmt.executeUpdate();
            if (rs > 0) {
                bstate = true;
            }
           
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bstate;
    }

    public static void getPatient(PatientBean pat) {

        try {

            PreparedStatement stmt = conn.prepareStatement("select * from patient where NIC=?");

            stmt.setString(1, pat.getNIC());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                pat.setFirstName(rs.getString("firstName"));
                pat.setLastName(rs.getString("lastName"));
                pat.setPhone(rs.getString("phone"));
                pat.setPassword(rs.getString("password"));
            }
            System.out.println(pat.getNIC());
//                System.out.println(pat.getPassword());
//                System.out.println(pat.getLastName());
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
