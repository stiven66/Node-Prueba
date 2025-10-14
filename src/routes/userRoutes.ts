//Rutas para el manejo de usuarios
import { Router } from 'express';
import { registerUser, loginUser } from '../controller/userController.ts';

const router = Router();

// Ruta para registrar un nuevo usuario
router.post('/', registerUser);


// Ruta para iniciar sesión y obtener token con JWT
router.post('/login', loginUser);

export default router;
