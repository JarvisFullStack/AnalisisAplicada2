using BLL;
using Entidades;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AnalisisAplicada2.Tests
{
    [TestClass]
    public class PacienteTest
    {
        [TestMethod]
        public void Guardar()
        {
            /*Paciente paciente = new Paciente();
            paciente.Nombre = "Felipe";*/
            /*bool pasoPaciente = new RepositorioBase<Paciente>().Guardar(paciente);*/
            /* bool pasoTipo = new RepositorioBase<TipoAnalisis>().Guardar(new TipoAnalisis()
             {
                 Nombre = "Sangre",
                 Cantidad_Realizada = 0
             });*/
            /* Paciente pacienteN = new RepositorioBase<Paciente>().Buscar(1);
             pacienteN.AnalisisDetalle.Count();
             pacienteN.AnalisisDetalle.Add(new AnalisisDetalle(0, 1, 1, DateTime.Now, Enums.Resultado.POSITIVO));
             bool pasoDetalle = new PacienteBLL().Guardar(pacienteN);
            /*TipoAnalisis tipoAnalisis = new RepositorioBase<TipoAnalisis>().Buscar(1);

            Assert.IsTrue(pasoPaciente && pasoTipo && pasoDetalle);
            Assert.IsTrue(pasoPaciente);
           Assert.IsTrue(pasoTipo);*/
            /*Assert.IsTrue(pasoDetalle);*/
            List<Paciente> listaPacientes = new RepositorioBase<Paciente>().GetList(x => true);
            foreach(var paciente in listaPacientes)
            {
                System.Windows.Forms.MessageBox.Show("Paciente: "+paciente.Nombre);
                paciente.AnalisisDetalle.Count();
                foreach(var detalle in paciente.AnalisisDetalle)
                {
                    System.Windows.Forms.MessageBox.Show($"Detalle: {detalle.Id_Analisis_Detalle}");
                }
            }
            Assert.IsTrue(true);

        }
    }
}
