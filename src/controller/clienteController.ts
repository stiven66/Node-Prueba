//! Controlador para rutas de clientes
import type { Request, Response } from 'express';
import { obtenerTodosLosClientes, buscarClientePorCedula, crearNuevoCliente} from '../service/clienteService.ts';

export const listarClientes = async (_req: Request, res: Response) => {
  try {
    const clientes = await obtenerTodosLosClientes();
    res.status(200).json(clientes);
  } catch (err) {
    res.status(500).json({ message: 'Error al listar clientes', err });
  }
};

//Buscar por cedula es un acceso solo para admin
export const buscarPorCedula = async (req: Request, res: Response) => {
  try {
    const { cedula } = req.params;

    if (!cedula) return res.status(400).json({ message: 'Debes enviar la cédula' });

    const cliente = await buscarClientePorCedula(cedula);
    res.status(200).json(cliente);
  } catch (err: any) {
    res.status(404).json({ message: err.message });
  }
};

//CRUD post como admin

export const crearCliente = async (req: Request, res: Response) => {
  try {
    const { cedula, nombre, correo } = req.body;

    if (!cedula || !nombre || !correo) {
      return res.status(400).json({ message: 'Todos los campos son obligatorios' });
    }

    const clienteExistente = await buscarClientePorCedula(cedula);
    if (clienteExistente) {
      return res.status(400).json({ message: 'Ya existe un cliente con esa cédula' });
    }

    const nuevoCliente = await crearNuevoCliente(cedula, nombre, correo);
    res.status(201).json(nuevoCliente);
  } catch (err: any) {
    res.status(500).json({ message: 'Error al crear cliente', error: err.message });
  }
};





