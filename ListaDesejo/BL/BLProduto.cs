using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ListaDesejoMistral.ML;

namespace ListaDesejoMistral.BL
{
    public class BLProduto
    {
        public static List<MLProduto> _lstMLProduto = new List<MLProduto>();

        static void PopulaList()
        {
            try
            {
                _lstMLProduto.Add(new MLProduto() { Codigo = 1, NomeProduto = "MacBook Pro", Valor = (decimal)16.25 });
                _lstMLProduto.Add(new MLProduto() { Codigo = 2, NomeProduto = "Ipad", Valor = (decimal)30.52 });
                _lstMLProduto.Add(new MLProduto() { Codigo = 3, NomeProduto = "Iphone", Valor = (decimal)50.20 });
                _lstMLProduto.Add(new MLProduto() { Codigo = 4, NomeProduto = "Ipod", Valor = (decimal)30.25 });
                _lstMLProduto.Add(new MLProduto() { Codigo = 5, NomeProduto = "MacBook Air", Valor = (decimal)15.00 });
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<MLProduto> listar()
        {
            if(_lstMLProduto.Count <= 0)
                PopulaList();
            return _lstMLProduto;
        }
    }
}