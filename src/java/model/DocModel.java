package model;

import bean.DocBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DocModel {
    
    static Connection conn=Database.getConnection();

    public static boolean addDoctor(DocBean doc) {
        boolean bstate = false;
        
        try {
            
            PreparedStatement stmt = conn.prepareStatement("insert into doctor values(?,?,?,?,?,?)");

            stmt.setString(1, doc.getId());
            stmt.setString(2, doc.getFirstName());
            stmt.setString(3, doc.getLastName());
            stmt.setString(4, doc.getPassword());
            stmt.setString(5, doc.getPhone());
            stmt.setString(6, doc.getSpecialization());

            int i = stmt.executeUpdate();
            if (i > 0) {
                bstate = true;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bstate;
    }

    public static boolean logDoctor(DocBean doc) {

        boolean bstate = false;

        try {

            PreparedStatement stmt = conn.prepareStatement("select * from doctor where DocID=? and password = ?");

            stmt.setString(1, doc.getId());
            stmt.setString(2, doc.getPassword());

            ResultSet rs = stmt.executeQuery();

            bstate = rs.next();
//            if (rs.next()) {
////                
////                doc.setFirstName(rs.getString("firstName"));
////                doc.setLastName(rs.getString("lastName"));
////                doc.setPhone(rs.getString("phone"));
////                doc.setSpecialization(rs.getString("specialization"));
////
////                System.out.println(doc.getFirstName());
////                System.out.println(doc.getLastName());
////                System.out.println(doc.getPhone());
////                System.out.println(doc.getSpecialization());
//                bstate = true;
//            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bstate;

    }

    public static boolean editDoctor(DocBean doc) {

        boolean bstate = false;

        try {
            PreparedStatement stmt = conn.prepareStatement("update doctor set firstName=?, lastName=?, password=?, phone=?, specialization=? where DocID=?");

            stmt.setString(1, doc.getFirstName());
            stmt.setString(2, doc.getLastName());
            stmt.setString(3, doc.getPassword());
            stmt.setString(4, doc.getPhone());
            stmt.setString(5, doc.getSpecialization());
            stmt.setString(6, doc.getId());

            int rs = stmt.executeUpdate();
            if (rs > 0) {
                bstate = true;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bstate;
    }

    public static void getDoctor(DocBean doc) {

        try {
            PreparedStatement stmt = conn.prepareStatement("select * from doctor where DocID=?");

            stmt.setString(1, doc.getId());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                doc.setFirstName(rs.getString("firstName"));
                doc.setLastName(rs.getString("lastName"));
                doc.setPhone(rs.getString("phone"));
                doc.setSpecialization(rs.getString("specialization"));
                doc.setPassword(rs.getString("password"));
            }
//                System.out.println(doc.getFirstName());
//                System.out.println(doc.getLastName());
//                System.out.println(doc.getPhone());
//                System.out.println(doc.getSpecialization());
            
        } catch (Exception e) {
            e.printStackTrace();
        }
//        return doc;
    }

}
