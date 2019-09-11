using DAL;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class PacienteBLL : RepositorioBase<Paciente>
    {
        public override bool Guardar(Paciente entity)
        {
            try
            {                
                foreach (AnalisisDetalle elemento in entity.AnalisisDetalle)
            {
                              
                RepositorioBase<TipoAnalisis> repositorioTipo = new RepositorioBase<TipoAnalisis>();
                TipoAnalisis tipoAnalisis = repositorioTipo.Buscar(elemento.Id_Tipo_Analisis);
                tipoAnalisis.Cantidad_Realizada += 1;
                repositorioTipo.Modificar(tipoAnalisis);                
            }
                return this.Guardar(entity);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public override bool Modificar(Paciente entity)
        {
            Contexto context = new Contexto();
            Paciente anterior = this.Buscar(entity.Id_Paciente);
            //Verificando los modificados o agregados
            foreach(AnalisisDetalle elementoAnterior in anterior.AnalisisDetalle)
            {
                AnalisisDetalle detalle = entity.AnalisisDetalle.Find(x=> x.Id_Analisis_Detalle == elementoAnterior.Id_Analisis_Detalle || x.Id_Analisis_Detalle == 0);
                RepositorioBase<TipoAnalisis> repositorioTipo = new RepositorioBase<TipoAnalisis>();
                if (detalle != null)
                {
                    System.Data.Entity.EntityState newState = detalle.Id_Analisis_Detalle <= 0 ? System.Data.Entity.EntityState.Added : System.Data.Entity.EntityState.Modified;                    
                    TipoAnalisis tipoAnalisis = repositorioTipo.Buscar(detalle.Id_Tipo_Analisis);
                    if(newState == System.Data.Entity.EntityState.Added)
                    {
                        tipoAnalisis.Cantidad_Realizada += 1;
                    } else
                    {
                         if(elementoAnterior.Id_Tipo_Analisis != detalle.Id_Tipo_Analisis)
                        {
                            TipoAnalisis TipoAnterior = repositorioTipo.Buscar(elementoAnterior.Id_Tipo_Analisis);
                            TipoAnterior.Cantidad_Realizada -= 1;
                            new RepositorioBase<TipoAnalisis>().Modificar(TipoAnterior);
                            TipoAnalisis actual = repositorioTipo.Buscar(detalle.Id_Tipo_Analisis);
                            actual.Cantidad_Realizada += 1;
                            new RepositorioBase<TipoAnalisis>().Modificar(actual);
                        }
                    }
                    context.Entry(elementoAnterior).State = newState;
                } else
                {
                    TipoAnalisis TipoAnterior = repositorioTipo.Buscar(elementoAnterior.Id_Tipo_Analisis);
                    TipoAnterior.Cantidad_Realizada -= 1;
                    new RepositorioBase<TipoAnalisis>().Modificar(TipoAnterior);
                    context.Entry(elementoAnterior).State = System.Data.Entity.EntityState.Deleted;
                }
            }
            context.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            return context.SaveChanges() > 0;
        }

        public override Paciente Buscar(int id)
        {
            Contexto context = new Contexto();
            Paciente paciente = null;
            try
            {
                paciente = context.Set<Paciente>().Find(id);
                paciente.AnalisisDetalle.Count();
                paciente.AnalisisDetalle.ToList();
            } finally
            {
                context.Dispose();
            }

            return paciente;
        }

        public override List<Paciente> GetList(Expression<Func<Paciente, bool>> expression)
        {
            Contexto context = new Contexto();
            List<Paciente> pacientes = new List<Paciente>();
            try
            {
                pacientes = context.Set<Paciente>().Where(expression).ToList();
                foreach(Paciente p in pacientes)
                {
                    p.AnalisisDetalle.Count();
                    p.AnalisisDetalle.ToList();
                }
            } finally
            {
                context.Dispose();
            }

            return pacientes;
        }
    }
}
