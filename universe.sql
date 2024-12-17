--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    name character varying(50) NOT NULL,
    radius numeric(10,3) NOT NULL,
    has_life boolean,
    ages integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_planet (
    moon_planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance numeric NOT NULL
);


ALTER TABLE public.moon_planet OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    has_life boolean NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_mil numeric(10,2) NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    galaxy_id integer,
    ages integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'great', 'ga_one', 100.000, false, NULL);
INSERT INTO public.galaxy VALUES (3, 'g', 'g2', 300.000, false, 10);
INSERT INTO public.galaxy VALUES (5, 'g', 'g5', 300.000, false, 10);
INSERT INTO public.galaxy VALUES (6, 'small', 'g3', 220.000, false, 2);
INSERT INTO public.galaxy VALUES (7, 'g', 'g7', 300.000, false, 10);
INSERT INTO public.galaxy VALUES (8, 'small', 'g6', 220.000, false, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'm1', false, 'fast', 1);
INSERT INTO public.moon VALUES (2, 'm2', false, 'fast', 1);
INSERT INTO public.moon VALUES (3, 'm3', false, 'fast', 1);
INSERT INTO public.moon VALUES (4, 'm6', false, 'fast', 1);
INSERT INTO public.moon VALUES (5, 'm5', false, 'fast', 1);
INSERT INTO public.moon VALUES (6, 'm4', false, 'fast', 1);
INSERT INTO public.moon VALUES (7, 'm9', false, 'fast', 1);
INSERT INTO public.moon VALUES (8, 'm8', false, 'fast', 1);
INSERT INTO public.moon VALUES (9, 'm7', false, 'fast', 1);
INSERT INTO public.moon VALUES (10, 'm12', false, 'fast', 1);
INSERT INTO public.moon VALUES (11, 'm11', false, 'fast', 1);
INSERT INTO public.moon VALUES (12, 'm10', false, 'fast', 1);
INSERT INTO public.moon VALUES (13, 'm13', false, 'FAST', 1);
INSERT INTO public.moon VALUES (14, 'm17', false, 'fast', 1);
INSERT INTO public.moon VALUES (15, 'm16', false, 'fast', 1);
INSERT INTO public.moon VALUES (16, 'm15', false, 'fast', 1);
INSERT INTO public.moon VALUES (17, 'm14', false, 'FAST', 1);
INSERT INTO public.moon VALUES (18, 'm21', false, 'fast', 1);
INSERT INTO public.moon VALUES (19, 'm20', false, 'fast', 1);
INSERT INTO public.moon VALUES (20, 'm19', false, 'fast', 1);
INSERT INTO public.moon VALUES (21, 'm18', false, 'FAST', 1);


--
-- Data for Name: moon_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_planet VALUES (1, 'p1_m1', 200);
INSERT INTO public.moon_planet VALUES (2, 'p_m1', 200);
INSERT INTO public.moon_planet VALUES (3, 'p11_m1', 200);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, false, 'p1', 'green', 100.00, 1);
INSERT INTO public.planet VALUES (2, false, 'p2', 'green', 100.00, 1);
INSERT INTO public.planet VALUES (3, false, 'P3', 'YELLOW', 220.10, 1);
INSERT INTO public.planet VALUES (4, false, 'p4', 'green', 100.00, 1);
INSERT INTO public.planet VALUES (5, false, 'P5', 'YELLOW', 220.10, 1);
INSERT INTO public.planet VALUES (6, false, 'P6', 'BLUE', 200.00, 1);
INSERT INTO public.planet VALUES (7, false, 'p9', 'green', 100.00, 1);
INSERT INTO public.planet VALUES (8, false, 'P8', 'YELLOW', 220.10, 1);
INSERT INTO public.planet VALUES (9, false, 'P7', 'BLUE', 200.00, 1);
INSERT INTO public.planet VALUES (10, false, 'p10', 'great', 300.00, 1);
INSERT INTO public.planet VALUES (11, false, 'P12', 'WANDER', 222.00, 1);
INSERT INTO public.planet VALUES (12, false, 'p110', 'great', 300.00, 1);
INSERT INTO public.planet VALUES (13, false, 'P22', 'WANDER', 222.00, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star_one', 'beautiful', false, 1, 300);
INSERT INTO public.star VALUES (2, 'star2', 'amazing', false, 1, 200);
INSERT INTO public.star VALUES (3, 'star3', 'woo', false, 1, 300);
INSERT INTO public.star VALUES (4, 'star4', 'amazing', false, 1, 200);
INSERT INTO public.star VALUES (5, 'star5', 'woo', false, 1, 300);
INSERT INTO public.star VALUES (6, 'star8', 'amazing', false, 1, 200);
INSERT INTO public.star VALUES (7, 'star7', 'woo', false, 1, 300);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_planet moon_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_pkey PRIMARY KEY (moon_planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: moon_planet unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

