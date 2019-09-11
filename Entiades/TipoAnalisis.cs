using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    [Serializable]
    public class TipoAnalisis
    {
        [Key]
        public int Id_Tipo_Analisis { get; set; }
        public string Nombre { get; set; }       
        public int Cantidad_Realizada { get; set; }
      

        public TipoAnalisis()
        {
            this.Cantidad_Realizada = 0;
        }
    }
}
