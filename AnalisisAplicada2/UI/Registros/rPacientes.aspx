<%@ Page Title="" Language="C#" MasterPageFile="~/MainLayout.Master" AutoEventWireup="true" CodeBehind="rPacientes.aspx.cs" Inherits="AnalisisAplicada2.UI.Registros.rPacientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

	<style>
		.modal-lg {
			max-width: 80% !important;
		}
	</style>
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
								<TWebControl:ConsultaPacientesUserControl ID="Header" runat="server" />
								<h1>Contenido</h1>
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

	<br />
	<asp:UpdatePanel runat="server">
		<ContentTemplate>


			<h2 class="text-center">Agregar Analisis</h2>
			<div class="row">


				<div class="col-md-4">
					<div class="form-group">
						<label for="TipoAnalisisDropDownList" class="control-label input-sm">Tipo Analisis</label>
						<div class="">
							<asp:DropDownList ID="TipoAnalisisDropDownList" CssClass=" form-control dropdown" AppendDataBoundItems="true" runat="server" Height="2.5em">
							</asp:DropDownList>
							<asp:RequiredFieldValidator ID="TipoAnalisisRequiredFieldValidator" CssClass="col-md-4 col-sm-4" runat="server" ControlToValidate="TipoAnalisisDropDownList" Display="Dynamic" ErrorMessage="Porfavor elige un tipo de analisis valido..." ValidationGroup="AgregarDetalle">Porfavor elige un tipo de analisis valido...</asp:RequiredFieldValidator>
						</div>


					</div>
				</div>

				<div class="col-md-4">
					<div class="form-group">
						<label for="ResultadoDropDownList" class="control-label input-sm">Resultado</label>
						<div class="">
							<asp:DropDownList ID="ResultadoDropDownList" CssClass=" form-control dropdown" AppendDataBoundItems="true" runat="server" Height="2.5em">
								<asp:ListItem Text="Negativo" />
								<asp:ListItem Text="Positivo" />
							</asp:DropDownList>
							<asp:RequiredFieldValidator ID="ResultadoRequiredFieldValidator" CssClass="col-md-4 col-sm-4" runat="server" ControlToValidate="ResultadoDropDownList" Display="Dynamic" ErrorMessage="Porfavor elige un resultado valido..." ValidationGroup="AgregarDetalle">Porfavor elige un resultado valido...</asp:RequiredFieldValidator>
						</div>


					</div>
				</div>

				<div class="col-md-4">
					<div class="form-group">
						<asp:Label Text="text" runat="server" />
						<asp:Button ID="AgregarButton" CssClass=" form-control btn btn-primary" runat="server" Text="Agregar" Height="2.5em" OnClick="AgregarButton_Click" ValidationGroup="AgregarDetalle" />
					</div>
				</div>



			</div>

			<br />
			<h2 class="text-center">Lista de Analisis Realizados</h2>
			<div class="row">


				<asp:GridView ID="DetalleGridView" AllowPaging="true" PageSize="5" OnPageIndexChanging="DetalleGridView_PageIndexChanging" CssClass="table table-bordered col-md-offset-4 col-sm-offset-4" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="244px" AutoGenerateColumns="true">
					<Columns>
						<asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" />
						<asp:TemplateField HeaderText="Código">
							<EditItemTemplate>
								<asp:TextBox ID="IdAnalisisDetalle" CssClass="form-control" Text='<%#Bind("Id_Analisis_Detalle") %>' runat="server" />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelIdAnalisisDetalle" Text='<%# Bind("Id_Analisis_Detalle") %>' runat="server" />
							</ItemTemplate>
						</asp:TemplateField>

						<asp:TemplateField HeaderText="Código Analisis">
							<EditItemTemplate>
								<asp:TextBox ID="IdTipoAnalisisDetalle" CssClass="form-control" Text='<%#Bind("Id_Tipo_Analisis") %>' runat="server" />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelIdTipoAnalisisDetalle" Text='<%# Bind("Id_Tipo_Analisis") %>' runat="server" />
							</ItemTemplate>
						</asp:TemplateField>

						<asp:TemplateField HeaderText="Código Analisis">
							<EditItemTemplate>
								<asp:TextBox ID="IdTipoAnalisisDetalle" CssClass="form-control" Text='<%#Bind("Id_Tipo_Analisis") %>' runat="server" />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelIdTipoAnalisisDetalle" Text='<%# Bind("Id_Tipo_Analisis") %>' runat="server" />
							</ItemTemplate>
						</asp:TemplateField>

						<asp:TemplateField HeaderText="Código Paciente">
							<EditItemTemplate>
								<asp:TextBox ID="IdPacienteDetalle" CssClass="form-control" Text='<%#Bind("Id_Paciente") %>' runat="server" />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelIdPacienteDetalle" Text='<%# Bind("Id_Paciente") %>' runat="server" />
							</ItemTemplate>
						</asp:TemplateField>

						<asp:TemplateField HeaderText="Resultado">
							<ItemTemplate>
								<asp:Label ID="LabelResultadoDetalle" runat="server" Text='<%# Bind("Resultado") %>'></asp:Label>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:DropDownList ID="ResultadoDetalleDropDownList" CssClass="form-control" runat="server">
									<asp:ListItem Value="" Selected="True" Text="[Seleccionar]" />
								</asp:DropDownList>
							</EditItemTemplate>
						</asp:TemplateField>
					</Columns>
					<AlternatingRowStyle BackColor="White" />
					<EditRowStyle BackColor="#2461BF" />
					<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
					<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
					<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
					<RowStyle BackColor="#EFF3FB" />
					<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
					<SortedAscendingCellStyle BackColor="#F5F7FB" />
					<SortedAscendingHeaderStyle BackColor="#6D95E1" />
					<SortedDescendingCellStyle BackColor="#E9EBEF" />
					<SortedDescendingHeaderStyle BackColor="#4870BE" />
				</asp:GridView>
			</div>

		</ContentTemplate>
	</asp:UpdatePanel>

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
