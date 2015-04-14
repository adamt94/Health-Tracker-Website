<%-- 
    Document   : viewAdvancedStatistics
    Created on : Apr 13, 2015, 11:44:11 PM
    Author     : Stuart
--%>

<%@page import="Models.Past_Weight"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advanced Statistics</title>

        <!--This is for Google Chart -->

        <script type="text/javascript" src="http://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load('visualization', '1', {packages: ['corechart']});
        </script>
        <script type="text/javascript">
            function drawChart()
            {
                // Populate the chart with past weight data
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Date');
                data.addColumn('number', 'Weight');

            <%
                ArrayList<Past_Weight> history = (ArrayList<Past_Weight>) request.getAttribute("weightHistory");

                //If there is data to use
                if (history != null) {

                    for (Past_Weight p : history) {
            %>
                        data.addRow(["<%=p.getDate_recorded()%>", <%=p.getRecorded_weight()%>]);
            <%
                    }// end for
                }//end if
            %>

                // Create and draw the chart
                new google.visualization.LineChart(document.getElementById('lineChart')).
                        draw(data, {backgroundColor: 'transparent',
                            width: 800, height: 400,
                            legend: 'none',
                            curveType: 'function',
                            hAxis: {title: 'Date', titleTextStyle: {color: 'black', fontSize: 12, fontName: 'Verdana, Arial'}},
                            vAxis: {title: 'Weight', titleTextStyle: {color: 'black', fontSize: 12, fontName: 'Verdana, Arial'}},
                            chartArea: {left: 80, top: 20}
                        }
                        );
            }

            google.setOnLoadCallback(drawChart);
        </script>
        <!--This is end of Google Charts scripts -->

    </head>
    <body>
        <h1>Your Weight over Time</h1>
        <!-- This div tells the page where to place the chart -->
        <div id="lineChart"></div>
    </body>
</html>
