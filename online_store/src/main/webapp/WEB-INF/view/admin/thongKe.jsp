<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quản lý tài khoản</title>
</head>
<body>

<%@include file="include/header.jsp"%>
<%@include file="include/sidebar.jsp"%>
<div class="col-md-9 animated bounce">
    <h3 class="page-header">Thống kê</h3>

    <canvas id="myChart" width="600px" height="400px"></canvas>
    <h4 style="text-align: center; padding-right: 10%">Biểu đồ tổng giá trị đơn hàng hoàn thành theo tháng</h4>

</div>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.3/Chart.min.js"></script>
</body>

<script>
    window.onload = function() {
        var data = [];
        var label = [];
        var dataForDataSets = [];
        // $.ajax({
        //     async : false,
        //     type : "GET",
        //     data : data,
        //     contentType : "application/json",
        //     url : "http://localhost:8080/laptopshop/api/don-hang/report",
        //     success : function(data) {
        //         for (var i = 0; i < data.length; i++) {
        //             label.push(data[i][0] + "/" + data[i][1]);
        //             dataForDataSets.push(data[i][2]/1000000);
        //         }
        //     },
        //     error : function(e) {
        //         alert("Error: ", e);
        //         console.log("Error", e);
        //     }
        // });
        var apiUrl = 'http://localhost:8080/api/donhang/get/all';
        fetch(apiUrl).then(response => {
            return response.json();
        }).then(data => {
            // Work with JSON data here
            console.log(data);
            const names = data.map(item => item.tongGia);
                    for (var i = 0; i < names.length; i++) {
                         label.push(names[i]+ "/" + names[i]);
                        dataForDataSets.push(names[i]/1000000);
                    }
        }).catch(err => {
            // Do something for an error here
        });
        console.log("DATA",dataForDataSets)
        var canvas = document.getElementById('myChart');


        data = {
            labels : label,
            datasets : [ {
                label : "Tổng giá trị ( Triệu đồng)",
                backgroundColor : "#0000ff",
                borderColor : "#0000ff",
                borderWidth : 2,
                hoverBackgroundColor : "#0043ff",
                hoverBorderColor : "#0043ff",
                data : dataForDataSets,
            } ]
        };
        var option = {
            scales : {
                yAxes : [ {
                    stacked : true,
                    gridLines : {
                        display : true,
                        color : "rgba(255,99,132,0.2)"
                    }
                } ],
                xAxes : [ {
                    barPercentage: 0.5,
                    gridLines : {
                        display : false
                    }
                } ]
            },
            maintainAspectRatio: false,
            legend: {
                labels: {
                    // This more specific font property overrides the global property
                    fontSize: 20
                }
            }
        };

        var myBarChart = Chart.Bar(canvas, {
            data : data,
            options : option
        });
    }
</script>

</html>
