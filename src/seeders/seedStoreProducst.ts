import StoreProduct from '../models/storeProduct.ts';

export const seedStoreProducts = async () => {
  await StoreProduct.bulkCreate([
    {
      storeId: 1, // Bodega Norte
      productId: 1, // Caja de cartón
      stock: 50,
    },
    {
      storeId: 1,
      productId: 2, // Bolsa plástica
      stock: 100,
    },
    {
      storeId: 2, // Bodega Sur
      productId: 1,
      stock: 30,
    },
    {
      storeId: 2,
      productId: 3, // Etiqueta de envío
      stock: 0, // Sin stock para probar validación
    },
  ]);
};
