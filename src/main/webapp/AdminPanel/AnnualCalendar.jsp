<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.HashMap" %>
<%!
    // Helper function to return the day with its ordinal suffix
    public String getOrdinal(int day) {
        if (day >= 11 && day <= 13) {
            return day + "th";
        }
        switch (day % 10) {
            case 1: return day + "st";
            case 2: return day + "nd";
            case 3: return day + "rd";
            default: return day + "th";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Annual Calendar</title>
    <link rel="stylesheet" href="AdminStyles/AnnualCalendar.css">
</head>
<body>
    <%-- Including header and navigation (make sure these files exist) --%>
    <%@ include file="Header.jsp" %>
    <%@ include file="Navbar.jsp" %>

<%
    // Define months, days, and holidays for all 12 months
    ArrayList<HashMap<String, Object>> months = new ArrayList<>();

    String[] monthNames = {
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    };
    int[] daysInMonth = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    String[][] holidays = {
        {"New Year's Day (1st)", "Martin Luther King Jr. Day (15th)"},
        {"Valentine's Day (14th)", "Presidents' Day (19th)"},
        {"St. Patrick's Day (17th)"},
        {"April Fool's Day (1st)", "Easter (7th)"},
        {"Labor Day (1st)", "Memorial Day (27th)"},
        {"Juneteenth (19th)"},
        {"Independence Day (4th)"},
        {}, // August has no holidays
        {"Labor Day (2nd)"},
        {"Halloween (31st)"},
        {"Thanksgiving (28th)"},
        {"Christmas Day (25th)"}
    };

    // Populate the months array with data for each month
    for (int i = 0; i < 12; i++) {
        HashMap<String, Object> month = new HashMap<>();
        month.put("name", monthNames[i]);
        month.put("days", daysInMonth[i]);
        month.put("holidays", holidays[i]);
        months.add(month);
    }

    StringBuilder daysHtml;
%>

<div class="calendar-container">
    <h2 class="calendar-header">Annual Calendar</h2>
    <div class="calendar-grid">
        <%
            // Loop through each month and render its details
            for (HashMap<String, Object> month : months) {
                String name = (String) month.get("name");
                int days = (int) month.get("days");
                String[] monthHolidays = (String[]) month.get("holidays");

                daysHtml = new StringBuilder();
                for (int i = 1; i <= days; i++) {
                    boolean isHoliday = false;
                    // Get the ordinal representation of the day (e.g., "1st", "2nd", etc.)
                    String ordinal = getOrdinal(i);
                    // Check if any holiday string contains the day in ordinal form inside parentheses
                    for (String holiday : monthHolidays) {
                        if (holiday.contains("(" + ordinal + ")")) {
                            isHoliday = true;
                            break;
                        }
                    }
                    daysHtml.append("<div class='calendar-day")
                            .append(isHoliday ? " holiday" : "")
                            .append("'>")
                            .append(i)
                            .append("</div>");
                }
        %>
        <div class="calendar-month">
            <h3><%= name %></h3>
            <div class="calendar-dates">
                <%= daysHtml.toString() %>
            </div>
            <% if (monthHolidays.length > 0) { %>
            <div class="calendar-holidays">
                <h4>Holidays:</h4>
                <ul>
                    <% for (String holiday : monthHolidays) { %>
                    <li><%= holiday %></li>
                    <% } %>
                </ul>
            </div>
            <% } %>
        </div>
        <% } %>
    </div>
    <%@ include file="Footer.jsp" %>
</div>
</body>
</html>
