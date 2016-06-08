<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="json_test.aspx.cs" Inherits="WorkSite.json_test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <select id="ddlSelectYear">
    <option>2014</option>
    <option>2015</option>
  </select> 
  <button id="myButton">Get Car Lists</button> 
  <div id="contentHolder"></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavaScriptPlaceHolder" runat="server">
    <script type="text/javascript">
        //*
        $("#myButton").on("click", function (e) {
            e.preventDefault();
            var aData = [];
            aData[0] = $("#ddlSelectYear").val();
            $("#contentHolder").empty();
            var jsonData = JSON.stringify({ aData: aData });
            $.ajax({
                type: "POST",
                //getListOfCars is my webmethod   
                url: "services/cars.asmx/CarList",
                data: jsonData,
                contentType: "application/json; charset=utf-8",
                dataType: "json", // dataType is json format
                success: OnSuccess,
                error: OnErrorCall
            });

            function OnSuccess(response) {
                var items = response.d;
                var fragment = "<ul>"
                $.each(items, function (index, val) {
                    var carName = val;
                    fragment += "<li> " + carName + "</ li>";
                });
                $("#contentHolder").append(fragment);
            }
            function OnErrorCall(response) { console.log(error); }
        });
        //*
    </script>
</asp:Content>
