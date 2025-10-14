//Los seeders son para llenar la base de datos con datos iniciales para pruebas sin tener que hacerlo manualmente.
import bcrypt from 'bcrypt';
import User from '../models/users.ts';

export const seedUsers = async () => {
  const saltRounds = 10;

  const users = [
    {
      name: 'Admin',
      email: 'admin@fhl.com',
      password: await bcrypt.hash('admin123', saltRounds),
      rol: 'admin'
    },
    {
      name: 'Analista',
      email: 'analista@fhl.com',
      password: await bcrypt.hash('analista123', saltRounds),
      rol: 'analista'
    }
  ];

  await User.bulkCreate(users);
};

