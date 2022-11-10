--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-11-10 17:27:35

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16512)
-- Name: tArea; Type: TABLE; Schema: public; Owner: iotwsn-pt
--

CREATE TABLE public."tArea" (
    "fIdArea" integer NOT NULL,
    "fNombreArea" character(50),
    "fIdDepartamento" integer
);


ALTER TABLE public."tArea" OWNER TO "iotwsn-pt";

--
-- TOC entry 211 (class 1259 OID 16517)
-- Name: tDatosSensor; Type: TABLE; Schema: public; Owner: iotwsn-pt
--

CREATE TABLE public."tDatosSensor" (
    "fIdDispositivo" integer NOT NULL,
    "fTipoSensor" character(50),
    "fValorMinimo" numeric(10,2),
    "fValorMaximo" numeric(10,2),
    "fTiempoActualizacion" integer,
    "fPresicion" integer,
    "fError" integer,
    "fFechaRegistro" timestamp with time zone,
    "fVariableFisica" integer,
    "fUnidades" integer,
    "fIdArea" integer
);


ALTER TABLE public."tDatosSensor" OWNER TO "iotwsn-pt";

--
-- TOC entry 209 (class 1259 OID 16507)
-- Name: tDepartamento; Type: TABLE; Schema: public; Owner: iotwsn-pt
--

CREATE TABLE public."tDepartamento" (
    "fIdDepartamento" integer NOT NULL,
    "fNombreDepartamento" character(50)
);


ALTER TABLE public."tDepartamento" OWNER TO "iotwsn-pt";

--
-- TOC entry 212 (class 1259 OID 16523)
-- Name: tSerieTiempoId; Type: TABLE; Schema: public; Owner: iotwsn-pt
--

CREATE TABLE public."tSerieTiempoId" (
    "fMedicion" numeric(10,2),
    "fFechaUnix" timestamp with time zone,
    "fIdDispositivo" integer
);


ALTER TABLE public."tSerieTiempoId" OWNER TO "iotwsn-pt";

--
-- TOC entry 214 (class 1259 OID 16533)
-- Name: tUnidades; Type: TABLE; Schema: public; Owner: iotwsn-pt
--

CREATE TABLE public."tUnidades" (
    "fIdentificador" integer,
    "fDescripcion" character(50)
);


ALTER TABLE public."tUnidades" OWNER TO "iotwsn-pt";

--
-- TOC entry 213 (class 1259 OID 16526)
-- Name: tVariablesFisicas; Type: TABLE; Schema: public; Owner: iotwsn-pt
--

CREATE TABLE public."tVariablesFisicas" (
    "fIdentificador" integer,
    "fDescripcion" character(50)
);


ALTER TABLE public."tVariablesFisicas" OWNER TO "iotwsn-pt";

--
-- TOC entry 4064 (class 0 OID 16512)
-- Dependencies: 210
-- Data for Name: tArea; Type: TABLE DATA; Schema: public; Owner: iotwsn-pt
--

COPY public."tArea" ("fIdArea", "fNombreArea", "fIdDepartamento") FROM stdin;
\.


--
-- TOC entry 4065 (class 0 OID 16517)
-- Dependencies: 211
-- Data for Name: tDatosSensor; Type: TABLE DATA; Schema: public; Owner: iotwsn-pt
--

COPY public."tDatosSensor" ("fIdDispositivo", "fTipoSensor", "fValorMinimo", "fValorMaximo", "fTiempoActualizacion", "fPresicion", "fError", "fFechaRegistro", "fVariableFisica", "fUnidades", "fIdArea") FROM stdin;
\.


--
-- TOC entry 4063 (class 0 OID 16507)
-- Dependencies: 209
-- Data for Name: tDepartamento; Type: TABLE DATA; Schema: public; Owner: iotwsn-pt
--

COPY public."tDepartamento" ("fIdDepartamento", "fNombreDepartamento") FROM stdin;
\.


--
-- TOC entry 4066 (class 0 OID 16523)
-- Dependencies: 212
-- Data for Name: tSerieTiempoId; Type: TABLE DATA; Schema: public; Owner: iotwsn-pt
--

COPY public."tSerieTiempoId" ("fMedicion", "fFechaUnix", "fIdDispositivo") FROM stdin;
\.


--
-- TOC entry 4068 (class 0 OID 16533)
-- Dependencies: 214
-- Data for Name: tUnidades; Type: TABLE DATA; Schema: public; Owner: iotwsn-pt
--

COPY public."tUnidades" ("fIdentificador", "fDescripcion") FROM stdin;
\.


--
-- TOC entry 4067 (class 0 OID 16526)
-- Dependencies: 213
-- Data for Name: tVariablesFisicas; Type: TABLE DATA; Schema: public; Owner: iotwsn-pt
--

COPY public."tVariablesFisicas" ("fIdentificador", "fDescripcion") FROM stdin;
\.


--
-- TOC entry 3918 (class 2606 OID 16516)
-- Name: tArea tArea_pkey; Type: CONSTRAINT; Schema: public; Owner: iotwsn-pt
--

ALTER TABLE ONLY public."tArea"
    ADD CONSTRAINT "tArea_pkey" PRIMARY KEY ("fIdArea");


--
-- TOC entry 3920 (class 2606 OID 16521)
-- Name: tDatosSensor tDatosSensor_pkey; Type: CONSTRAINT; Schema: public; Owner: iotwsn-pt
--

ALTER TABLE ONLY public."tDatosSensor"
    ADD CONSTRAINT "tDatosSensor_pkey" PRIMARY KEY ("fIdDispositivo");


--
-- TOC entry 3916 (class 2606 OID 16511)
-- Name: tDepartamento tDepartamento_pkey; Type: CONSTRAINT; Schema: public; Owner: iotwsn-pt
--

ALTER TABLE ONLY public."tDepartamento"
    ADD CONSTRAINT "tDepartamento_pkey" PRIMARY KEY ("fIdDepartamento");


--
-- TOC entry 3922 (class 2606 OID 16541)
-- Name: tDatosSensor FKfIdArea; Type: FK CONSTRAINT; Schema: public; Owner: iotwsn-pt
--

ALTER TABLE ONLY public."tDatosSensor"
    ADD CONSTRAINT "FKfIdArea" FOREIGN KEY ("fIdArea") REFERENCES public."tArea"("fIdArea") NOT VALID;


--
-- TOC entry 3921 (class 2606 OID 16536)
-- Name: tArea FKfIdDepartamento; Type: FK CONSTRAINT; Schema: public; Owner: iotwsn-pt
--

ALTER TABLE ONLY public."tArea"
    ADD CONSTRAINT "FKfIdDepartamento" FOREIGN KEY ("fIdDepartamento") REFERENCES public."tDepartamento"("fIdDepartamento") NOT VALID;


--
-- TOC entry 3923 (class 2606 OID 16546)
-- Name: tSerieTiempoId FKfIdDispositivo; Type: FK CONSTRAINT; Schema: public; Owner: iotwsn-pt
--

ALTER TABLE ONLY public."tSerieTiempoId"
    ADD CONSTRAINT "FKfIdDispositivo" FOREIGN KEY ("fIdDispositivo") REFERENCES public."tDatosSensor"("fIdDispositivo") NOT VALID;


-- Completed on 2022-11-10 17:27:36

--
-- PostgreSQL database dump complete
--

