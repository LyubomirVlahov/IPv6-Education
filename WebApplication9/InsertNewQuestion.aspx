<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="InsertNewQuestion.aspx.cs" Inherits="WebApplication9.InsertNewTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:DetailsView DefaultMode="Insert" AutoGenerateRows="False" DataKeyNames="QuestionID"
      DataSourceID="SqlDataSource3" HeaderText="Добавяне на нов въпрос" ID="DetailsView1" runat="server"
      Width="900px" OnItemInserted="DetailsView1_ItemInserted" 
        OnModeChanging="DetailsView1_ModeChanging">
      <Fields>
        <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" ReadOnly="True" 
              SortExpression="QuestionID" InsertVisible="False" >
          <ControlStyle Width="100px" />
          </asp:BoundField>
        <asp:BoundField DataField="Title" HeaderText="Въпрос" SortExpression="Title" ControlStyle-Width="750">
<ControlStyle Width="750px"></ControlStyle>

          <HeaderStyle Width="150px" />
          </asp:BoundField>
        <asp:BoundField DataField="Answer1" HeaderText="Отговор 1" 
              SortExpression="Answer1" ControlStyle-Width="750" >
<ControlStyle Width="750px"></ControlStyle>
          </asp:BoundField>
        <asp:BoundField DataField="Answer2" HeaderText="Отговор 2" 
              SortExpression="Answer2" ControlStyle-Width="750">
<ControlStyle Width="750px"></ControlStyle>
          </asp:BoundField>
        <asp:BoundField DataField="Answer3" HeaderText="Отговор 3" 
              SortExpression="Answer3" ControlStyle-Width="750">
<ControlStyle Width="750px"></ControlStyle>
          </asp:BoundField>
        <asp:BoundField DataField="Answer4" HeaderText="Отговор 4" 
              SortExpression="Answer4" ControlStyle-Width="750">
<ControlStyle Width="750px"></ControlStyle>
          </asp:BoundField>
        <asp:BoundField DataField="CorrectAnswer" HeaderText="Верен отговор, [1-4]" 
              SortExpression="CorrectAnswer" ControlStyle-Width="50">
<ControlStyle Width="50px"></ControlStyle>
          </asp:BoundField>
        <asp:BoundField DataField="QuestionOrder" HeaderText="Номер поред" 
              SortExpression="QuestionOrder" ControlStyle-Width="50">
<ControlStyle Width="50px"></ControlStyle>
          </asp:BoundField>
        <asp:CommandField ShowInsertButton="True" CancelText="Отказ" 
              InsertText="Добави" />
      </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
      SelectCommand="SELECT * FROM [Question] WHERE ([QuizID] = @QuizID)"    
      
        InsertCommand="INSERT INTO [Question] ([Title], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [QuestionOrder], [QuizID]) VALUES (@Title, @Answer1, @Answer2, @Answer3, @Answer4, @CorrectAnswer, @QuestionOrder, @QuizID)" 
        oninserting="SqlDataSource3_Inserting">       
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Answer1" Type="String" />
            <asp:Parameter Name="Answer2" Type="String" />
            <asp:Parameter Name="Answer3" Type="String" />
            <asp:Parameter Name="Answer4" Type="String" />
            <asp:Parameter Name="CorrectAnswer" Type="Byte" />
            <asp:Parameter Name="QuestionOrder" Type="Byte" />
            <asp:Parameter Name="QuizID" Type="Int32" />
        </InsertParameters>     
    </asp:SqlDataSource>
</asp:Content>
