//! Controlador para rutas de bodegas
import type { Request, Response } from 'express';
import { cambiarEstado, obtenerBodegasActivasConStock } from '../service/bodegaService.ts';

export const cambiarEstadoBodega = async (req: Request, res: Response) => {
  try {
    const id = Number(req.params.id);
    if (isNaN(id)) {
        return res.status(400).json({ message: 'ID inválido en la URL' });
    }
    const { activa } = req.body;

    if (typeof activa !== 'boolean') {
      return res.status(400).json({ message: 'El campo "activa" debe ser true o false' });
    }

    const bodega = await cambiarEstado(id, activa);
    res.status(200).json({ message: 'Estado actualizado', bodega });
  } catch (err: any) {
    if (err.message === 'Bodega no encontrada') {
      return res.status(404).json({ message: err.message });
    }
    res.status(500).json({ message: 'Error al cambiar estado de bodega', err });
  }
};

export const listarBodegasActivasConStock = async (_req: Request, res: Response) => {
  try {
    const bodegas = await obtenerBodegasActivasConStock();
    res.status(200).json(bodegas);
  } catch (err) {
    res.status(500).json({ message: 'Error al obtener bodegas activas', err });
  }
};
