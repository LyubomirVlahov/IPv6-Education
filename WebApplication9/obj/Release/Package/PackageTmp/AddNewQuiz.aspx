<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AddNewQuiz.aspx.cs" Inherits="WebApplication9.AddNewQuiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:DetailsView DefaultMode="Insert" AutoGenerateRows="False" DataKeyNames="QuizID"
      DataSourceID="SqlDataSource3" HeaderText="Добавяне на нов тест" ID="DetailsView1" runat="server"
      Width="275px" OnItemInserted="DetailsView1_ItemInserted" 
        OnModeChanging="DetailsView1_ModeChanging">
      <Fields>
        <asp:BoundField DataField="QuizID" HeaderText="QuizID" ReadOnly="True" SortExpression="QuizID" InsertVisible="False" />
        <asp:BoundField DataField="Title" HeaderText="Име" SortExpression="Title" 
              ControlStyle-Width="750">
<ControlStyle Width="750px"></ControlStyle>
          </asp:BoundField>
        <asp:BoundField DataField="Description" HeaderText="Описание" SortExpression="Description" ControlStyle-Width="750"><ControlStyle Width="750px"></ControlStyle>
          </asp:BoundField>
        <asp:CommandField ShowInsertButton="True" CancelText="Отказ" 
              InsertText="Добави" />
      </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
      SelectCommand="SELECT * FROM [Quiz]"    
      InsertCommand="INSERT INTO [Quiz] ([Title], [Description]) VALUES (@Title, @Description)" >    
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
