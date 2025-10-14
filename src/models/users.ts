import { DataTypes, Model } from 'sequelize'; //Importamos los tipos de datos la clase model de sequeliza
import sequelize from '../database/database.ts'; //Importamos la conexión a la base de datos

export class User extends Model{ //Definimos la calse user que extiende Model, lo que permite usar métodos como .findAll(), .create(), etc.
    declare id: number;          //Se declaran con : para indicar que estarán definidos (no undefined).
    declare name: string
    declare email: string;
    declare password: string;
    declare rol: 'admin' | 'analista';
}

User.init( //Aqui definimos la estructura si es primary key si es string boolean o integer etc
    {
        id:{
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        name:{
            type: DataTypes.STRING,
            allowNull: false
        },
        email:{
            type: DataTypes.STRING,
            allowNull: false
        },
        password:{
            type: DataTypes.STRING,
            allowNull: false
        },
        rol:{
            type: DataTypes.ENUM('admin', 'analista'),
            allowNull: false,
            defaultValue: 'analista' //Valor por defecto 
        }
    },
    {
        sequelize,               //indica la conexión que usará este modelo.
        tableName: 'Users',      //nombre de la tabla en la base de datos.
        timestamps: false   //desactiva los campos automáticos createdAt y updatedAt para  que no los cree en la tabla. 
    }
)

export default User;