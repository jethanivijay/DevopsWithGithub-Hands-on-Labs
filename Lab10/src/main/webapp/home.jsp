<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>

<head>
    <title>Employee Fares - <c:out value="${employee.username}"></c:out></title>
    <link rel="shortcut icon" type="image/ico" href="favicon.ico" />
    <link rel="stylesheet" type="text/css" href="App/Themes/Lumen/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="App/Modules/Core/Css/core.css">
    <link rel="stylesheet" type="text/css" href="App/Modules/Core/Css/list.css">
</head>
<body>
    <div class="container-fluid full-width-container">
        <section class="container main-content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <img src="Content/Images/logologin.png">
                    </div>
                    <h2>Employee Fares for <c:out value="${employee.username}"></c:out></h2>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-condensed">
                            <tbody>
    <tr class="info">
                <th>ID</th>
                <th>Start</th>
                <th>Pickup</th>
                <th>End</th>
                <th>Dropoff</th>
                <th>Fare</th>
                <th>Driver</th>
                <th>Pass Rtg</th>
                <th>Drvr Rtg</th>
            </tr>
        <c:forEach items="${employeeList}" var="fare">
            <tr class="table-row">
                <td>${fare.id}</td>
                <td><fmt:formatDate value="${fare.start}" pattern="HH:mm:ss yyyy-MM-dd" /></td>
                <td>${fare.pickup}</td>
                <td><fmt:formatDate value="${fare.end}" pattern="HH:mm:ss yyyy-MM-dd" /></td>
                <td>${fare.dropoff}</td>
                <td>$ ${fare.fareInDollars}</td>
                <td>$ ${fare.driverFeeInDollars}</td>
                <td>${fare.passengerRating}</td>
                <td>${fare.driverRating}</td>
            </tr>
          </c:forEach>

           <tr>
            <td colspan="4" align="right"><strong>Total</strong></td>
            <td><strong><c:out value="${driverDistanceTotal}"></c:out> mi</strong></td>
            <td><strong>$ <c:out value="${fareTotal}"></c:out></strong></td>
            <td><strong>$ <c:out value="${driverFeeTotal}"></c:out></strong></td>
            <td></td>
            <td></td>            
            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="panel-footer">
                    <h5>Internal Use Only</h5>
                </div>
             </div>
        </section>
    </div>
</body>
</html>