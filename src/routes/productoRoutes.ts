import { Router } from 'express';
import {getProductoPorCodigo, eliminarProducto} from '../controller/productoController.ts';
import { autenticMiddleware } from '../middleware/autenticacion.middleware.ts';
import { soloAdmin } from '../middleware/rol.middleware.ts';

const router = Router();


router.get('/:codigo', autenticMiddleware, soloAdmin, getProductoPorCodigo);
router.delete('/:id', autenticMiddleware, soloAdmin, eliminarProducto);

export default router;
