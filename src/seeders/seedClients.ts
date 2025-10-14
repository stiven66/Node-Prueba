//Llenamos la base de datos con clientes iniciales.
import Client from '../models/clients.ts';

export const seedClients = async () => {
  const existingJuan = await Client.findOne({ where: { cedula: '123456789' } });//Busca en la base de datos por el numero de cedula
  const existingAna = await Client.findOne({ where: { cedula: '987654321' } });
  const existingLuis = await Client.findOne({where: { cedula: '555555555'}});

  if (!existingJuan && !existingAna && !existingLuis) {
    await Client.bulkCreate([
      {
        cedula: '123456789',
        nombre: 'Juan Pérez',
        correo: 'juan@example.com',
      },
      {
        cedula: '987654321',
        nombre: 'Ana Gómez',
        correo: 'ana@example.com',
      },
      {
        cedula: '555555555',
        nombre: 'Luis Torres',
        correo: 'luis@example.com',
      }
    ]);
    console.log('✅ Clientes insertados');
  } else {
    console.log('⚠️ Clientes ya existen, se omite seeder');
  }
};
