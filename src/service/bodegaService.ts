//! Servicio para lógica de bodegas
import Store from '../models/store.ts';
import StoreProducts from '../models/storeProduct.ts';
import Product from '../models/products.ts';

export const cambiarEstado = async (id: number, activa: boolean) => {
  const bodega = await Store.findByPk(id);
  if (!bodega) {
    throw new Error('Bodega no encontrada');
  }

  bodega.activa = activa;
  await bodega.save();
  return bodega;
};

export const obtenerBodegasActivasConStock = async () => {
  const bodegas = await Store.findAll({
    where: { activa: true },
    include: [
      {
        model: StoreProducts,
        include: [Product],
      },
    ],
  });

  return bodegas;
};
