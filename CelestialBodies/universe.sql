--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: empty; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.empty (
    name character varying(20),
    empty_id integer NOT NULL,
    moon_id integer NOT NULL,
    emptyval integer,
    emptyval2 integer
);


ALTER TABLE public.empty OWNER TO freecodecamp;

--
-- Name: empty_empty_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.empty_empty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empty_empty_id_seq OWNER TO freecodecamp;

--
-- Name: empty_empty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.empty_empty_id_seq OWNED BY public.empty.empty_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    star_count integer NOT NULL,
    galaxy_id integer NOT NULL,
    isvisible boolean,
    isgas boolean
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
    name character varying(20) NOT NULL,
    composition text,
    moon_id integer NOT NULL,
    planet_id integer,
    travelled_to boolean
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
    name character varying(20) NOT NULL,
    has_water boolean NOT NULL,
    mass numeric(8,3),
    star_id integer,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    planet_count integer NOT NULL,
    galaxy_id integer,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    radius_x1000 numeric(5,2)
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
-- Name: empty empty_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.empty ALTER COLUMN empty_id SET DEFAULT nextval('public.empty_empty_id_seq'::regclass);


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
-- Data for Name: empty; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.empty VALUES ('taco', 1, 1, 1, 1);
INSERT INTO public.empty VALUES ('burrito', 2, 1, 1, 1);
INSERT INTO public.empty VALUES ('cat', 3, 1, 1, 1);
INSERT INTO public.empty VALUES ('dog', 4, 1, 1, 1);
INSERT INTO public.empty VALUES ('Shnitzel', 5, 1, 1, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 200, 1, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Chocolate Path', 150, 2, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 150, 3, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 0, 4, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 0, 5, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 50, 6, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 'rock', 1, 1, NULL);
INSERT INTO public.moon VALUES ('Phobos', 'Rock', 2, 4, NULL);
INSERT INTO public.moon VALUES ('Demios', 'Rock', 3, 4, NULL);
INSERT INTO public.moon VALUES ('Europa', 'Rock', 4, 5, NULL);
INSERT INTO public.moon VALUES ('Ganymede', 'Rock', 5, 5, NULL);
INSERT INTO public.moon VALUES ('Callisto', 'Rock', 6, 5, NULL);
INSERT INTO public.moon VALUES ('Io', 'Rock', 7, 5, NULL);
INSERT INTO public.moon VALUES ('Titan', 'rock', 8, 6, NULL);
INSERT INTO public.moon VALUES ('Enceladus', 'Rock', 9, 6, NULL);
INSERT INTO public.moon VALUES ('Hyperion', 'Rock', 10, 6, NULL);
INSERT INTO public.moon VALUES ('Pandora', 'Rock', 11, 6, NULL);
INSERT INTO public.moon VALUES ('Janus', 'Rock', 12, 6, NULL);
INSERT INTO public.moon VALUES ('Epimetheus', 'Rock', 13, 6, NULL);
INSERT INTO public.moon VALUES ('Mimas', 'Rock', 14, 6, NULL);
INSERT INTO public.moon VALUES ('Miranda', 'Rock', 15, 7, NULL);
INSERT INTO public.moon VALUES ('Ariel', 'Rock', 16, 7, NULL);
INSERT INTO public.moon VALUES ('Umbriel', 'Rock', 17, 7, NULL);
INSERT INTO public.moon VALUES ('Titania', 'Rock', 18, 7, NULL);
INSERT INTO public.moon VALUES ('Oberon', 'Rock', 19, 7, NULL);
INSERT INTO public.moon VALUES ('Despina', 'Rock', 20, 8, NULL);
INSERT INTO public.moon VALUES ('Galatea', 'Rock', 21, 8, NULL);
INSERT INTO public.moon VALUES ('Halimede', 'Rock', 22, 8, NULL);
INSERT INTO public.moon VALUES ('Hippocamp', 'Rock', 23, 8, NULL);
INSERT INTO public.moon VALUES ('Laomedeia', 'Rock', 24, 8, NULL);
INSERT INTO public.moon VALUES ('Larissa', 'Rock', 25, 8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', false, 2.440, 1, 1);
INSERT INTO public.planet VALUES ('Venus', false, 4.868, 1, 2);
INSERT INTO public.planet VALUES ('Earth', true, 5.972, 1, 3);
INSERT INTO public.planet VALUES ('Mars', false, 6.417, 1, 4);
INSERT INTO public.planet VALUES ('Jupiter', false, 1898.200, 1, 5);
INSERT INTO public.planet VALUES ('Saturn', false, 568.340, 1, 6);
INSERT INTO public.planet VALUES ('Uranus', false, 86.810, 1, 7);
INSERT INTO public.planet VALUES ('Neptune', false, 102.413, 1, 8);
INSERT INTO public.planet VALUES ('Pluto', false, 2.440, 1, 9);
INSERT INTO public.planet VALUES ('Vesta', false, 4.868, 1, 10);
INSERT INTO public.planet VALUES ('Tethys', true, 5.972, 1, 11);
INSERT INTO public.planet VALUES ('Callisto', false, 6.417, 1, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sol', 8, 1, 1, true, 696.34);
INSERT INTO public.star VALUES ('Sirius', 0, 1, 2, false, 13.91);
INSERT INTO public.star VALUES ('Canopus', 0, 1, 3, false, 500.90);
INSERT INTO public.star VALUES ('Arcturus', 0, 1, 4, false, 176.71);
INSERT INTO public.star VALUES ('Vega', 0, 1, 5, false, 14.85);
INSERT INTO public.star VALUES ('Capella', 0, 1, 6, false, 83.34);


--
-- Name: empty_empty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.empty_empty_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: empty empty_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.empty
    ADD CONSTRAINT empty_name_key UNIQUE (name);


--
-- Name: empty empty_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.empty
    ADD CONSTRAINT empty_pkey PRIMARY KEY (empty_id);


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
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


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
-- Name: empty empty_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.empty
    ADD CONSTRAINT empty_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

