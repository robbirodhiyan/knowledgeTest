--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-07 06:53:24

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
-- TOC entry 218 (class 1259 OID 17676)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL,
    user_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17675)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 4804 (class 0 OID 0)
-- Dependencies: 217
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 216 (class 1259 OID 17665)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    gender character varying(10) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17664)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4642 (class 2604 OID 17679)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4639 (class 2604 OID 17668)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4798 (class 0 OID 17676)
-- Dependencies: 218
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES (1, 'Product 1', 'This is a description of Product 1', 19.99, NULL, '2024-09-05 07:43:15.263', '2024-09-05 07:43:15.263');
INSERT INTO public.products VALUES (3, 'Updated Product 1', 'This is an updated description of Product 1', 29.99, 1, '2024-09-05 07:46:53.229', '2024-09-05 07:48:23.345');
INSERT INTO public.products VALUES (5, 'tes create product', 'tes', 1000.00, 1, '2024-09-06 15:33:38.532', '2024-09-06 15:33:38.532');
INSERT INTO public.products VALUES (4, 'edit', 'produk', 1000.00, 1, '2024-09-05 07:46:55.286', '2024-09-06 16:05:01.317');
INSERT INTO public.products VALUES (7, 'tes', 'deskripsi', 50000.00, 4, '2024-09-06 16:51:42.973', '2024-09-06 16:51:42.973');


--
-- TOC entry 4796 (class 0 OID 17665)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'John Doe', 'john@example.com', '$2a$10$N3RcwNjksZDkFimDXQ0izOCCAy6j05fM5Cgw7omZcdcNFoRMfkUTO', 'male', '2024-09-05 07:09:11.017', '2024-09-05 07:09:11.017');
INSERT INTO public.users VALUES (2, 'John Doe', 'tes@gmail.com', '$2a$10$SH/WKQi1PBlkeBIrt8pP5etV9Pif5qwIfF/qfAi.8g/U.Gk1iOWT2', 'male', '2024-09-06 15:34:29.836', '2024-09-06 15:34:29.836');
INSERT INTO public.users VALUES (3, 'ahmad', 'robbirodhiyan@gmail.com', '$2a$10$3JyjoR28/x4GcR6cZgQnk.7PB8.rC4oxSkK4mwYZ3MncDfJmSFuLm', 'male', '2024-09-06 16:49:36.415', '2024-09-06 16:49:36.415');
INSERT INTO public.users VALUES (4, 'ahmadrobbi', 'admin@admin.com', '$2a$10$xT.fTBkjdWxpuTH9XwFF3.mqF4MdscX2Llk85IGOzZrw15JG4FS62', 'male', '2024-09-06 16:51:24.059', '2024-09-06 16:51:24.059');


--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 217
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 4650 (class 2606 OID 17685)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4646 (class 2606 OID 17674)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4648 (class 2606 OID 17672)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4651 (class 2606 OID 17686)
-- Name: products products_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2024-09-07 06:53:25

--
-- PostgreSQL database dump complete
--

