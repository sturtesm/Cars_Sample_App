<%-- 
    Document   : index.jsp
    Created on : Aug 30, 2016, 2:40:33 PM
    Author     : tom.batchelor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="angular.js"></script>
        <script src="angular-route.js"></script>
        <title>Supercar Trader</title>
    </head>
    <body>
        <div ng-app="superCars" ng-controller="mainController">
            <link rel="stylesheet" type="text/css" href="trader.css" />
            <table>
                <tr>
                    <td colspan="5" align="left">
                        <a href="#home">
                            <IMG SRC="images/logo.gif">
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="#manufacturers">
                            <img src="images/supercars_but.gif">
                        </a>
                    </td>
                    <td>
                        <a href="#search">
                            <img src="images/search_but.gif">
                        </a>
                    </td>
                    <td>
                        <a href="#sell">
                            <img src="images/sell_but.gif">
                        </a>
                    </td>
                    <td>
                        <a href="#enquire">
                            <img src="images/enquire_but.gif">
                        </a>
                    </td>
                    <td>
                        <a href="#insurance">
                            <img src="images/insurance_but.gif">
                        </a>
                    </td>
                    <td>
                        <a href="#about">
                            <img src="images/aboutus_but.gif">
                        </a>
                    </td>
                </tr>
            </table>
            <div ng-view></div>
        </div>
        <br />
        <IMG SRC="images/pipe.gif">
        <script src="superCars.js"></script>
        <script src="superCarsController.js"></script>
    </body>
</html>
