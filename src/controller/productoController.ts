import type{ Request, Response } from 'express';
import { buscarProductoPorCodigo, eliminarProductoPorId } from '../service/productoService.ts';


//CRUD get para mostrar un producto segun su codigo unico 
export const getProductoPorCodigo = async (req: Request, res: Response) => {
  try {
    
    const codigo = req.params.codigo as string;

    const producto = await buscarProductoPorCodigo(codigo);

    if (!producto) {
      return res.status(404).json({ message: 'Producto no encontrado o inactivo' });
    }

    res.status(200).json(producto);
  } catch (error: any) {
    res.status(500).json({ message: 'Error al buscar producto', error: error.message });
  }
};


//CRUD delete para eliminar por id 
export const eliminarProducto = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const eliminado = await eliminarProductoPorId(Number(id));

    if (!eliminado) {
      return res.status(404).json({ message: 'Producto no encontrado o ya estaba inactivo' });
    }

    res.status(200).json({ message: 'Producto eliminado lógicamente (activo = false)' });
  } catch (error: any) {
    res.status(500).json({ message: 'Error al eliminar producto', error: error.message });
  }
};
