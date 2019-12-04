$(document).ready(function () {
    var numOfNumbers = 0;
    $('button.b1').on('click', function (e) {
        var number = $(this).text();
        $(".input1").val(function (index, val) {
            if (numOfNumbers === 16) {
                return val;
            }
            else if (numOfNumbers % 4 === 0 && val.length !== 0) {
                numOfNumbers++;
                return val + "-" + number;
            }
            else {
                numOfNumbers++;
                return val + number;
            }
        });
    });
    var numOfChar = 0; 
    $("button.b2").on('click', function (e) {
        var number = $(this).text();
        $(".input2").val(function (index, val) {
            if (numOfChar === 4) {
                return val;
            }
            else {
                ++numOfChar;
                return val + number;
            }
        });
    });
    $(".btn1").on('click', function (e) {
        $("input").val(function (index, val) {
            numOfNumbers = 0;
            numOfChar = 0;
            return null;
        });
    });

    $("#btn2").on('click', function (e) {

        $.ajax({
            url: "Home/SearchCard",
            type: "POST",
            data: { "CardNumber": $(".input1").val()},
            success: (res) => {
                if (res.includes("PINCode")) {
                    $("body").html(res);
                }
                else {
                    $("body").html("<form asp-action=\"StartPage\">" + res + "</form>");
                }

            },
            dataType: "html"
        });
    });

    $("#btn3").on('click', function (e) {
        $.ajax({
            url: "Home/GetAccess",
            type: "POST",
            data: {
                "PINCode": $(".input2").val(),
                "CardNumber": $(".input1").val()
            },
            success: (res) => {
                if (res.includes("Operations")) {
                    $("body").html(res);
                }
                else {
                    $("body").html("<form asp-action=\"StartPage\">" + res + "</form>");
                }
            },
            dataType: "html"
        });
    });
    $("#btn4").on('click', function (e) {

        $.ajax({
            url: "Home/GetOperationPage",
            type: "Get",
            success: (res) => {
                $("body").html(res);
            },
            dataType: "html"
        });
    });
    $("#btn5").on('click', function (e) {

        $.ajax({
            url: "Home/WithdrawCash",
            type: "Post",
            data: {
                "Balance": $("#input3").val()
            },
            success: (res) => {
                if (res.includes("WithdrawalResult")) {
                    $("body").html(res);
                }
                else {
                    $("body").html("<form asp-action=\"StartPage\">" + res + "</form>");
                }
            },
            dataType: "html"
        });
    });

    $(".balance").on('click', function (e) {
        $.ajax({
            url: "Home/GetBalancePage",
            type: "GET",
            success: (res) => {
                $("body").html(res);
            },

            dataType: "html"
        });
    });
    $(".withdrawal").on('click', function (e) {

        $.ajax({
            url: "Home/GetWithdrawalPage",
            type: "GET",
            success: (res) => {
                $("body").html(res);
            },

            dataType: "html"
        });
    });




 });