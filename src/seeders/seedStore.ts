import Store from '../models/store.ts';

export const seedStores = async () => {
  await Store.bulkCreate([
    {
      nombre: 'Bodega Norte',
      nBodega: '1',
      activa: true,
    },
    {
      nombre: 'Bodega Sur',
      nBodega: '2',
      activa: true,
    },
    {
      nombre: 'Bodega Central',
      nBodega: '3',
      activa: false, // Esta bodega está inactiva para pruebas
    },
  ]);
};
