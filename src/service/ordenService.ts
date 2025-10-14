//Servicio para lógica de órdenes
import Order from '../models/order.ts';
import Cliente from '../models/clients.ts';
import StoreProducts from '../models/storeProduct.ts';



// Creamos la nueva orden con la clave foranea de id cliente, id producto, y id bodega y su respectivo estado 
export const crearNuevaOrden = async (clientId: number, productId: number, storeId: number, estado: string, direccionEntrega: string) => {
  const cliente = await Cliente.findByPk(clientId);
  if (!cliente) throw new Error('Cliente no existe');

  const stock = await StoreProducts.findOne({ where: { storeId, productId: productId } });
  if (!stock || stock.stock <= 0)
    console.log('Stock insuficiente en la bodega');

  const orden = await Order.create({ clientId, productId, storeId, estado,  direccionEntrega });
  return orden;
};



// Actualizamos primero buscamos la orden por el id una vez identificado, se cambia el estado 
export const cambiarEstado = async (id: number, nuevoEstado: string) => {
  const orden = await Order.findByPk(id);
  if (!orden) throw new Error('Orden no encontrada');

  const estadosValidos = ['pendiente', 'progreso', 'entregado'];
  if (!estadosValidos.includes(nuevoEstado)) throw new Error('Estado inválido');

  orden.estado = nuevoEstado as 'pendiente' | 'progreso' | 'entregado';
  await orden.save();
  return orden;
};


//Listamos todas las ordenes
export const obtenerHistorial = async () => {
  return await Order.findAll();
};
