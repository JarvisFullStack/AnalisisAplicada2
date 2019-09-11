using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    [Serializable]
    public class Paciente
    {
        [Key]
        public int Id_Paciente { get; set; }
        public string Nombre { get; set; }
        public virtual List<AnalisisDetalle> AnalisisDetalle { get; set; }

        public Paciente(int id_Paciente, string nombre, List<AnalisisDetalle> analisisDetalle)
        {
            Id_Paciente = id_Paciente;
            Nombre = nombre;
            AnalisisDetalle = analisisDetalle;
        }

        public Paciente()
        {
            this.AnalisisDetalle = new List<AnalisisDetalle>();
        }
        public override string ToString()
        {
            return $"ID: {this.Id_Paciente}, Nombre: {this.Nombre}";
        }
    }
}
