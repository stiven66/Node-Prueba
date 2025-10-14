Language = English

# 📦 FHL S.A.S

The logistics company FHL wants to implement a system to manage its customers' delivery orders.

A robust backend solution developed in **TypeScript**, designed to manage warehouses, products, customers, and delivery orders. This RESTful API implements role-based authentication, stock validation, and order flow control, complying with the standards required in the statement.



---

## 🧰 Technologies Used

- **Node.js** v20.19.0
- **TypeScript** v5+
- **Express.js** – HTTP Server Framework
- **Sequelize ORM** – Abstraction for PostgreSQL
- **PostgreSQL** – Relational Database
- **JWT** – Secure Token Authentication
- **Dotenv** – Environment Variable Management
- **Bcrypt** – Password Encryption
- **Nodemon** – Auto-Reload in Development

---



## 🚀 Environment Installation

### 1. Install Node.js and TypeScript, among others.

```bash
sudo apt-get update
sudo apt install curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 20.19.0

### 2. Install dependencies.
npm install -g typescript Install typescript globally
npm install -D @types/node
npm install --save-dev ts-node typescript
npm install ts-node@latest
npm install bcrypt jsonwebtoken
npm install -D @types/bcrypt @types/jsonwebtoken
sudo apt install docker.io



### 3. Initialize project

npm init -y
tsc --init
npm install
npm install -D typescript ts-node @types/node


Finally, run with npm run listen in the visual terminal



## 🚀 Project structure

node_modules
src/
├── controllers/ # Route logic
├── database/ # Connection to PostgreSQL
├── middleware/ # Authentication and Roles
├── models/ # Defining Sequelize entities
├── routes/ # Clustered endpoints
├── seeders/ # Initial data
├── services/ # Business logic
├── app.ts # Main configuration
.env
docker-compose.yml
DockerFile
package-lock.json
package.json
README.md
ts.config.json



## 📄 Environment variables (.env)

```env
DATABASE_URL=postgresql://postgres:Qwe.123*@localhost:5432/fhl

PORT=3001
JWT_SECRET=superseguro2025

---



### . 🌱 Seeders and Database

Explains how to populate the database with initial data:

```md
## 🌱 Seeders

To populate the database with test data:

```bash
npm run seed

---



### . 🔐 Test Roles and Credentials

This allows you to test the API without having to manually create users:

```md
## 🔐 Test Roles and Credentials

| Role     | User             | Password    |
|----------|------------------|-------------|
| Admin    | admin@mail.com   | admin123    |
| Analyst  | analyst@mail.com | analyst123  |



## 📮 Main Endpoints

### 🔑 Authentication
- `POST /register` → Create a new user with a specific role (admin-analyst)
- `POST /login` → Log in and return token

### 🧍 Customers
- `GET /customers` → List all (admin and analyst)
- `POST /customers/search` → Search by ID (admin only)

### 🏢 Warehouses
- `GET /warehouses/active` → Active warehouses with stock
- `PATCH /warehouses/:id/status` → Change status (admin only)

### 📦 Products
- `GET /products/:code` → Search by code
- `DELETE /products/:id` → Logical deletion (admin only)

### 📤 Orders
- `POST /orders` → Create order (admin only)
- `PATCH /orders/:id/status` → Change status (admin or analyst)
- `GET /orders/history` → View history (admin or analyst)



## 🗃️ Dump SQL

The `fhl_dump.sql` file is located in the `dump/` folder and contains the database structure and data for testing.

Here it shows that everything was a success in the terminal when executing the dump

ls -lh fhl_dump.sql
-rw-rw-r-- 1 coders coders 31K Oct 14 12:00 fhl_dump.sql
coders@riwi-0317:~/Desktop/Steven/node/RAExam/testNodejs$ head fhl_dump.sql
--
-- PostgreSQL database dump
--

\restrict HeFMkKHDQfzIjryKqqELxNMXUfFeQGsRWyiWNhXNzFMch1gwYkJlAC69YL6ekLh

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

SET statement_timeout = 0;
coders@riwi-0317:~/Desktop/Steven/node/RAExam/testNodejs$ grep "CREATE TABLE" fhl_dump.sql
CREATE TABLE public."Clients" (
CREATE TABLE public."Orders" (
CREATE TABLE public."Products" (
CREATE TABLE public."StoreProducts" (
CREATE TABLE public."Stores" (
CREATE TABLE public."Users" (


grep "CREATE TABLE" fhl_dump.sql
CREATE TABLE public."Clients" (
CREATE TABLE public."Orders" (
CREATE TABLE public."Products" (
CREATE TABLE public."StoreProducts" (
CREATE TABLE public."Stores" (
CREATE TABLE public."Users" (
coders@riwi-0317:~/Desktop/Steven/node/RAExam/NodejsTest$ grep "INSERT INTO" fhl_dump.sql | wc -l
292
coders@riwi-0317:~/Desktop/Steven/node/RAExam/NodejsTest$

key 1234




👨‍💻 Author

Project developed by [Steven Hidalgo Sánchez] Clan [Linus]
Final delivery of the NodeJs module 📍 Medellín, Colombia – October 2025










Idioma = Español

# 📦 FHL S.A.S

La empresa de logística FHL quiere implementar un sistema para gestionar las órdenes de entrega
de sus clientes. 
Una solución backend robusta desarrollada en **TypeScript**, diseñada para gestionar bodegas, productos, clientes y órdenes de entrega. Esta API RESTful implementa autenticación por roles, validaciones de stock, y control de flujo de órdenes, cumpliendo con los estándares requeridos en el enunciado.

---

## 🧰 Tecnologías utilizadas

- **Node.js** v20.19.0
- **TypeScript** v5+
- **Express.js** – Framework para servidor HTTP
- **Sequelize ORM** – Abstracción para PostgreSQL
- **PostgreSQL** – Base de datos relacional
- **JWT** – Autenticación segura por token
- **Dotenv** – Manejo de variables de entorno
- **Bcrypt** – Encriptación de contraseñas
- **Nodemon** – Recarga automática en desarrollo

---

## 🚀 Instalación del entorno

### 1. Instalar Node.js y TypeScript y otros.

```bash
sudo apt-get update
sudo apt install curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 20.19.0

### 2. Instalar dependencias.
npm install -g typescript       Instale typescript globalmente
npm install -D @types/node
npm install --save-dev ts-node typescript
npm install ts-node@latest
npm install bcrypt jsonwebtoken
npm install -D @types/bcrypt @types/jsonwebtoken
sudo apt install docker.io



### 3. Inicializar proyecto 

npm init -y
tsc --init
npm install
npm install -D typescript ts-node @types/node


Por ultimo correr con npm run listen en la terminal del visual 



## 🚀 Estructura del proyecto

node_modules
src/
├── controllers/       # Lógica de rutas
├── database/          # Conexión a PostgreSQL
├── middleware/        # Autenticación y roles
├── models/            # Definición de entidades Sequelize
├── routes/            # Endpoints agrupados
├── seeders/           # Datos iniciales
├── services/          # Lógica de negocio
├── app.ts             # Configuración principal
.env
docker-compose.yml
DockerFile
package-lock.json
package.json
README.md
ts.config.json


## 📄 Variables de entorno (.env)

```env
DATABASE_URL=postgresql://postgres:Qwe.123*@localhost:5432/fhl

PORT=3001
JWT_SECRET=superseguro2025


---

### . 🌱 Seeders y base de datos

Explica cómo poblar la base de datos con datos iniciales:

```md
## 🌱 Seeders

Para poblar la base de datos con datos de prueba:

```bash
npm run seed


---

### 3. 🔐 Roles y credenciales de prueba

Esto permite probar la API sin tener que crear usuarios manualmente:

```md
## 🔐 Roles y credenciales de prueba

| Rol      | Usuario                | Contraseña     |
|----------|------------------------|----------------|
| Admin    | admin@correo.com       | admin123       |
| Analista | analista@correo.com    | analista123    |


## 📮 Endpoints principales

### 🔑 Autenticación
- `POST /register` → Crear usuario nuevo con un rol determinado(admin-analista)
- `POST /login` → Inicia sesión y devuelve token

### 🧍 Clientes
- `GET /clientes` → Listar todos (admin y analista)
- `POST /clientes/buscar` → Buscar por cédula (solo admin)

### 🏢 Bodegas
- `GET /bodegas/activas` → Bodegas activas con stock
- `PATCH /bodegas/:id/estado` → Cambiar estado (solo admin)

### 📦 Productos
- `GET /productos/:codigo` → Buscar por código
- `DELETE /productos/:id` → Eliminación lógica (solo admin)

### 📤 Órdenes
- `POST /ordenes` → Crear orden (solo admin)
- `PATCH /ordenes/:id/estado` → Cambiar estado (admin o analista)
- `GET /ordenes/historial` → Ver historial (admin o analista)


## 🗃️ Dump SQL

El archivo `fhl_dump.sql` se encuentra en la carpeta `dump/` y contiene la estructura y datos de la base de datos para pruebas. 


Aca se muestra que todo fue un exito en la terminal al ejecutar el dump


ls -lh fhl_dump.sql
-rw-rw-r-- 1 coders coders 31K oct 14 12:00 fhl_dump.sql
coders@riwi-0317:~/Escritorio/Steven/node/ExamenRA/pruebaNodejs$ head fhl_dump.sql
--
-- PostgreSQL database dump
--

\restrict HeFMkKHDQfzIjryKqqELxNMXUfFeQGsRWyiWNhXNzFMch1gwYkJlAC69YL6ekLh

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

SET statement_timeout = 0;
coders@riwi-0317:~/Escritorio/Steven/node/ExamenRA/pruebaNodejs$ grep "CREATE TABLE" fhl_dump.sql
CREATE TABLE public."Clients" (
CREATE TABLE public."Orders" (
CREATE TABLE public."Products" (
CREATE TABLE public."StoreProducts" (
CREATE TABLE public."Stores" (
CREATE TABLE public."Users" (


grep "CREATE TABLE" fhl_dump.sql
CREATE TABLE public."Clients" (
CREATE TABLE public."Orders" (
CREATE TABLE public."Products" (
CREATE TABLE public."StoreProducts" (
CREATE TABLE public."Stores" (
CREATE TABLE public."Users" (
coders@riwi-0317:~/Escritorio/Steven/node/ExamenRA/pruebaNodejs$ grep "INSERT INTO" fhl_dump.sql | wc -l
292
coders@riwi-0317:~/Escritorio/Steven/node/ExamenRA/pruebaNodejs$ 


clave 1234







👨‍💻 Autor

Proyecto desarrollado por [Steven Hidalgo Sánchez] Clan [Linus]
Entrega final del módulo de NodeJs 📍 Medellín, Colombia – Octubre 2025