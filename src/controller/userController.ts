//Controlador para recibir la peticion de rutas de usuario
import type { Request, Response } from 'express';
import User from '../models/users.ts';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';
import { createUser } from '../service/userService.ts';
import { Op } from 'sequelize';


//Registrar usuario 
export const registerUser = async (req: Request, res: Response) => {
  try {
    const { name, email, password, rol } = req.body;

    const existingUser = await User.findOne({ where: { email } }); //Recorremos la tabla Users para ver si ya existe un usuario con el mismo email
        if (existingUser) {
            return res.status(409).json({ message: "El correo ya está registrado" });
        }

    if (!name || !email || !password ){
            res.status(400).json({message: "Faltan datos obligatorios"})
            return;
        }

    const user = await createUser(name, email, password, rol);

    res.status(201).json(user);

  } catch (err) {
    res.status(500).json({message: " Error al crear usuario", err})
  }
};


//Logiar usuario con jwt
export const loginUser = async (req:Request, res:Response) =>{
    try{
        const {email, password} = req.body; //Obtenemos el email y contraseña que ingreso el usuuario en el frontend

        //Despues validamos que alla ingresado los datos en los dos campos obligatorios para poder logiarse
        if (!email || !password){
            console.log('Faltan campos obligatorios')
            return res.status(400).json({message: 'Ambos campos deben ser rellenados acorde a su perfil creado'});
        }

        //Buscamos en la base de datos email existente recorriendo con un ciclo la tbla Users
        const user = await User.findOne({ where: { email: { [Op.eq]: email }}}); //[Op.eq] operador de sequelize que significa "igual a"
        if (!user){
            console.log('Usuario no existente')
            return res.status(401).json({message: "Usuario no existente"});
        }

        //Comparamos la contraseño que ingreso el user con la que tenemos en la db
        const coincideP = await bcrypt.compare(password, user.password);
        if (!coincideP){
            return res.status(401).json({message: "Contraseña incorrecta"});
        }//Con bycrypt.compare comparamos la contraseña encriptada

        /////////////GENERAMOS EL TOKEN JWT PARA ACCEDER A RUTAS PROTEGIDAS///////
        
        console.log('Generando token JWT',process.env.JWT_SECRET)
        const token = jwt.sign(                      //    función de la librería jsonwebtoken
            {id: user.id, email: user.email, rol: user.rol},        //payload del token: la información que quieres guardar dentro del token
            process.env.JWT_SECRET as string,       //clave secreta para firmar el token.
            {expiresIn: '1h'}                       //El token expira en 1 hora
        );
        console.log('   Token generado:', token);

        return res.status(200).json({message: "Sesion Iniciada", token});

    }catch(err){
        res.status(500).json({message: "Fallo al logiarte!", err});
    }
};