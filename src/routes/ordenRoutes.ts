import { Router } from 'express';
import { autenticMiddleware } from '../middleware/autenticacion.middleware.ts';
import { soloAdmin, adminOAnalista } from '../middleware/rol.middleware.ts';
import {  crearOrden, cambiarEstadoOrden, historialOrdenes} from '../controller/ordenController.ts';

const router = Router();

// Crear orden (solo admin)
router.post('/', autenticMiddleware, soloAdmin, crearOrden);

// Cambiar estado (admin o analista)
router.patch('/:id/estado', autenticMiddleware, adminOAnalista, cambiarEstadoOrden);

// Historial completo (admin o analista)
router.get('/historial', autenticMiddleware, adminOAnalista, historialOrdenes);

export default router;
