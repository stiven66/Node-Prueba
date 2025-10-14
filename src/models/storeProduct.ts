import { DataTypes, Model } from 'sequelize';
import sequelize from '../database/database.ts';
import Store from './store.ts';
import Product from './products.ts';

//Tabla intermedia para manejar y validar si hay stock de un producto en una bodega

export class StoreProduct extends Model {
  declare id: number;
  declare storeId: number;
  declare productId: number;
  declare stock: number;
}

StoreProduct.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    storeId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Store,
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
    stock: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0,
    },
  },
  {
    sequelize,
    tableName: 'StoreProducts',
    timestamps: false,
  }
);

export default StoreProduct;
