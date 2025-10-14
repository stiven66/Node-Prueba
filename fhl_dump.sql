--
-- PostgreSQL database dump
--

\restrict tKcP9k8eSfAufbBWTo64wxdAn7Ks8NLsc2FnXLYq1EAgS6m6SGS7zxRyN4Y9wEG

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

-- Started on 2025-10-14 12:11:28 -05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 869 (class 1247 OID 34404)
-- Name: enum_Orders_estado; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Orders_estado" AS ENUM (
    'pendiente',
    'progreso',
    'entregado'
);


ALTER TYPE public."enum_Orders_estado" OWNER TO postgres;

--
-- TOC entry 851 (class 1247 OID 33726)
-- Name: enum_Users_rol; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Users_rol" AS ENUM (
    'admin',
    'analista'
);


ALTER TYPE public."enum_Users_rol" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 34198)
-- Name: Clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Clients" (
    id integer NOT NULL,
    cedula character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    correo character varying(255) NOT NULL
);


ALTER TABLE public."Clients" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 34197)
-- Name: Clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Clients_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Clients_id_seq" OWNER TO postgres;

--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 223
-- Name: Clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Clients_id_seq" OWNED BY public."Clients".id;


--
-- TOC entry 226 (class 1259 OID 34412)
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    id integer NOT NULL,
    "clientId" integer NOT NULL,
    "productId" integer NOT NULL,
    "storeId" integer NOT NULL,
    estado public."enum_Orders_estado" DEFAULT 'pendiente'::public."enum_Orders_estado" NOT NULL,
    "direccionEntrega" character varying(255) NOT NULL
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 34411)
-- Name: Orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Orders_id_seq" OWNER TO postgres;

--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 225
-- Name: Orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_id_seq" OWNED BY public."Orders".id;


--
-- TOC entry 220 (class 1259 OID 33763)
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Products" (
    id integer NOT NULL,
    codigo character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255),
    activo boolean DEFAULT true NOT NULL
);


ALTER TABLE public."Products" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33762)
-- Name: Products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Products_id_seq" OWNER TO postgres;

--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 219
-- Name: Products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Products_id_seq" OWNED BY public."Products".id;


--
-- TOC entry 222 (class 1259 OID 33775)
-- Name: StoreProducts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StoreProducts" (
    id integer NOT NULL,
    "storeId" integer NOT NULL,
    "productId" integer NOT NULL,
    stock integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."StoreProducts" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33774)
-- Name: StoreProducts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."StoreProducts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."StoreProducts_id_seq" OWNER TO postgres;

--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 221
-- Name: StoreProducts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."StoreProducts_id_seq" OWNED BY public."StoreProducts".id;


--
-- TOC entry 218 (class 1259 OID 33753)
-- Name: Stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Stores" (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    "nBodega" character varying(255) NOT NULL,
    activa boolean DEFAULT true NOT NULL
);


ALTER TABLE public."Stores" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 33752)
-- Name: Stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Stores_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Stores_id_seq" OWNER TO postgres;

--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 217
-- Name: Stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Stores_id_seq" OWNED BY public."Stores".id;


--
-- TOC entry 216 (class 1259 OID 33732)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    rol public."enum_Users_rol" DEFAULT 'analista'::public."enum_Users_rol" NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 33731)
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_id_seq" OWNER TO postgres;

--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 215
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- TOC entry 3328 (class 2604 OID 34201)
-- Name: Clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients" ALTER COLUMN id SET DEFAULT nextval('public."Clients_id_seq"'::regclass);


--
-- TOC entry 3329 (class 2604 OID 34415)
-- Name: Orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN id SET DEFAULT nextval('public."Orders_id_seq"'::regclass);


--
-- TOC entry 3324 (class 2604 OID 33766)
-- Name: Products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products" ALTER COLUMN id SET DEFAULT nextval('public."Products_id_seq"'::regclass);


--
-- TOC entry 3326 (class 2604 OID 33778)
-- Name: StoreProducts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StoreProducts" ALTER COLUMN id SET DEFAULT nextval('public."StoreProducts_id_seq"'::regclass);


--
-- TOC entry 3322 (class 2604 OID 33756)
-- Name: Stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Stores" ALTER COLUMN id SET DEFAULT nextval('public."Stores_id_seq"'::regclass);


--
-- TOC entry 3320 (class 2604 OID 33735)
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- TOC entry 3634 (class 0 OID 34198)
-- Dependencies: 224
-- Data for Name: Clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Clients" VALUES (1, '123456789', 'Juan Pérez', 'juan@example.com');
INSERT INTO public."Clients" VALUES (2, '987654321', 'Ana Gómez', 'ana@example.com');
INSERT INTO public."Clients" VALUES (3, '555555555', 'Luis Torres', 'luis@example.com');


--
-- TOC entry 3636 (class 0 OID 34412)
-- Dependencies: 226
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Orders" VALUES (1, 1, 1, 1, 'pendiente', 'Calle 123 #45-67, Medellín');
INSERT INTO public."Orders" VALUES (2, 2, 2, 2, 'progreso', 'Carrera 89 #12-34, Bogotá');
INSERT INTO public."Orders" VALUES (3, 3, 3, 1, 'entregado', 'Av. Siempre Viva 742, Cali');


--
-- TOC entry 3630 (class 0 OID 33763)
-- Dependencies: 220
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Products" VALUES (1, 'P001', 'Caja de cartón', 'Caja resistente para envíos', true);
INSERT INTO public."Products" VALUES (2, 'P002', 'Bolsa plástica', 'Bolsa para productos pequeños', true);
INSERT INTO public."Products" VALUES (3, 'P003', 'Etiqueta de envío', 'Etiqueta con código QR', false);


--
-- TOC entry 3632 (class 0 OID 33775)
-- Dependencies: 222
-- Data for Name: StoreProducts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."StoreProducts" VALUES (1, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (2, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (3, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (4, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (5, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (6, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (7, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (8, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (9, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (10, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (11, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (12, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (13, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (14, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (15, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (16, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (17, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (18, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (19, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (20, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (21, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (22, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (23, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (24, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (25, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (26, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (27, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (28, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (29, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (30, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (31, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (32, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (33, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (34, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (35, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (36, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (37, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (38, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (39, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (40, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (41, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (42, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (43, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (44, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (45, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (46, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (47, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (48, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (49, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (50, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (51, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (52, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (53, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (54, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (55, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (56, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (57, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (58, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (59, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (60, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (61, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (62, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (63, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (64, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (65, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (66, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (67, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (68, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (69, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (70, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (71, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (72, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (73, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (74, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (75, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (76, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (77, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (78, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (79, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (80, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (81, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (82, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (83, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (84, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (85, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (86, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (87, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (88, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (89, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (90, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (91, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (92, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (93, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (94, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (95, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (96, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (97, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (98, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (99, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (100, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (101, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (102, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (103, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (104, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (105, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (106, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (107, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (108, 2, 3, 0);
INSERT INTO public."StoreProducts" VALUES (109, 1, 1, 50);
INSERT INTO public."StoreProducts" VALUES (110, 1, 2, 100);
INSERT INTO public."StoreProducts" VALUES (111, 2, 1, 30);
INSERT INTO public."StoreProducts" VALUES (112, 2, 3, 0);


--
-- TOC entry 3628 (class 0 OID 33753)
-- Dependencies: 218
-- Data for Name: Stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Stores" VALUES (1, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (2, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (3, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (4, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (5, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (6, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (7, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (8, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (9, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (10, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (11, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (12, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (13, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (14, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (15, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (16, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (17, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (18, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (19, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (20, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (21, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (22, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (23, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (24, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (25, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (26, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (27, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (28, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (29, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (30, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (31, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (32, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (33, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (34, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (35, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (36, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (37, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (38, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (39, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (40, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (41, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (42, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (43, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (44, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (45, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (46, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (47, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (48, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (49, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (50, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (51, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (52, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (53, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (54, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (55, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (56, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (57, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (58, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (59, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (60, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (61, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (62, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (63, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (64, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (65, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (66, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (67, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (68, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (69, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (70, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (71, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (72, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (73, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (74, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (75, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (76, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (77, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (78, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (79, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (80, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (81, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (82, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (83, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (84, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (85, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (86, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (87, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (88, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (89, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (90, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (91, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (92, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (93, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (94, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (95, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (96, 'Bodega Central', '3', false);
INSERT INTO public."Stores" VALUES (97, 'Bodega Norte', '1', true);
INSERT INTO public."Stores" VALUES (98, 'Bodega Sur', '2', true);
INSERT INTO public."Stores" VALUES (99, 'Bodega Central', '3', false);


--
-- TOC entry 3626 (class 0 OID 33732)
-- Dependencies: 216
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Users" VALUES (1, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (2, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (3, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (4, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (5, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (6, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (7, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (8, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (9, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (10, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (11, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (12, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (13, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (14, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (15, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (16, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (17, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (18, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (19, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (20, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (21, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (22, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (23, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (24, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (25, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (26, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (27, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (28, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (29, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (30, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (31, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (32, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (33, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (34, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (35, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (36, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (37, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (38, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (39, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (40, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (41, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (42, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (43, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (44, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (45, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (46, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (47, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (48, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (49, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (50, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (51, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (52, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (53, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (54, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (55, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (56, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (57, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (58, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (59, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (60, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (61, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (62, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (63, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (64, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (65, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (66, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (67, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (68, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (69, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (70, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');
INSERT INTO public."Users" VALUES (71, 'Admin FHL', 'admin@fhl.com', 'admin123', 'admin');
INSERT INTO public."Users" VALUES (72, 'Analista FHL', 'analista@fhl.com', 'analista123', 'analista');


--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 223
-- Name: Clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Clients_id_seq"', 3, true);


--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 225
-- Name: Orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orders_id_seq"', 3, true);


--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 219
-- Name: Products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Products_id_seq"', 8, true);


--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 221
-- Name: StoreProducts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."StoreProducts_id_seq"', 112, true);


--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 217
-- Name: Stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Stores_id_seq"', 99, true);


--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 215
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 72, true);


--
-- TOC entry 3416 (class 2606 OID 37439)
-- Name: Clients Clients_cedula_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key" UNIQUE (cedula);


--
-- TOC entry 3418 (class 2606 OID 37441)
-- Name: Clients Clients_cedula_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key1" UNIQUE (cedula);


--
-- TOC entry 3420 (class 2606 OID 37437)
-- Name: Clients Clients_cedula_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key10" UNIQUE (cedula);


--
-- TOC entry 3422 (class 2606 OID 37409)
-- Name: Clients Clients_cedula_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key11" UNIQUE (cedula);


--
-- TOC entry 3424 (class 2606 OID 37411)
-- Name: Clients Clients_cedula_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key12" UNIQUE (cedula);


--
-- TOC entry 3426 (class 2606 OID 37435)
-- Name: Clients Clients_cedula_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key13" UNIQUE (cedula);


--
-- TOC entry 3428 (class 2606 OID 37413)
-- Name: Clients Clients_cedula_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key14" UNIQUE (cedula);


--
-- TOC entry 3430 (class 2606 OID 37415)
-- Name: Clients Clients_cedula_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key15" UNIQUE (cedula);


--
-- TOC entry 3432 (class 2606 OID 37433)
-- Name: Clients Clients_cedula_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key16" UNIQUE (cedula);


--
-- TOC entry 3434 (class 2606 OID 37417)
-- Name: Clients Clients_cedula_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key17" UNIQUE (cedula);


--
-- TOC entry 3436 (class 2606 OID 37419)
-- Name: Clients Clients_cedula_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key18" UNIQUE (cedula);


--
-- TOC entry 3438 (class 2606 OID 37421)
-- Name: Clients Clients_cedula_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key19" UNIQUE (cedula);


--
-- TOC entry 3440 (class 2606 OID 37443)
-- Name: Clients Clients_cedula_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key2" UNIQUE (cedula);


--
-- TOC entry 3442 (class 2606 OID 37423)
-- Name: Clients Clients_cedula_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key20" UNIQUE (cedula);


--
-- TOC entry 3444 (class 2606 OID 37431)
-- Name: Clients Clients_cedula_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key21" UNIQUE (cedula);


--
-- TOC entry 3446 (class 2606 OID 37425)
-- Name: Clients Clients_cedula_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key22" UNIQUE (cedula);


--
-- TOC entry 3448 (class 2606 OID 37427)
-- Name: Clients Clients_cedula_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key23" UNIQUE (cedula);


--
-- TOC entry 3450 (class 2606 OID 37429)
-- Name: Clients Clients_cedula_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key24" UNIQUE (cedula);


--
-- TOC entry 3452 (class 2606 OID 37407)
-- Name: Clients Clients_cedula_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key25" UNIQUE (cedula);


--
-- TOC entry 3454 (class 2606 OID 37459)
-- Name: Clients Clients_cedula_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key26" UNIQUE (cedula);


--
-- TOC entry 3456 (class 2606 OID 37405)
-- Name: Clients Clients_cedula_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key27" UNIQUE (cedula);


--
-- TOC entry 3458 (class 2606 OID 37403)
-- Name: Clients Clients_cedula_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key28" UNIQUE (cedula);


--
-- TOC entry 3460 (class 2606 OID 37445)
-- Name: Clients Clients_cedula_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key3" UNIQUE (cedula);


--
-- TOC entry 3462 (class 2606 OID 37447)
-- Name: Clients Clients_cedula_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key4" UNIQUE (cedula);


--
-- TOC entry 3464 (class 2606 OID 37449)
-- Name: Clients Clients_cedula_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key5" UNIQUE (cedula);


--
-- TOC entry 3466 (class 2606 OID 37451)
-- Name: Clients Clients_cedula_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key6" UNIQUE (cedula);


--
-- TOC entry 3468 (class 2606 OID 37453)
-- Name: Clients Clients_cedula_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key7" UNIQUE (cedula);


--
-- TOC entry 3470 (class 2606 OID 37455)
-- Name: Clients Clients_cedula_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key8" UNIQUE (cedula);


--
-- TOC entry 3472 (class 2606 OID 37457)
-- Name: Clients Clients_cedula_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_cedula_key9" UNIQUE (cedula);


--
-- TOC entry 3474 (class 2606 OID 34205)
-- Name: Clients Clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_pkey" PRIMARY KEY (id);


--
-- TOC entry 3476 (class 2606 OID 34418)
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 37539)
-- Name: Products Products_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key" UNIQUE (codigo);


--
-- TOC entry 3338 (class 2606 OID 37467)
-- Name: Products Products_codigo_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key1" UNIQUE (codigo);


--
-- TOC entry 3340 (class 2606 OID 37507)
-- Name: Products Products_codigo_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key10" UNIQUE (codigo);


--
-- TOC entry 3342 (class 2606 OID 37509)
-- Name: Products Products_codigo_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key11" UNIQUE (codigo);


--
-- TOC entry 3344 (class 2606 OID 37511)
-- Name: Products Products_codigo_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key12" UNIQUE (codigo);


--
-- TOC entry 3346 (class 2606 OID 37513)
-- Name: Products Products_codigo_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key13" UNIQUE (codigo);


--
-- TOC entry 3348 (class 2606 OID 37515)
-- Name: Products Products_codigo_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key14" UNIQUE (codigo);


--
-- TOC entry 3350 (class 2606 OID 37519)
-- Name: Products Products_codigo_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key15" UNIQUE (codigo);


--
-- TOC entry 3352 (class 2606 OID 37521)
-- Name: Products Products_codigo_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key16" UNIQUE (codigo);


--
-- TOC entry 3354 (class 2606 OID 37523)
-- Name: Products Products_codigo_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key17" UNIQUE (codigo);


--
-- TOC entry 3356 (class 2606 OID 37525)
-- Name: Products Products_codigo_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key18" UNIQUE (codigo);


--
-- TOC entry 3358 (class 2606 OID 37535)
-- Name: Products Products_codigo_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key19" UNIQUE (codigo);


--
-- TOC entry 3360 (class 2606 OID 37469)
-- Name: Products Products_codigo_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key2" UNIQUE (codigo);


--
-- TOC entry 3362 (class 2606 OID 37527)
-- Name: Products Products_codigo_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key20" UNIQUE (codigo);


--
-- TOC entry 3364 (class 2606 OID 37533)
-- Name: Products Products_codigo_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key21" UNIQUE (codigo);


--
-- TOC entry 3366 (class 2606 OID 37529)
-- Name: Products Products_codigo_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key22" UNIQUE (codigo);


--
-- TOC entry 3368 (class 2606 OID 37531)
-- Name: Products Products_codigo_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key23" UNIQUE (codigo);


--
-- TOC entry 3370 (class 2606 OID 37517)
-- Name: Products Products_codigo_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key24" UNIQUE (codigo);


--
-- TOC entry 3372 (class 2606 OID 37505)
-- Name: Products Products_codigo_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key25" UNIQUE (codigo);


--
-- TOC entry 3374 (class 2606 OID 37483)
-- Name: Products Products_codigo_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key26" UNIQUE (codigo);


--
-- TOC entry 3376 (class 2606 OID 37485)
-- Name: Products Products_codigo_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key27" UNIQUE (codigo);


--
-- TOC entry 3378 (class 2606 OID 37487)
-- Name: Products Products_codigo_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key28" UNIQUE (codigo);


--
-- TOC entry 3380 (class 2606 OID 37489)
-- Name: Products Products_codigo_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key29" UNIQUE (codigo);


--
-- TOC entry 3382 (class 2606 OID 37471)
-- Name: Products Products_codigo_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key3" UNIQUE (codigo);


--
-- TOC entry 3384 (class 2606 OID 37503)
-- Name: Products Products_codigo_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key30" UNIQUE (codigo);


--
-- TOC entry 3386 (class 2606 OID 37491)
-- Name: Products Products_codigo_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key31" UNIQUE (codigo);


--
-- TOC entry 3388 (class 2606 OID 37501)
-- Name: Products Products_codigo_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key32" UNIQUE (codigo);


--
-- TOC entry 3390 (class 2606 OID 37499)
-- Name: Products Products_codigo_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key33" UNIQUE (codigo);


--
-- TOC entry 3392 (class 2606 OID 37497)
-- Name: Products Products_codigo_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key34" UNIQUE (codigo);


--
-- TOC entry 3394 (class 2606 OID 37493)
-- Name: Products Products_codigo_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key35" UNIQUE (codigo);


--
-- TOC entry 3396 (class 2606 OID 37495)
-- Name: Products Products_codigo_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key36" UNIQUE (codigo);


--
-- TOC entry 3398 (class 2606 OID 37465)
-- Name: Products Products_codigo_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key37" UNIQUE (codigo);


--
-- TOC entry 3400 (class 2606 OID 37473)
-- Name: Products Products_codigo_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key4" UNIQUE (codigo);


--
-- TOC entry 3402 (class 2606 OID 37475)
-- Name: Products Products_codigo_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key5" UNIQUE (codigo);


--
-- TOC entry 3404 (class 2606 OID 37477)
-- Name: Products Products_codigo_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key6" UNIQUE (codigo);


--
-- TOC entry 3406 (class 2606 OID 37479)
-- Name: Products Products_codigo_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key7" UNIQUE (codigo);


--
-- TOC entry 3408 (class 2606 OID 37481)
-- Name: Products Products_codigo_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key8" UNIQUE (codigo);


--
-- TOC entry 3410 (class 2606 OID 37537)
-- Name: Products Products_codigo_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_codigo_key9" UNIQUE (codigo);


--
-- TOC entry 3412 (class 2606 OID 33771)
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);


--
-- TOC entry 3414 (class 2606 OID 33781)
-- Name: StoreProducts StoreProducts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StoreProducts"
    ADD CONSTRAINT "StoreProducts_pkey" PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 33761)
-- Name: Stores Stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Stores"
    ADD CONSTRAINT "Stores_pkey" PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 33740)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- TOC entry 3479 (class 2606 OID 37554)
-- Name: Orders Orders_clientId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES public."Clients"(id);


--
-- TOC entry 3480 (class 2606 OID 37559)
-- Name: Orders Orders_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Products"(id);


--
-- TOC entry 3481 (class 2606 OID 37564)
-- Name: Orders Orders_storeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES public."Stores"(id);


--
-- TOC entry 3477 (class 2606 OID 37547)
-- Name: StoreProducts StoreProducts_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StoreProducts"
    ADD CONSTRAINT "StoreProducts_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Products"(id);


--
-- TOC entry 3478 (class 2606 OID 37542)
-- Name: StoreProducts StoreProducts_storeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StoreProducts"
    ADD CONSTRAINT "StoreProducts_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES public."Stores"(id);


-- Completed on 2025-10-14 12:11:32 -05

--
-- PostgreSQL database dump complete
--

\unrestrict tKcP9k8eSfAufbBWTo64wxdAn7Ks8NLsc2FnXLYq1EAgS6m6SGS7zxRyN4Y9wEG

