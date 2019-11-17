﻿<!--
    11-12-19 - Alec created page.
    11-12-19 - Amanda edited design.
    11-17-19 - Faith worked on the gridview, ddl, general layout.
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VoteOnElection.aspx.cs" Inherits="VoteOnElection" Debug="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vote On Election</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Vote On Election</h2>
        <hr />
        <br />
        <asp:Label ID="lblElectionPicker" runat="server" Text="Select a election to vote on by ID: "></asp:Label>
        <asp:DropDownList ID="ddlPickElection" runat="server" DataTextField="ElectionID" DataValueField="ElectionID" AutoPostBack="true" Height="16px"></asp:DropDownList>
        <br />
        <br />
        <asp:GridView ID="gvElectionVoting" runat="server" AutoGenerateColumns="False" DataKeyNames="Username,ElectionID" DataSourceID="sdsElectionFaculty">
            <Columns>
                <asp:BoundField DataField="ElectionID" HeaderText="ElectionID" ReadOnly="True" SortExpression="ElectionID" />
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:BoundField DataField="CommitteeID" HeaderText="CommitteeID" SortExpression="CommitteeID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsElectionFaculty" runat="server" ConnectionString="<%$ ConnectionStrings:FacultyVotingConnectionString %>" SelectCommand="SELECT [Username], [ElectionID], [CommitteeID] FROM [FacultyRunning] WHERE ([ElectionID] = @ElectionID) ORDER BY [ElectionID] DESC, [Username] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlPickElection" DefaultValue="%" Name="ElectionID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="lblStatus" runat="server" Text="" EnableViewState ="False"></asp:Label>
    </form>
</body>
</html>
