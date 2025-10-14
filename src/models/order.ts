import { DataTypes, Model } from 'sequelize';
import sequelize from '../database/database.ts';
import Client from './clients.ts';
import Product from './products.ts';
import Store from './store.ts';

export class Order extends Model {
  declare id?: number;
  declare clientId: number;
  declare productId: number;
  declare storeId: number;
  declare estado: 'pendiente' | 'progreso' | 'entregado';
  declare direccionEntrega: string;
}
Order.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    clientId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Client,
        key: 'id',
      },
    },
    productId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Product,
        key: 'id',
      },
    },
    storeId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Store,
        key: 'id',
      },
    },
    estado: {
      type: DataTypes.ENUM('pendiente', 'progreso', 'entregado'),
      allowNull: false,
      defaultValue: 'pendiente',
    },
    direccionEntrega: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: 'Orders',
    timestamps: false,
  }
);

export default Order;
