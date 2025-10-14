import Product from '../models/products.ts';

export const seedProducts = async () => {
  const existingP001 = await Product.findOne({ where: { codigo: 'P001' } });
  const existingP002 = await Product.findOne({ where: { codigo: 'P002' } });
  const existingP003 = await Product.findOne({ where: { codigo: 'P003' } });

  if (!existingP001 && !existingP002 && !existingP003) {
    await Product.bulkCreate([
      {
        codigo: 'P001',
        nombre: 'Caja de cartón',
        descripcion: 'Caja resistente para envíos',
        activo: true,
      },
      {
        codigo: 'P002',
        nombre: 'Bolsa plástica',
        descripcion: 'Bolsa para productos pequeños',
        activo: true,
      },
      {
        codigo: 'P003',
        nombre: 'Etiqueta de envío',
        descripcion: 'Etiqueta con código QR',
        activo: false,
      },
    ]);
    console.log('✅ Productos insertados');
  } else {
    console.log('⚠️ Productos ya existen, se omite seeder');
  }
};

