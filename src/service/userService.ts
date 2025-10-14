//Servicio para registrar usuarios
import bcrypt from 'bcrypt';
import User from '../models/users.ts';

///////////////////////Crea un nuevo usuario en la base de datos y guarda la contraseña encriptada con bcript/////////////////////////////////////
export const createUser = async (name: string, email:string, password: string, rol: 'admin' | 'analista') =>{
    const saltRounds = 10; //Numero de rondas de sal para el hash, entre mas alto mas seguro pero mas lento.
    const hashedPassword = await bcrypt.hash(password, saltRounds); // Encripta la contraseña
    return await User.create({name, email , password: hashedPassword, rol}  ); // Crea el usuario con la contraseña encriptada
}
