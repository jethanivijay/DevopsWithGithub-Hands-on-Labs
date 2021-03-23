package com.microsoft.example.servlet;

import com.microsoft.example.DataAccess;
import com.microsoft.example.models.Employee;

import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Servlet extends HttpServlet
{
    private static final String DB_DRIVER = "com.mysql.jdbc.Driver";

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException
    {
        PrintWriter pw = response.getWriter();
        pw.println("hello, world");

        try {
            pw.println("getting fred");

            Employee employee = DataAccess.login("fred", "fredpassword");
            if (employee == null){
                pw.println("fred is null - boo");
            } else {
                pw.println("Got fred - yay!");
            }
        } catch (Exception e) {
            pw.println("Exception " + e.toString());
        }

        pw.close();
    }
}