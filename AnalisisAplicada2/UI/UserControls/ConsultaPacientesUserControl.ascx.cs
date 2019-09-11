using BLL;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalisisAplicada2.UI.UserControls
{
    public partial class ConsultaPacientesUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            BuscarButton_Click((object)this.BuscarButton, new EventArgs());
        }

        protected void BuscarButton_Click(object sender, EventArgs e)
        {
            //Inicializando el filtro en True
            Expression<Func<Paciente, bool>> filtro = x => true;
            PacienteBLL repositorio = new PacienteBLL();
            int id;
            if (!string.IsNullOrEmpty(FiltroTextBox.Text))
            {


                switch (BuscarPorDropDownList.SelectedIndex)
                {
                    case 0://ID
                        id = Utilidades.Utilidades.ToInt(FiltroTextBox.Text);
                        filtro = c => c.Id_Paciente == id;
                        break;
                    case 1:// nombre
                        filtro = c => c.Nombre.Contains(FiltroTextBox.Text);
                        break;
                }
            }

            DatosGridView.DataSource = repositorio.GetList(filtro);
            DatosGridView.DataBind();
        }
    }
}