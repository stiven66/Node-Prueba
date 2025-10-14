import { DataTypes, Model } from 'sequelize';
import sequelize from '../database/database.ts';

export class Store extends Model {
  declare id: number;
  declare nombre: string;
  declare nBodega: string;
  declare activa: boolean;
}

Store.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    nombre: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    nBodega: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    activa: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: true, // Por defecto está activa para poder asignar ordenes a esta bodega
    },
  },
  {
    sequelize,
    tableName: 'Stores',
    timestamps: false,
  }
);

export default Store;
