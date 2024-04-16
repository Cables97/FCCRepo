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
    name character varying(30) NOT NULL,
    has_earth boolean NOT NULL,
    type character varying(30),
    num_of_planets integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_in_kg integer,
    moon_shape text,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    mass_in_kg integer,
    star_id integer,
    some_numeric numeric(6,2)
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
-- Name: sidetable; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sidetable (
    legs integer,
    sidetable_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.sidetable OWNER TO freecodecamp;

--
-- Name: sidetable_sidetable_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sidetable_sidetable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sidetable_sidetable_id_seq OWNER TO freecodecamp;

--
-- Name: sidetable_sidetable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sidetable_sidetable_id_seq OWNED BY public.sidetable.sidetable_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_earth boolean NOT NULL,
    star_type text,
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: sidetable sidetable_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sidetable ALTER COLUMN sidetable_id SET DEFAULT nextval('public.sidetable_sidetable_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'barred spiral galaxy', 99);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 'barred spiral galaxy', 32);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', false, 'barred spiral galaxy', 42);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', false, 'looks like taco', 60);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', false, 'barred spiral galaxy', 2);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', false, 'something crazy', 12);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 999, 'circle', 1);
INSERT INTO public.moon VALUES (2, 'Moon2', 999, 'circle', 2);
INSERT INTO public.moon VALUES (3, 'Moon3', 999, 'circle', 2);
INSERT INTO public.moon VALUES (4, 'Moon4', 999, 'circle', 2);
INSERT INTO public.moon VALUES (5, 'Moon5', 999, 'circle', 2);
INSERT INTO public.moon VALUES (6, 'Moon6', 999, 'circle', 2);
INSERT INTO public.moon VALUES (7, 'Moon7', 999, 'circle', 2);
INSERT INTO public.moon VALUES (8, 'Moon8', 999, 'circle', 2);
INSERT INTO public.moon VALUES (9, 'Moon9', 999, 'circle', 2);
INSERT INTO public.moon VALUES (10, 'Moon10', 999, 'circle', 2);
INSERT INTO public.moon VALUES (11, 'Moon11', 999, 'circle', 2);
INSERT INTO public.moon VALUES (12, 'Moon12', 999, 'circle', 2);
INSERT INTO public.moon VALUES (13, 'Moon13', 999, 'circle', 2);
INSERT INTO public.moon VALUES (14, 'Moon14', 999, 'circle', 2);
INSERT INTO public.moon VALUES (15, 'Moon15', 999, 'circle', 2);
INSERT INTO public.moon VALUES (16, 'Moon16', 999, 'circle', 2);
INSERT INTO public.moon VALUES (17, 'Moon17', 999, 'circle', 2);
INSERT INTO public.moon VALUES (18, 'Moon18', 999, 'circle', 2);
INSERT INTO public.moon VALUES (19, 'Moon19', 999, 'circle', 2);
INSERT INTO public.moon VALUES (20, 'Moon20', 999, 'circle', 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 9999, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', false, 9999, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', true, 5972, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', false, 9999, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 9999, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 9999, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 9999, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 9999, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 9999, 3, NULL);
INSERT INTO public.planet VALUES (10, 'Haumea', false, 9999, 2, NULL);
INSERT INTO public.planet VALUES (11, 'Makemake', false, 9999, 2, NULL);
INSERT INTO public.planet VALUES (12, 'Quaoar', false, 9999, 2, NULL);
INSERT INTO public.planet VALUES (13, 'Orcus', false, 9999, 2, NULL);


--
-- Data for Name: sidetable; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sidetable VALUES (4, 1, 'table1');
INSERT INTO public.sidetable VALUES (3, 2, 'table2');
INSERT INTO public.sidetable VALUES (4, 3, 'table3');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', true, 'yellow dwarf', 1);
INSERT INTO public.star VALUES (2, 'star2', false, 'yellow dwarf', 1);
INSERT INTO public.star VALUES (3, 'star3', false, 'blue dwarf', 2);
INSERT INTO public.star VALUES (4, 'star4', false, 'yellow dwarf', 5);
INSERT INTO public.star VALUES (5, 'star5', false, 'yellow giant', 4);
INSERT INTO public.star VALUES (6, 'star6', false, 'something crazy', 3);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: sidetable_sidetable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sidetable_sidetable_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: sidetable sidetable_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sidetable
    ADD CONSTRAINT sidetable_name_key UNIQUE (name);


--
-- Name: sidetable sidetable_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sidetable
    ADD CONSTRAINT sidetable_pkey PRIMARY KEY (sidetable_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

