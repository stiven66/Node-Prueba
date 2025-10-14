import { DataTypes, Model } from 'sequelize';
import sequelize from '../database/database.ts';

export class Product extends Model {
  declare id: number;
  declare codigo: string;
  declare nombre: string;
  declare descripcion: string;
  declare activo: boolean;
}

Product.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    codigo: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true, // Código único por producto
    },
    nombre: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    descripcion: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    activo: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: true, // Para eliminación logica es necesario que el producto esté activo
    },
  },
  {
    sequelize,
    tableName: 'Products',
    timestamps: false,
  }
);

export default Product;
