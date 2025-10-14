import Order from '../models/order.ts';

export const seedOrders = async () => {
  const existing = await Order.count(); // 👈 Verifica si ya hay órdenes
  if (existing > 0) {
    console.log('📦 Órdenes ya esta, se omite seeder');
    return;
  }

  await Order.bulkCreate([ //bulkCreate para insertar varios datos 
    {
      clientId: 1,
      productId: 1,
      storeId: 1,
      estado: 'pendiente',
      direccionEntrega: 'Calle 123 #45-67, Medellín',
    },
    {
      clientId: 2,
      productId: 2,
      storeId: 2,
      estado: 'progreso',
      direccionEntrega: 'Carrera 89 #12-34, Bogotá',
    },
    {
      clientId: 3,
      productId: 3,
      storeId: 1,
      estado: 'entregado',
      direccionEntrega: 'Av. Siempre Viva 742, Cali',
    },
  ]);

  console.log('📦 Órdenes sembradas correctamente');
};
