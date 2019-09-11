<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConsultaTiposAnalisisUserControl.ascx.cs" Inherits="AnalisisAplicada2.UI.UserControls.ConsultaTiposAnalisisUserControl" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
<div class="panel panel-primary">
        <div class="panel-heading">Consulta de Categorias</div>
        <div class="panel-body">
    
            <div class="row">
                <div class="col-md-2">
                    <asp:DropDownList ID="BuscarPorDropDownList" runat="server" CssClass="form-control input-sm" >
                        <asp:ListItem>Código</asp:ListItem>
                        <asp:ListItem>Nombre</asp:ListItem>                        
                    </asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="FiltroTextBox" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                </div>
                <div class="col-md-4">
                     <asp:Button ID="BuscarButton" runat="server" CausesValidation="false" UseSubmitBehavior="false" Class="btn btn-success input-sm" Text="Buscar" OnClick="BuscarButton_Click" />
                    <input id="Button1" type="button" value="button"  CausesValidation="false" onServerClick="BuscarButton_Click"/>
                    
                </div>
            </div>

            <%--GRID--%>

            <div class="col-md-12">
                <asp:GridView ID="DatosGridView"
                    runat="server"
                    class="table table-condensed table-bordered table-responsive"
                    CellPadding="4" ForeColor="#333333" GridLines="None">

                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:HyperLinkField ControlStyle-ForeColor="blue"
                            DataNavigateUrlFields="Id_Tipo_Analisis"
                            DataNavigateUrlFormatString="~/UI/Registros/rTiposAnalisis.aspx?Id={0}"
                            Text="Editar"></asp:HyperLinkField>
                    </Columns>
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:GridView>
            </div>

        </div>
    </div>

</ContentTemplate>
</asp:UpdatePanel>