//Importamos todos los modelos para poder relacionarlos entre sí
import User from './users.ts';
import Client from './clients.ts';
import Store from './store.ts';
import Product from './products.ts';
import StoreProduct from './storeProduct.ts';
import Order from './order.ts';

//Relación entre Store y Product (muchos a muchos) usando tabla intermedia StoreProduct
Store.belongsToMany(Product, {through: StoreProduct, // Tabla intermedia que contiene el stock
  foreignKey: 'storeId', // Clave foránea en StoreProduct que apunta a Store
});
Product.belongsToMany(Store, {through: StoreProduct,// Tabla intermedia que contiene el stock
  foreignKey: 'productId', // Clave foránea en StoreProduct que apunta a Product
});


//Relación entre Client y Order (un cliente puede tener muchas órdenes)
Client.hasMany(Order, {foreignKey: 'clientId' });// Clave foránea en Order que apunta a Client
Order.belongsTo(Client, {foreignKey: 'clientId'}); // Clave foránea en Order que apunta a Client


//Relación entre Product y Order (un producto puede estar en muchas órdenes)
Product.hasMany(Order, {foreignKey: 'productId'});// Clave foránea en Order que apunta a Product
Order.belongsTo(Product, {foreignKey: 'productId'});// Clave foránea en Order que apunta a Product

Store.hasMany(StoreProduct, { foreignKey: 'storeId' });
StoreProduct.belongsTo(Store, { foreignKey: 'storeId' });


Product.hasMany(StoreProduct, { foreignKey: 'productId' });
StoreProduct.belongsTo(Product, { foreignKey: 'productId' });


//Relación entre Store y Order (una bodega puede despachar muchas órdenes)
Store.hasMany(Order, {foreignKey: 'storeId'});// Clave foránea en Order que apunta a Store
Order.belongsTo(Store, {foreignKey: 'storeId'});// Clave foránea en Order que apunta a Store


//Exportamos todos los modelos para poder usarlos en otras partes del proyecto
export {User, Client, Store, Product, StoreProduct, Order};

