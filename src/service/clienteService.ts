//Servicio para lógica de clientes
import Client from '../models/clients.ts';

export const obtenerTodosLosClientes = async () => {
  return await Client.findAll();  //Listar todos los clientes
};

export const buscarClientePorCedula = async (cedula: string) => {
  const cliente = await Client.findOne({ where: { cedula } });  // Aca lo buscamos por cedula 
  if (!cliente)
  console.log("Cliente no encontrado");
  return cliente;
};


export const crearNuevoCliente = async (cedula: string, nombre: string, correo: string) => {
  return await Client.create({ cedula, nombre, correo });
};
