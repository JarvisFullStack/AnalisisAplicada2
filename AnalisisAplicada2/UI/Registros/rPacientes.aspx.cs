using BLL;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalisisAplicada2.UI.Registros
{
    public partial class rPacientes : System.Web.UI.Page
    {
        private List<AnalisisDetalle> ListaAnalisisDetalle = new List<AnalisisDetalle>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                //si llego in id
                int id = Utilidades.Utilidades.ToInt(Request.QueryString["id"]);
                if (id > 0)
                {
                    PacienteBLL repositorio = new PacienteBLL();
                    var user = repositorio.Buscar(id);

                    if (user == null)
                    {
                        MostrarMensaje("error", "Registro no encontrado");
                    }
                    else
                    {
                        LlenaCampos(user);
                    }
                }

                RepositorioBase<TipoAnalisis> repositorioBase = new RepositorioBase<TipoAnalisis>();                
                TipoAnalisisDropDownList.DataSource = repositorioBase.GetList(t => true);
                TipoAnalisisDropDownList.DataValueField = "Id_Tipo_Analisis";
                TipoAnalisisDropDownList.DataTextField = "Nombre";
                TipoAnalisisDropDownList.DataBind();




            }
        }
            

            protected void NuevoButton_Click(object sender, EventArgs e)
            {
            Limpiar();
            }

        private void Limpiar()
        {
            this.IdTextBox.Text = "0";
            this.NombreTextBox.Text = string.Empty;
            this.ListaAnalisisDetalle = new List<AnalisisDetalle>();
            BindGrid();
        }

        protected void GuadarButton_Click(object sender, EventArgs e)
            {
                Paciente paciente = LlenaClase();
                if (paciente.Id_Paciente > 0)
                {
                    bool paso = new RepositorioBase<Paciente>().Modificar(paciente);
                    if (paso)
                    {
                        MostrarMensaje("success", "Transaccion Exitosa");
                    Limpiar();
                    } else
                    {
                        MostrarMensaje("danger", "Error al intentar guardar");
                    }
                } else
            {
                bool paso = new RepositorioBase<Paciente>().Guardar(paciente);
                if (paso)
                {
                    MostrarMensaje("success", "Transaccion Exitosa");
                    Limpiar();
                }
                else
                {
                    MostrarMensaje("danger", "Error al intentar guardar");
                }
            }

            }


            protected Paciente LlenaClase()
            {
                Paciente paciente = new Paciente();
                paciente.Id_Paciente = Utilidades.Utilidades.ToInt(IdTextBox.Text);
                paciente.Nombre = NombreTextBox.Text;
                return paciente;
            }

            void MostrarMensaje(string tipo, string mensaje)
            {
                ErrorLabel.Text = mensaje;

                if (tipo == "success")
                    ErrorLabel.CssClass = "alert-success";
                else
                    ErrorLabel.CssClass = "alert-danger";
            }

            protected void EliminarButton_Click(object sender, EventArgs e)
            {

            }


            private void LlenaCampos(Paciente obj)
            {
                this.IdTextBox.Text = obj.Id_Paciente.ToString();
                this.NombreTextBox.Text = obj.Nombre;
                ListaAnalisisDetalle = obj.AnalisisDetalle;
                BindGrid();
            }

        private void BindGrid()
        {            
            DetalleGridView.DataSource = ListaAnalisisDetalle;
            DetalleGridView.DataBind();
            
        }

        protected void AgregarButton_Click(object sender, EventArgs e)
        {
            Paciente paciente = LlenaClase();

            
            Enums.Resultado resultado = (Enums.Resultado)ResultadoDropDownList.SelectedIndex;
            AnalisisDetalle detalle = new AnalisisDetalle();
            detalle.Id_Tipo_Analisis = Utilidades.Utilidades.ToInt(TipoAnalisisDropDownList.SelectedValue);
            detalle.Id_Paciente = paciente.Id_Paciente;
            detalle.Fecha = DateTime.Now;
            detalle.Resultado = resultado;
            ListaAnalisisDetalle.Add(detalle);            
            BindGrid();
            ResultadoDropDownList.SelectedIndex = 0;
        }

        protected void DetalleGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DetalleGridView.PageIndex = e.NewPageIndex;
            
        }
    }
    }