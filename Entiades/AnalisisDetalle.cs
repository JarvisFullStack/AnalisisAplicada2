using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    [Serializable]
    public class AnalisisDetalle
    {

        [Key]
        public int Id_Analisis_Detalle { get; set; }
        public int Id_Tipo_Analisis { get; set; }
        public int Id_Paciente { get; set; }
        public DateTime Fecha { get; set; }
        public Enums.Resultado Resultado { get; set; }    
        [ForeignKey("Id_Tipo_Analisis")]
        public virtual TipoAnalisis TipoAnalisis { get; set; }

        public AnalisisDetalle(int id_Analisis_Detalle, int id_Tipo_Analisis, int id_Paciente, DateTime fecha, Enums.Resultado resultado)
        {
            Id_Analisis_Detalle = id_Analisis_Detalle;
            Id_Tipo_Analisis = id_Tipo_Analisis;
            Id_Paciente = id_Paciente;
            Fecha = fecha;
            Resultado = resultado;
        }

        public AnalisisDetalle()
        {
            this.Fecha = DateTime.Now;
        }  
    }
}
