import { DataTypes, Model } from 'sequelize';
import sequelize from '../database/database.ts';

export class Client extends Model {
  declare id: number;
  declare cedula: string;
  declare nombre: string;
  declare correo: string;
}

Client.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    cedula: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true, // Validación para evitar duplicados
    },
    nombre: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    correo: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        isEmail: true, // Validación de formato de correo
      },
    },
  },
  {
    sequelize,
    tableName: 'Clients',
    timestamps: false,  // Desactiva los campos automáticos createdAt y updatedAt que sirven para llevar un control de cuando se crea o actualiza un registro.
  }
);

export default Client;
