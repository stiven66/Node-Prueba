//aca ejecutamos todos los seeders
import { seedUsers } from './seedUsers.ts';
import { seedClients } from './seedClients.ts';
import { seedStores } from './seedStore.ts';
import { seedProducts } from './seedproducts.ts';
import { seedStoreProducts } from './seedStoreProducst.ts';
import { seedOrders } from './seedOrders.ts';

export const runSeeders = async () => {
  await seedUsers();
  await seedClients();    
  await seedStores();
  await seedProducts();
  await seedStoreProducts();
  await seedOrders();  
};
