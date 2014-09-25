<%@ Page Title="Register" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="WebApplication9.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:CreateUserWizard ID="RegisterUser" runat="server" EnableViewState="false" OnCreatedUser="RegisterUser_CreatedUser">
        <LayoutTemplate>
            <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                <ContentTemplate>
                <div class="wrapper row3">
                    <div id="container" class="clear" >
                            <b>
                                Регистрация
                            </b>
                            <p>
                                Паролата трябва да е дълга минимум <%= Membership.MinRequiredPasswordLength %> символа.
                            </p>
                            <span class="failureNotification">
                                <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                            </span>
                            <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification" 
                                 ValidationGroup="RegisterUserValidationGroup"/>
                            <div class="accountInfo">
                                <fieldset class="register">
                                    <legend>Информация</legend>
                                    <p>
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Потребителско име:</asp:Label>
                                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                                             CssClass="failureNotification" ErrorMessage="Моля въведете потребителско име." ToolTip="User Name is required." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                        <asp:TextBox ID="Email" runat="server" CssClass="textEntry"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
                                             CssClass="failureNotification" ErrorMessage="Моля въведете E-mail адрес." ToolTip="E-mail is required." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Парола:</asp:Label>
                                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                             CssClass="failureNotification" ErrorMessage="Моля въведете парола." ToolTip="Password is required." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Потвърдете паролата:</asp:Label>
                                        <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" 
                                             ErrorMessage="Потвърдете паролата." ID="ConfirmPasswordRequired" runat="server" 
                                             ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="Въведените пароли не съвпадат."
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                                    </p>
                                </fieldset>
                                <p class="submitButton">
                                    <asp:Button ID="CreateUserButton" runat="server" CommandName="MoveNext" Text="Регистрация" 
                                         ValidationGroup="RegisterUserValidationGroup"/>
                                </p>
                            </div>
                            </div>
                            </div>
                </ContentTemplate>
                <CustomNavigationTemplate>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>
