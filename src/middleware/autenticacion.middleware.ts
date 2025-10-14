import type {  Request, Response, NextFunction} from 'express';
import jwt from 'jsonwebtoken';


//verifica que el token sea válido
//El middleware verifica el token y, si es válido, deja pasar la petición. 
export const autenticMiddleware = (req:Request, res:Response, next:NextFunction) =>{
    try{
        const jwtNoSeparado = req.headers['authorization']; //Obtenemos el token del header Authorization completo con la palabra Bearer osea el token que proporciono jwt
        console.log('Authorization header:', jwtNoSeparado);


        if(!jwtNoSeparado || !jwtNoSeparado.startsWith('Bearer ')){//Si no existe el token o no empieza con Bearer
            return res.status(401).json({message: "No se proporciono token o formato invalido"});
        }

        const token = jwtNoSeparado.split(' ')[1]; //Aqui quitamos la palabra Barer y nos queda solo el token
        if(!token){
            return res.status(401).json({message: "No se proporciono token"});
        }

        // Verificar y decodificar el token
        const decoded = jwt.verify(token, process.env.JWT_SECRET as string); 

        (req as any).user = decoded; //Agregamos el payload del token al objeto req para usarlo en las siguientes funciones

        next(); //Si todo esta bien pasamos a la funcion siguiente

    }catch(err){
        return res.status(401).json({message:"Token invalido o expirado",err});
    }
}