package com.microsoft.example;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.sql.*;
import javax.sql.*;
import com.microsoft.example.models.*;

/**
 * A set of static methods designed to make it easier to access the
 * data living in the associated MySQL database. This is a basically
 * designed to be a simpler approach than Hibernate or JPA, by using
 * straight JDBC and hiding it.
 */
 
 /**
 Comment added by Sachin
 **/
 
public class DataAccess
{
	// Some database-specific details we'll need
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://db:3306/MyShuttleDb";
	private static final String DB_USER = "user";
	private static final String DB_PASS = "password";
	
	private static Connection theConnection;
	static {
		try {
			// Bootstrap driver into JVM
			Class.forName(DB_DRIVER);

			String conStr = System.getenv("MYSQLCONNSTR_MyShuttleDb");
			if (conStr == null || conStr.trim().length() == 0) {
				theConnection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
			} else {
				theConnection = DriverManager.getConnection(conStr);
			}
		}
		catch (Exception ex) {
			// Eh.... just give up
            ex.printStackTrace();
			throw new ExceptionInInitializerError(ex.toString());
		}
	}

	private static PreparedStatement LOGIN;
	private static PreparedStatement FARES;
	private static PreparedStatement GETTOTAL;
	static {
		try {
			LOGIN = theConnection.prepareStatement("SELECT * FROM employees WHERE username=? AND password=?");
			FARES = theConnection.prepareStatement("SELECT * FROM fares WHERE emp_id=?");
			GETTOTAL = theConnection.prepareStatement("SELECT SUM(fare_charge) as totalfare, sum(driver_fee) as totaldriverfee FROM fares WHERE emp_id=?");
		}
		catch (SQLException sqlEx) {
			// Eh.... just give up
			sqlEx.printStackTrace();
			System.exit(-1);
		}
	}

	/**
	 * Simple check to see if login succeeds, without returning the Employee model
	 */
	public static boolean loginSuccessful(String employeeEmail, String employeePassword) {
		return (login(employeeEmail, employeePassword) != null);
	}
	
	/**
	 * Retrieve an employee by username/email and password
	 */
	public static Employee login(String employeeEmail, String employeePassword) {
		try {
			LOGIN.clearParameters();

			LOGIN.setString(1, employeeEmail);
			LOGIN.setString(2, employeePassword);
			
			try (ResultSet rs = LOGIN.executeQuery()) {
				if (rs.next()) {
					Employee emp = new Employee(rs.getInt("id"), rs.getString("username"), rs.getString("password"));
					return emp;
				}
				else
					return null;
			}
		}
		catch (SQLException sqlEx) {
			sqlEx.printStackTrace();
			return null;
		}
	}

	/**
	 * Return all the fares for a given Employee's ID #
	 */	
	public static List<Fare> employeeFares(int empID) {
		try {
			FARES.clearParameters();
	
			FARES.setInt(1, empID);
			
			try (ResultSet rs = FARES.executeQuery()) {
                List<Fare> results = new ArrayList<Fare>(20);
                while (rs.next()) {
                    results.add(new Fare(rs.getInt("id"), rs.getInt("emp_id"),
                        rs.getString("pickup"), rs.getString("dropoff"),
                        rs.getTimestamp("start"), rs.getTimestamp("end"),
                        rs.getInt("fare_charge"), rs.getInt("driver_fee"),
                        rs.getInt("passenger_rating"), rs.getInt("driver_rating")
                    ));
                }
                return results;
            }
		}
		catch (SQLException sqlEx) {
			sqlEx.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	/**
	 * Return all the fares for a given Employee object
	 */
	public static List<Fare> employeeFares(Employee emp) {
		return employeeFares(emp.getID());
	}
	
	public static float getFareTotal(int empID){
		try {
		GETTOTAL.clearParameters();
		
		GETTOTAL.setInt(1, empID);
		
		ResultSet rs = GETTOTAL.executeQuery();
		
		if (rs.next()){		 return (rs.getInt("totalfare")/100.0f);}
		else return -1;
            }catch (SQLException sqlEx) {
    			sqlEx.printStackTrace();
    			return -1;
    		}
            
	}
	public static float getTotalDriverFee(int empID){
		try {
		GETTOTAL.clearParameters();
		
		GETTOTAL.setInt(1, empID);
		
		ResultSet rs = GETTOTAL.executeQuery();
		
		if (rs.next()){		 return (rs.getInt("totaldriverfee")/100.0f);}
		else return -1;
            }catch (SQLException sqlEx) {
    			sqlEx.printStackTrace();
    			return -1;
    		}
            
	}
}