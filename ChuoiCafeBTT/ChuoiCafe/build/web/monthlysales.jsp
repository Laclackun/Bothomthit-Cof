<%-- 
    Document   : MonthSales
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Monthly Sales</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            img{
                width: 180px;
                height: 180px;
            }


        </style>
    <body>
        <%@ include file="LeftManager.jsp"%>
        <div class="container" style="margin-left: 250px;">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Thống Kê <b>Theo Tháng</b></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <form action="monthlysales" method="get">
            <label for="month">Chọn tháng:</label>
            <select name="month" id="month">
                <option value="1">Tháng 1</option>
                <option value="2">Tháng 2</option>
                <!-- Thêm các option cho các tháng khác -->
            </select>

            <label for="year">Chọn năm:</label>
            <select name="year" id="year">
                <option value="2024">2024</option>
                <option value="2023">2023</option>
                <!-- Thêm các option cho các năm khác -->
            </select>

            <input type="submit" value="Xem thống kê">
        </form>

        <canvas id="monthlySalesChart" width="400" height="400"></canvas>

        <script>
            // Lấy dữ liệu từ server qua attribute monthlySales
            var monthlySalesData = ${monthlySales};

            // Tạo mảng chứa tên sản phẩm và số lượng bán được tương ứng
            var productNames = [];
            var salesData = [];

            for (var i = 0; i < monthlySalesData.length; i++) {
                var productName = monthlySalesData[i][0];
                var sales = monthlySalesData[i][1];
                productNames.push(productName);
                salesData.push(sales);
            }

            // Tạo biểu đồ tròn
            var ctx = document.getElementById('monthlySalesChart').getContext('2d');
            var chart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: productNames,
                    datasets: [{
                            label: 'Số lượng bán được',
                            data: salesData,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                    }
                }
            });
        </script>

        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>