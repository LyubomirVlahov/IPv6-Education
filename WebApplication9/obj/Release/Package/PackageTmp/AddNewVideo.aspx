<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AddNewVideo.aspx.cs" 
Inherits="WebApplication9.AddNewVideo" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:DetailsView DefaultMode="Insert" AutoGenerateRows="False" DataKeyNames="VideoID"
      DataSourceID="SqlDataSource3" HeaderText="Добавяне на ново видео" ID="DetailsView1" runat="server"
      Width="275px" OnItemInserted="DetailsView1_ItemInserted" 
        OnModeChanging="DetailsView1_ModeChanging">
      <Fields>
        <asp:BoundField DataField="VideoID" HeaderText="VideoID" ReadOnly="True" 
              SortExpression="VideoID" InsertVisible="False" />
        <asp:BoundField DataField="Title" HeaderText="Име" SortExpression="Title" 
              ControlStyle-Width="750" >
<ControlStyle Width="750px"></ControlStyle>
          </asp:BoundField>
        <asp:BoundField DataField="Url" HeaderText="Линк" SortExpression="Url" 
              ControlStyle-Width="750" >
<ControlStyle Width="750px"></ControlStyle>
          </asp:BoundField>
          <asp:CommandField ShowInsertButton="True" CancelText="Отказ" 
              InsertText="Добави" />
      </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
      SelectCommand="SELECT * FROM [Video]"    
      InsertCommand="INSERT INTO [Video] ([Title], [Url]) VALUES (@Title, @Url)"  >       
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Url" Type="String" />
        </InsertParameters>       
    </asp:SqlDataSource>
</asp:Content>
