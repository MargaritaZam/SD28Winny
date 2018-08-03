<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Winny1.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
 <div class="form-gap"></div>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="text-center">
                  <h3><i class="fa fa-lock fa-4x"></i></h3>
                  <h2 class="text-center">Forgot Password?</h2>
                  <p>You can reset your password here.</p>
                  <div class="panel-body">
    
                    <div id="register-form"   class="form" >
    
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                          <asp:TextBox ID="txtConformEmail"  runat="server"></asp:TextBox>
                         <asp:Label ID="lblError" runat="server" Text=""></asp:Label> 
                        </div>
                      </div>
                      <div class="form-group">
                       <asp:Button ID="btnSend" runat="server" class="btn btn-lg btn-primary btn-block" Text="Send" OnClick="btnSend_Click" />
                      </div>
                      
                      <input type="hidden" class="hide" name="token" id="token" value=""> 
                    </div>
    
                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
</div>


</asp:Content>
