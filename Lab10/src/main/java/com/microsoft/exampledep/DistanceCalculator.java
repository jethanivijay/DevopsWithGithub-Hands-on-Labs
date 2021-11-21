package com.microsoft.exampledep;

import java.util.List;

/**
 * Created by vmadmin on 5/26/17.
 */
public class DistanceCalculator {
    public static int getTotalDistance(List<Route> routes)
    {
        int totalDistance = 0;
        for (Route route : routes) {
            int startLocationIndex = getLocationIndex(route.getPickup());
            int endLocationIndex = getLocationIndex(route.getDropoff());

            totalDistance += Math.abs(endLocationIndex - startLocationIndex);
        }
        return totalDistance;
    }

    private static int getLocationIndex(String location){
        if (location.toUpperCase().contains("TOPSOIL, WA")) return 5;
        if (location.toUpperCase().contains("BEDROCK, WA")) return 3;
        if (location.toUpperCase().contains("ROCK GARDENS, WA")) return 7;
        return 1;
    }
}