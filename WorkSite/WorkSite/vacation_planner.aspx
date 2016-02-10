<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="vacation_planner.aspx.cs" Inherits="WorkSite.vacation_planner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <iframe src="https://gtt.dst.ibm.com/tools/vacationplanner/calendar.php?format=iframe&team=15818" class="vacation-planner"> <p>Your browser does not support iframes.</p> </iframe>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavaScriptPlaceHolder" runat="server">
</asp:Content>
