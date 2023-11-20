<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ITAM_webapp_source_code._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:Table runat="server" BorderStyle="None" Height="246px" Width="510px">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3" HorizontalAlign="Center">
                   <h1>Code for Amanda</h1>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="1" HorizontalAlign="Center">
                   <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Populate ListBox" />
                </asp:TableCell>
               
                 <asp:TableCell ColumnSpan="1" HorizontalAlign="Center">
                   <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Clear Boxes" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                   <asp:CheckBoxList ID="CheckBoxList1" runat="server" >
                       <asp:ListItem>Age of assets</asp:ListItem>
                       <asp:ListItem>Asset Type</asp:ListItem>
                       <asp:ListItem>Assingees</asp:ListItem>
                       <asp:ListItem Value="Closed"></asp:ListItem>
                       <asp:ListItem>Date Closed</asp:ListItem>
                       <asp:ListItem>Barcode Number</asp:ListItem>
                       <asp:ListItem>Type Away</asp:ListItem>
                   </asp:CheckBoxList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" Height="76px" Width="213px"></asp:ListBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

    &nbsp;&nbsp;&nbsp;&nbsp;

        <br />
        <asp:Label ID="LblDateInfo" runat="server" Text="Enter the date and select the querey type (Before, On or After) the date you enter. "></asp:Label>
        <br />
&nbsp;
        <asp:Label ID="LblMonth" runat="server" Text="MM"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LblDay" runat="server" Text="DD"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LblYear" runat="server" Text="YYYY"></asp:Label>
        <br />
        <asp:DropDownList ID="DdlMonth" runat="server">
        </asp:DropDownList>
        <asp:DropDownList ID="DdlDay" runat="server">

        </asp:DropDownList>
        <asp:DropDownList ID="DdlYear" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <asp:RadioButton ID="RdoBefore" runat="server" Text="Before" />
&nbsp;
        <asp:RadioButton ID="RdoOn" runat="server" Text="On" />
&nbsp;
        <asp:RadioButton ID="RdoAfter" runat="server" Text="After" />
&nbsp;
        <asp:Button ID="BtnExecuteSearch" runat="server" Text="Execute Search" OnClick="BtnExecuteSearch_Click" />
        <br />

        <br />

    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
