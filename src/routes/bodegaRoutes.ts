import { Router } from 'express';
import { autenticMiddleware } from '../middleware/autenticacion.middleware.ts';
import { soloAdmin, adminOAnalista } from '../middleware/rol.middleware.ts';
import {  cambiarEstadoBodega,  listarBodegasActivasConStock,} from '../controller/bodegaController.ts';

const router = Router();

// ✅ Activar/Inactivar bodega (solo admin)
router.patch('/:id/estado', autenticMiddleware, soloAdmin, cambiarEstadoBodega);

// ✅ Listar bodegas activas con stock (admin o analista)
router.get('/activas', autenticMiddleware, adminOAnalista, listarBodegasActivasConStock);

export default router;
