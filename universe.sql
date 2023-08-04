--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    description text NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    constellation character varying(50) NOT NULL
);

CREATE TABLE public.comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    discovery_year INT NOT NULL,
    distance_from_sun NUMERIC NOT NULL
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    moon_type character varying(50) NOT NULL,
    planet_id integer NOT NULL
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
    description text NOT NULL,
    planet_type character varying(50) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    number_of_moon integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    star_type character varying(50) NOT NULL,
    distance_from_earth numeric NOT NULL,
    number_of_planet integer NOT NULL,
    galaxy_id integer NOT NULL
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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 'Orion');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearset major galaxy', 'Spiral', 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in the Local Group', 'Sprial', 'Triangulum');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Interacting grand-design spiral galaxy', 'Spiral', 'Canes Ventici');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Unusual galaxy with a prominent dust lane', 'Spiral', 'Virgo');
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 'Starburst galaxy with a bright core', 'Irregular', 'Cetus');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet (name, description, planet_type, age_in_millions_of_years, number_of_moon, has_life, is_spherical, star_id) VALUES
('Mercury', 'The closest planet to the Sun', 'Terrestrial', 4500, 0, false, true, 2),
('Venus', 'The second planet from the Sun and known for its thick atmosphere', 'Terrestrial', 4500, 0, false, true, 2),
('Earth', 'The third planet from the Sun and home to life', 'Terrestrial', 4500, 1, true, true, 1),
('Mars', 'The fourth planet from the Sun and known as the Red Planet', 'Terrestrial', 4000, 2, false, true, 1),
('Jupiter', 'The largest planet in our Solar System', 'Gas giant', 4500, 79, false, false, 1),
('Saturn', 'Known for its prominent ring system', 'Gas giant', 4500, 82, false, false, 1),
('Uranus', 'The seventh planet from the Sun', 'Ice giant', 4500, 27, false, false, 2),
('Neptune', 'The eighth and farthest known planet from the Sun', 'Ice giant', 4500, 14, false, false, 2),
('Pluto', 'Dwarf planet in the Kuiper belt', 'Dwarf planet', 1000, 5, false, true, 3),
('Kepler-452b', 'An exoplanet orbiting the Sun-like star Kepler-452', 'Exoplanet', 6000, 0, false, true, 4),
('Proxima Centauri b', 'Exoplanet orbiting the star Proxima Centauri', 'Exoplanet', 100, 0, false, true, 5),
('HD 209458 b', 'Hot Jupiter exoplanet with an atmosphere', 'Exoplanet', 1000, 0, false, false, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon (name, description, moon_type, planet_id) VALUES
('Moon', 'Earth''s natural satellite and the only one we have', 'Natural satellite', 3),
('Phobos', 'One of Mars'' moons and named after the Greek god of fear', 'Natural satellite', 4),
('Deimos', 'The other moon of Mars and named after the Greek god of terror', 'Natural satellite', 4),
('Ganymede', 'Largest moon in the Solar System and a moon of Jupiter', 'Natural satellite', 5),
('Titan', 'The largest moon of Saturn and has a thick atmosphere', 'Natural satellite', 6),
('Io', 'One of the four Galilean moons of Jupiter', 'Natural satellite', 5),
('Europa', 'Another of the Galilean moons of Jupiter', 'Natural satellite', 5),
('Callisto', 'One more of the Galilean moons of Jupiter', 'Natural satellite', 5),
('Enceladus', 'Moon of Saturn known for its active geysers', 'Natural satellite', 6),
('Triton', 'The largest moon of Neptune and orbits in the opposite direction', 'Natural satellite', 8),
('Charon', 'Largest moon of Pluto and is tidally locked to it', 'Natural satellite', 9),
('Phoebe', 'Saturn''s moon with a retrograde orbit', 'Natural satellite', 6),
('Dione', 'Moon of Saturn with a bright and wispy appearance', 'Natural satellite', 7),
('Hyperion', 'Saturn''s irregularly shaped moon with a spongy appearance', 'Natural satellite', 7),
('Oberon', 'Uranus''s moon with a heavily cratered surface', 'Natural satellite', 8),
('Ariel', 'Uranus''s moon with a relatively young and smooth surface', 'Natural satellite', 8),
('Titania', 'Uranus''s largest moon and the eighth-largest moon in the Solar System', 'Natural satellite', 8),
('Rhea', 'Moon of Saturn with a heavily cratered surface and a bright wispy streak', 'Natural satellite', 7),
('Iapetus', 'Saturn''s moon with a yin-yang appearance due to contrasting hemispheres', 'Natural satellite', 7),
('Miranda', 'Uranus''s moon with a diverse and varied surface', 'Natural satellite', 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star and the center of the Solar System', 'G-type main-sequence', 0, 8, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', 'A-type main-sequence', 8.6, 2, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Closest star system to the Solar System', 'Triple star system', 4.4, 3, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant and prominent star in Orion', 'M-type supergiant', 642, 0, 2);
INSERT INTO public.star VALUES (5, 'Vega', 'Bright star in the constellation Lyra', 'A-type main-sequence', 25.3, 1, 3);
INSERT INTO public.star VALUES (6, 'Polaris', 'North Star and part of Ursa Minor', 'F-type supergiant', 433, 1, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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

INSERT INTO public.comet (name, description, discovery_year, distance_from_sun) VALUES
('Halley''s Comet', 'A famous periodic comet visible from Earth', 1705, 35.1),
('Comet Hale-Bopp', 'A bright comet visible in the late 1990s', 1995, 315.1),
('Comet NEOWISE', 'A recent comet discovered by the NEOWISE spacecraft', 2020, 320.5),
('Comet 67P/Churyumov-Gerasimenko', 'The target of the Rosetta mission by the ESA', 1969, 460.9),
('Comet ISON', 'A sungrazing comet discovered in 2012', 2012, 28.3);
