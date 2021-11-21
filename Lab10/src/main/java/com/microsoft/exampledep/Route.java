package com.microsoft.exampledep;

public class Route
        implements java.io.Serializable
{
    public Route() {
    }

    public Route(String pickup, String dropoff) {
        this.pickupLocation = pickup;
        this.dropoffLocation = dropoff;
    }

    public String getPickup() {
        return pickupLocation;
    }
    public void setPickup(String value) {
        pickupLocation = value;
    }

    public String getDropoff() {
        return dropoffLocation;
    }
    public void setDropoff(String value) {
        dropoffLocation = value;
    }

    private String pickupLocation;
    private String dropoffLocation;
}