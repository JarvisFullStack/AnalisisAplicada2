using BLL;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalisisAplicada2.UI.Registros
{
    public partial class rTiposAnalisis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                //si llego in id
                int id = Utilidades.Utilidades.ToInt(Request.QueryString["id"]);
                if (id > 0)
                {
                    RepositorioBase<TipoAnalisis> repositorio = new RepositorioBase<TipoAnalisis>();
                    var obj = repositorio.Buscar(id);

                    if (obj == null)
                    {
                        MostrarMensaje("error", "Registro no encontrado");
                    }
                    else
                    {
                        LlenaCampos(obj);
                    }
                }
            }
        }

        private void LlenaCampos(TipoAnalisis obj)
        {
            this.IdTextBox.Text = obj.Id_Tipo_Analisis.ToString();
            this.NombreTextBox.Text = obj.Nombre;
            this.CantidadTextBox.Text = obj.Cantidad_Realizada.ToString();
        }

        void MostrarMensaje(string tipo, string mensaje)
            {
                ErrorLabel.Text = mensaje;
                if (tipo == "success")
                    ErrorLabel.CssClass = "alert-success";
                else
                    ErrorLabel.CssClass = "alert-danger";
            }

            protected void NuevoButton_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void GuadarButton_Click(object sender, EventArgs e)
        {
            TipoAnalisis tipoAnalisis = LlenaClase();
            if (tipoAnalisis.Id_Tipo_Analisis > 0)
            {
                bool paso = new RepositorioBase<TipoAnalisis>().Modificar(tipoAnalisis);
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
            else
            {
                bool paso = new RepositorioBase<TipoAnalisis>().Guardar(tipoAnalisis);
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

        private void Limpiar()
        {
            IdTextBox.Text = "0";
            NombreTextBox.Text = string.Empty;
        }

        private TipoAnalisis LlenaClase()
        {
            TipoAnalisis tipoAnalisis = new TipoAnalisis();
            tipoAnalisis.Id_Tipo_Analisis = Utilidades.Utilidades.ToInt(IdTextBox.Text);
            tipoAnalisis.Nombre = NombreTextBox.Text;
            tipoAnalisis.Cantidad_Realizada = Utilidades.Utilidades.ToInt(CantidadTextBox.Text);
            return tipoAnalisis;
        }

        protected void EliminarButton_Click(object sender, EventArgs e)
        {

        }
    }
}