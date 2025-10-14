import { Router } from 'express';
import { autenticMiddleware } from '../middleware/autenticacion.middleware.ts';
import { soloAdmin, adminOAnalista } from '../middleware/rol.middleware.ts';
import { listarClientes, buscarPorCedula, crearCliente} from '../controller/clienteController.ts';

const router = Router();

// Solo usuarios autenticados con rol admin o analista
router.get('/', autenticMiddleware, adminOAnalista, listarClientes);

// Buscar por cedula 
router.get('/:cedula', autenticMiddleware, soloAdmin, buscarPorCedula);

//Solo admin puede crear nuevos clientes
router.post('/', autenticMiddleware, soloAdmin, crearCliente);

export default router;
