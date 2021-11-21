package com.microsoft.example.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.microsoft.example.*;
import com.microsoft.example.models.*;
import com.microsoft.exampledep.*;

public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
        throws IOException, ServletException
    {
        HttpSession session = request.getSession();
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        Employee employee = DataAccess.login(username, password);
        if (employee != null) {
            session.setAttribute("employee", employee);
            
            // Fetch all the fares for that employee while we're here
            List<Fare> fareList = DataAccess.employeeFares(employee);
            session.setAttribute("employeeList", fareList);
            
            float totalFareforDriver = DataAccess.getFareTotal(employee.getID());
            session.setAttribute("fareTotal", totalFareforDriver);
            
            float totalDriverFee = DataAccess.getTotalDriverFee(employee.getID());
            session.setAttribute("driverFeeTotal", totalFareforDriver);

            List<Route> routes = new ArrayList<Route>(fareList.size());
            for (Fare fare : fareList) {
                routes.add(new Route(fare.getPickup(), fare.getDropoff()));
            }
            int totalDriverDistance = DistanceCalculator.getTotalDistance(routes);
            session.setAttribute("driverDistanceTotal", totalDriverDistance);
            
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("/loginFail.jsp").forward(request, response);
        }
    }
}

