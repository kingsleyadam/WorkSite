<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WorkSite._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <asp:Label ID="lblDevLinks" runat="server" Text="Development" CssClass="panel-title" />
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <asp:Repeater ID="repDevLinks" runat="server" DataSourceID="dsDevLinks">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkAddress" runat="server" Text='<%# Bind("Name") %>' NavigateUrl='<%# Bind("Address") %>' Target="_blank" CssClass="list-group-item"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <asp:Label ID="lblQuickLinks" runat="server" Text="Kenexa Links" CssClass="panel-title" />
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <asp:Repeater ID="repQuickLinks" runat="server" DataSourceID="dsQuickLinks">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkAddress" runat="server" Text='<%# Bind("Name") %>' NavigateUrl='<%# Bind("Address") %>' Target="_blank" CssClass="list-group-item"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <asp:Label ID="lblIBMLinks" runat="server" Text="IBM Links" CssClass="panel-title" />
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <asp:Repeater ID="repIBMLinks" runat="server" DataSourceID="dsIBMLinks">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkAddress" runat="server" Text='<%# Bind("Name") %>' NavigateUrl='<%# Bind("Address") %>' Target="_blank" CssClass="list-group-item"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <asp:Label ID="lblOtherLinks" runat="server" Text="Other Links" CssClass="panel-title" />
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <asp:Repeater ID="repOtherLinks" runat="server" DataSourceID="dsOtherLinks">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkAddress" runat="server" Text='<%# Bind("Name") %>' NavigateUrl='<%# Bind("Address") %>' Target="_blank" CssClass="list-group-item"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <asp:Label ID="lblFolderLinks" runat="server" Text="Folder Links" CssClass="panel-title" />
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <asp:Repeater ID="repFolderLinks" runat="server" DataSourceID="dsFolderLinks">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkAddress" runat="server" Text='<%# Bind("Name") %>' NavigateUrl='<%# Bind("Address") %>' Target="_blank" CssClass="list-group-item"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
        </div>
    </div>

    <asp:SqlDataSource ID="dsQuickLinks" runat="server"
        ConnectionString="<%$ ConnectionStrings:DefaultConnectionString %>"
        SelectCommand="SELECT * FROM [akLinks] WHERE ([Type] = @Type) ORDER BY Name">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="Type" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsOtherLinks" runat="server"
        ConnectionString="<%$ ConnectionStrings:DefaultConnectionString %>"
        SelectCommand="SELECT * FROM [akLinks] WHERE ([Type] = @Type) ORDER BY Name">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="Type" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsFolderLinks" runat="server"
        ConnectionString="<%$ ConnectionStrings:DefaultConnectionString %>"
        SelectCommand="SELECT * FROM [akLinks] WHERE ([Type] = @Type) ORDER BY Name">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="Type" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsIBMLinks" runat="server"
        ConnectionString="<%$ ConnectionStrings:DefaultConnectionString %>"
        SelectCommand="SELECT * FROM [akLinks] WHERE ([Type] = @Type) ORDER BY Name">
        <SelectParameters>
            <asp:Parameter DefaultValue="4" Name="Type" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsDevLinks" runat="server"
        ConnectionString="<%$ ConnectionStrings:DefaultConnectionString %>"
        SelectCommand="SELECT * FROM [akLinks] WHERE ([Type] = @Type) ORDER BY Name">
        <SelectParameters>
            <asp:Parameter DefaultValue="5" Name="Type" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavaScriptPlaceHolder" runat="server">
</asp:Content>
