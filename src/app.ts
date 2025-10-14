import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import sequelize from './database/database.js';
import { runSeeders }  from './seeders/index.ts';


// Importar rutas
import clienteRoutes from './routes/clientRoutes.ts';
import productoRoutes from './routes/productoRoutes.ts';
import bodegaRoutes from './routes/bodegaRoutes.ts';
import ordenRoutes from './routes/ordenRoutes.ts';
import userRoutes from './routes/userRoutes.ts';


dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());


// Usar rutas
app.use('/clientes', clienteRoutes);
app.use('/productos', productoRoutes);
app.use('/bodegas', bodegaRoutes);
app.use('/ordenes', ordenRoutes);
app.use('/usuarios', userRoutes);



///// Aca corremos el puerto del servidor ///////INICIAMOSS SERVIDORR/////////////////////////////////
const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en el puerto ${PORT}`);
});

//Aca conectamos la base de datos, sincronizamos los modelos y ejecutamos los seeders
(async () => {
  try {
    await sequelize.authenticate();
    console.log('Conectado a la base de datos exitosamente');

    await sequelize.sync({ alter: true });
    console.log('Modelos sincronizados con relaciones');

    await runSeeders(); // Ejecuta los seeders
    console.log('¡Base de datos poblada!');
  } catch (err) {
    console.error('Error al iniciar la app:', err);
  }
})();


