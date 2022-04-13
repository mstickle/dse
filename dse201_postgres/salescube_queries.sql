--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    category_name text,
    category_desc text
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name text,
    last_name text,
    state_id integer NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    prod_name text,
    price double precision,
    category_id integer NOT NULL,
    CONSTRAINT products_price_check CHECK ((price > (0)::double precision))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    id integer NOT NULL,
    prod_id integer NOT NULL,
    customer_id integer NOT NULL,
    quantity integer,
    discount double precision,
    CONSTRAINT sales_discount_check CHECK (((discount >= (0)::double precision) AND (discount <= (1)::double precision)))
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Name: sales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_id_seq OWNER TO postgres;

--
-- Name: sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    id integer NOT NULL,
    state_name text,
    abbrev text
);


ALTER TABLE public.states OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: sales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: categories categories_category_name_category_desc_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_category_name_category_desc_key UNIQUE (category_name, category_desc);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_prod_name_price_category_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_prod_name_price_category_id_key UNIQUE (prod_name, price, category_id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- Name: states states_abbrev_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_abbrev_key UNIQUE (abbrev);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: states states_state_name_abbrev_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_state_name_abbrev_key UNIQUE (state_name, abbrev);


--
-- Name: states states_state_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_state_name_key UNIQUE (state_name);


--
-- Name: customers customers_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: sales sales_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: sales sales_prod_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_prod_id_fkey FOREIGN KEY (prod_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

-- Q1
SELECT
    c.id,
    COALESCE(SUM(s.quantity), 0) as tot_quantity,
    COALESCE(SUM((p.price - (p.price * s.discount)) * s.quantity), 0) as tot_money
FROM
    sales s
        LEFT JOIN products p ON  s.prod_id = p.id
        FULL OUTER JOIN customers c ON c.id = s.customer_id
GROUP BY
    c.id
ORDER BY tot_quantity desc;

-- Q2
SELECT
	st.id,
	COALESCE(SUM(s.quantity), 0) as tot_quantity,
	COALESCE(SUM((p.price - (p.price * s.discount)) * s.quantity), 0) as tot_money
From
    sales s
        LEFT JOIN products p ON s.prod_id = p.id
        FULL OUTER JOIN customers c ON c.id = s.customer_id
        FULL OUTER JOIN states st on st.id = c.state_id
GROUP BY st.id
ORDER BY st.id;

--Q3
drop function foo;

CREATE OR REPLACE FUNCTION foo(int) RETURNS TABLE(pid int, cust_id int, tot_quantity bigint, tot_money double precision)
    AS  $$
        SELECT
            s.prod_id as pid,
            s.customer_id as cust_id,
            SUM(s.quantity) as tot_quantity,
            SUM((p.price - (p.price * s.discount)) * s.quantity) as tot_money
        FROM sales s, products p
        WHERE
            s.customer_id = $1 and s.prod_id = p.id
        GROUP BY s.prod_id, s.customer_id
        ORDER BY tot_money DESC;
        $$
    LANGUAGE SQL
    STABLE
    RETURNS NULL ON NULL INPUT;

SELECT * FROM foo(1);

--Q4
SELECT
    cid as cust_id,
    pid as pid,
    COALESCE(SUM(s.quantity), 0) as tot_quantity,
    COALESCE(SUM((a.price - (a.price * s.discount)) * s.quantity), 0) as tot_money
FROM
    sales s FULL OUTER JOIN
        (select c.id as cid, p.id as pid, p.price
         from customers c cross join products p) a
        ON s.prod_id = pid and cid = s.customer_id  
GROUP BY
    cid, pid
ORDER BY tot_money DESC;

--Q5
SELECT
    st.id as state_id,
    cat.id as category_id,
    COALESCE(SUM(s.quantity), 0) as tot_quantity,
    COALESCE(SUM((p.price - (p.price * s.discount)) * s.quantity), 0) as tot_money
FROM
    states st cross join categories cat
        LEFT OUTER JOIN products p on cat.id = p.category_id
        LEFT OUTER JOIN customers c ON c.state_id = st.id
        LEFT OUTER JOIN sales s on s.prod_id = p.id and s.customer_id = c.id
GROUP BY
    st.id, cat.id
ORDER BY
    st.id, cat.id;

--Q6
WITH
    top_custs AS (
        SELECT
            c.id as cust_id,
            COALESCE(SUM((p.price - (p.price * s.discount)) * s.quantity), 0) as tot_money,
            RANK() OVER(ORDER BY COALESCE(SUM((p.price - (p.price * s.discount)) * s.quantity), 0) DESC) as rnk
        FROM
            sales s
                LEFT OUTER JOIN products p on s.prod_id = p.id
                FULL OUTER JOIN customers c on s.customer_id = c.id
        GROUP BY c.id
        ORDER BY tot_money DESC limit 20
     ),
     top_cats AS (
        SELECT
            cat.id as cat_id,
            COALESCE(SUM((p.price - (p.price * s.discount)) * s.quantity), 0) as tot_money,
            RANK() OVER(ORDER BY COALESCE(SUM((p.price - (p.price * s.discount)) * s.quantity), 0) DESC) as rnk
        FROM
            categories cat
                LEFT OUTER JOIN products p on cat.id = p.category_id
                LEFT OUTER JOIN sales s on s.prod_id = p.id
        GROUP BY cat.id
        ORDER BY tot_money DESC limit 20
     )
SELECT -- WANT TO OUTPUT TOP 20 CUSTOMERS PURCHASES OF EACH CATEGORY
    t_cat.cat_id as cat_id,
    t_cat.rnk as cat_rank,
    t_c.cust_id as cust_id,
    t_c.rnk as cust_rank,
    COALESCE(SUM(s.quantity), 0) as tot_quantity,
    COALESCE(SUM((p.price - (p.price * s.discount)) * s.quantity), 0) as tot_revenue
FROM
    top_custs t_c cross join top_cats t_cat
        LEFT OUTER JOIN products p on t_cat.cat_id = p.category_id
        LEFT OUTER JOIN sales s on s.prod_id = p.id and s.customer_id = t_c.cust_id
GROUP BY t_cat.cat_id, t_c.cust_id, t_cat.rnk, t_c.rnk
ORDER BY tot_revenue DESC;