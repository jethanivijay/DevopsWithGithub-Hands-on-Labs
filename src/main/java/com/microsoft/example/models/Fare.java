package com.microsoft.example.models;

import java.util.Date;

/**
 * Simple class mimicking the structure of the fares table
 * in the database.
 */
public class Fare
    implements java.io.Serializable
{
	public Fare() { }
    
    public Fare(int id, int empId, String pickup, String dropoff,
        Date start, Date end, int fare, int fee, 
        int pRating, int dRating) 
    {
        this.id = id;
        this.employeeID = empId;
        this.pickupLocation = pickup;
        this.dropoffLocation = dropoff;
        this.start = start;
        this.end = end;
        this.farePrice = fare;
        this.driverFee = fee;
        this.passengerRating = pRating;
        this.driverRating = dRating;
    }
	
	public int getId() { return id; }
	
	public int getEmployeeID() { return employeeID; }
	public void setEmployeeID(int value) { employeeID = value; }
	
	public String getPickup() { return pickupLocation; }
	public void setPickup(String value) { pickupLocation = value; }
	
	public String getDropoff() { return dropoffLocation; }
	public void setDropoff(String value) { dropoffLocation = value; }

	public Date getStart() { return start; }
	public void setStart(Date value) { start = value; }
	
	public Date getEnd() { return end; }
	public void setEnd(Date value) { end = value; }
	
	public int getFare() { return farePrice; }
	public float getFareInDollars() { return ((float)farePrice) / 100.0f; }
	public void setFare(int value) { farePrice = value; }
	
	public int getDriverFee() { return driverFee; }
	public float getDriverFeeInDollars() { return ((float)driverFee) / 100.0f; }
	public void setDriverFee(int value) { driverFee = value; }

	public int getPassengerRating() { return passengerRating; }
	public void setPassengerRating(int value) { passengerRating = value; }
	
	public int getDriverRating() { return driverRating; }
	public void setDriverRating(int value) { driverRating = value; }
	
	@Override
	public String toString() {
		return "[Fare " +
			"id:" + id + " " +
			"employeeID:" + employeeID + " " +
			"pickup:" + pickupLocation + " " +
			"dropoff:" + dropoffLocation + " " +
			"start:" + start + " " +
			"end:" + end + " " +
			"fare:" + farePrice + " " +
			"fee:" + driverFee + " " +
			"passengerRating:" + passengerRating + " " +
			"driverRating:" + driverRating + " " +
		"]";
	}

	private int id;
	private int employeeID;
	private String pickupLocation;
	private String dropoffLocation;
	private Date start;
	private Date end;
	private int farePrice;
	private int driverFee;
	private int passengerRating;
	private int driverRating;
}