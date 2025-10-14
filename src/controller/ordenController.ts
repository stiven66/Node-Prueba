//Controlador para rutas de órdenes
import type { Request, Response } from 'express';
import { crearNuevaOrden, cambiarEstado, obtenerHistorial } from '../service/ordenService.ts';

//CRUD metodo post para crear nueva orden
export const crearOrden = async (req: Request, res: Response) => {
  try {
    const { clientId, productId, storeId, estado, direccionEntrega } = req.body;
    if (!clientId || !productId || !storeId || !estado || !direccionEntrega) {
      return res.status(400).json({ message: 'Faltan datos obligatorios' });
    }

    const orden = await crearNuevaOrden(clientId, productId, storeId, estado, direccionEntrega);
    res.status(201).json(orden);
  } catch (err: any) {
    res.status(400).json({ message: err.message });
  }
};


//CRUD metodo patch para actualizar el estado de la orden
export const cambiarEstadoOrden = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    const { estado } = req.body;
    if (!estado) return res.status(400).json({ message: 'Debes enviar el nuevo estado' });

    const orden = await cambiarEstado(id, estado);
    res.status(200).json(orden);
  } catch (err: any) {
    res.status(400).json({ message: err.message });
  }
};

//CRUD metodo get para listar las ordenes
export const historialOrdenes = async (_req: Request, res: Response) => {
  try {
    const historial = await obtenerHistorial();
    res.status(200).json(historial);
  } catch (err) {
    res.status(500).json({ message: 'Error al obtener historial de órdenes', err });
  }
};
