<%@ Page Title="" Language="C#" MasterPageFile="~/MainLayout.Master" AutoEventWireup="true" CodeBehind="rTiposAnalisis.aspx.cs" Inherits="AnalisisAplicada2.UI.Registros.rTiposAnalisis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="panel panel-primary">
<div class="panel-heading">Registro de Categorias</div>
<asp:ScriptManager>

</asp:ScriptManager>

<div class="panel-body">
<div class="form-horizontal col-md-12" role="form">
<%--UserId--%>
<div class="form-group">
<div class="row">
<label for="IdTextBox" class="col-md-3 control-label input-sm">Id: </label>
<div class="col-md-1 col-sm-2 col-xs-4">
<asp:TextBox ID="IdTextBox" runat="server" ReadOnly="True" placeholder="0" class="form-control input-sm"></asp:TextBox>
</div>
<div class="col-md-1 col-sm-2 col-xs-4">
<asp:LinkButton ID="BusquedaButton" CssClass="btn btn-info btn-block btn-md" data-toggle="modal" data-target="#myModal" CausesValidation="False" runat="server" ClientIDMode="Static" OnClientClick="return  false" Text="<i class='fa fa-search'></i>" />
</div>
</div>
</div>
<%--
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  <i class="fa fa-search"></i>
</button> --%>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg" role="document">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body">
<%-- %><TWebControl:ConsultaUsuariosUserControl ID="Header" runat="server" />--%>
<TWebControl:ConsultaTiposAnalisisUserControl ID="Header" runat="server" />
</div>
<%--  <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>--%>
</div>
</div>
</div>

</div>
<%--Names--%>
<div class="form-group">
<label for="Nombre" class="col-md-3 control-label input-sm">Nombre</label>
<div class="col-md-8">
<asp:TextBox ID="NombreTextBox" runat="server"
Class="form-control input-sm"></asp:TextBox>
<asp:RequiredFieldValidator ValidationGroup="grupoValidar" ID="RFVNombre" runat="server" MaxLength="200"
ControlToValidate="NombreTextBox"
ErrorMessage="Campo Nombres obligatorio" ForeColor="Red"
Display="Dynamic" SetFocusOnError="True"
ToolTip="Campo Nombre obligatorio">Por favor llenar el campo Nombre
</asp:RequiredFieldValidator>
</div>
</div>
<div class="form-group">
<label for="cantidadTextBox" class="col-md-3 control-label input-sm">Cantidad Realizada</label>
<div class="col-md-8">
<asp:TextBox ID="CantidadTextBox" enabled="false" runat="server"
Class="form-control input-sm"></asp:TextBox>

</div>
</div>
</div>

<div class="col-md-12">
<asp:ValidationSummary runat="server" ID="SumaryValidation"
ForeColor="red"
DisplayMode="BulletList"
ShowSummary="true"
EnableClientScript="True"
Font-Bold="False"
CssClass=" alert alert-danger" />
</div>

<asp:Label ID="ErrorLabel" runat="server" Text=""></asp:Label>
</div>

<div class="panel-footer">
<div class="text-center">
<div class="form-group" style="display: inline-block">

<asp:Button Text="Nuevo" class="btn btn-warning btn-sm" runat="server" ID="NuevoButton" OnClick="NuevoButton_Click" />
<asp:Button Text="Guardar" ValidationGroup="grupoValidar" class="btn btn-success btn-sm" runat="server" ID="GuadarButton" OnClick="GuadarButton_Click" />
<asp:Button Text="Eliminar" class="btn btn-danger btn-sm" runat="server" ID="EliminarButton" OnClick="EliminarButton_Click" />

</div>
</div>

</div>
</div>
</asp:Content>
