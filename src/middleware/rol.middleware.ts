import type { Request, Response, NextFunction } from 'express';

// Middleware para permitir solo usuarios con rol 'admin'
export const soloAdmin = (req: Request, res: Response, next: NextFunction) => {
  const user = (req as any).user;
  if (user.rol !== 'admin') {
    return res.status(403).json({ message: 'Acceso denegado: solo administradores' });
  }
  next();
};

// Middleware para permitir solo usuarios con rol 'analista'
export const soloAnalista = (req: Request, res: Response, next: NextFunction) => {
  const user = (req as any).user;
  if (user.rol !== 'analista') {
    return res.status(403).json({ message: 'Acceso denegado: solo analistas' });
  }
  next();
};

// Middleware para permitir ambos roles (admin o analista)
export const adminOAnalista = (req: Request, res: Response, next: NextFunction) => {
  const user = (req as any).user;
  if (user.rol !== 'admin' && user.rol !== 'analista') {
    return res.status(403).json({ message: 'Acceso denegado: rol no autorizado' });
  }
  next();
};