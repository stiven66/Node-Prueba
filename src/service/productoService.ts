import Product from '../models/products.ts';

export const buscarProductoPorCodigo = async (codigo: string) => {
  const producto = await Product.findOne({
    where: { codigo, activo: true }, 
  });
  return producto;
};

export const eliminarProductoPorId = async (id: number) => {
  const producto = await Product.findByPk(id);
  if (!producto || !producto.activo) return null;

  producto.activo = false; 
  await producto.save();
  return producto;
};
