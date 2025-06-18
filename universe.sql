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
    description text NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer,
    planet_types integer,
    distance_from_earth numeric(14,1)
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
    has_life boolean,
    description text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(14,1),
    is_spherical boolean,
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
    has_life boolean,
    description text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(14,1),
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    is_operational boolean,
    launch_year integer,
    orbital_distance_km numeric(14,1),
    planet_id integer NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellites_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellites_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellites_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(14,1),
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellites_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A barred spiral galaxy containing our Solar System, with a prominent central bulge and spiral arms.', true, 13600, 8, 0.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way, featuring a bright core and extensive spiral structure.', false, 10000, 7, 2537000.0);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy in the Local Group, known for its active star-forming regions.', false, 12000, 6, 2730000.0);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'An unbarred spiral galaxy with a prominent dust lane and a bright nucleus, resembling a hat.', false, 13200, 5, 29350000.0);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'A peculiar galaxy with a strong radio source, resulting from a merger of an elliptical and spiral galaxy.', false, 13000, 9, 11000000.0);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'A grand-design spiral galaxy with well-defined arms, interacting with a smaller companion galaxy.', false, 11000, 7, 23100000.0);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel', 'A face-on spiral galaxy with loosely wound arms and numerous star-forming regions.', false, 12500, 6, 20870000.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 'Earth’s rocky, cratered satellite with a thin exosphere and no atmosphere.', 4600, 0.0, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 'A small, irregularly shaped moon of Mars with a heavily cratered surface.', 4600, 0.0, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 'A tiny, rocky moon of Mars with a smooth, dusty surface.', 4600, 0.0, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', false, 'A volcanic moon of Jupiter with intense geological activity and sulfur-rich surface.', 4600, 0.0, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', false, 'An icy moon of Jupiter with a smooth surface and possible subsurface ocean.', 4600, 0.0, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, 'Jupiter’s largest moon, with a magnetic field and icy, cratered terrain.', 4600, 0.0, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', false, 'A heavily cratered, icy moon of Jupiter with an ancient, stable surface.', 4600, 0.0, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', false, 'Saturn’s largest moon, with a thick nitrogen atmosphere and methane lakes.', 4600, 0.0, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', false, 'An icy moon of Saturn with geysers ejecting water vapor from a subsurface ocean.', 4600, 0.0, true, 6);
INSERT INTO public.moon VALUES (10, 'Rhea', false, 'A cratered, icy moon of Saturn with a thin oxygen exosphere.', 4600, 0.0, true, 6);
INSERT INTO public.moon VALUES (11, 'Dione', false, 'An icy moon of Saturn with bright, wispy streaks on its surface.', 4600, 0.0, true, 6);
INSERT INTO public.moon VALUES (12, 'Triton', false, 'Neptune’s largest moon, with a retrograde orbit and nitrogen geysers.', 4600, 0.0, true, 8);
INSERT INTO public.moon VALUES (13, 'Nereid', false, 'A small, irregularly shaped moon of Neptune with an eccentric orbit.', 4600, 0.0, false, 8);
INSERT INTO public.moon VALUES (14, 'Miranda', false, 'An icy moon of Uranus with dramatic cliffs and varied terrain.', 4600, 0.0, true, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', false, 'A bright, icy moon of Uranus with a relatively smooth, cratered surface.', 4600, 0.0, true, 7);
INSERT INTO public.moon VALUES (16, 'Proxima e-I', false, 'A rocky moon orbiting the gas giant, with a thin, methane-rich atmosphere.', 4850, 4.2, true, 10);
INSERT INTO public.moon VALUES (17, 'Proxima e-II', false, 'An icy moon of Proxima e with a frozen, ammonia-covered surface.', 4850, 4.2, true, 10);
INSERT INTO public.moon VALUES (18, 'Sirius b-IIa', false, 'An icy moon orbiting the gas giant, with a reflective, crystalline surface.', 250, 8.6, true, 11);
INSERT INTO public.moon VALUES (19, 'Sirius A-IIa', false, 'A rocky moon of the hot gas giant, scorched by intense stellar radiation.', 250, 8.6, false, 12);
INSERT INTO public.moon VALUES (20, 'Betelgeuse IIIa', false, 'A massive, icy moon orbiting the gas giant, with a turbulent, dusty surface.', 10, 642.5, true, 13);
INSERT INTO public.moon VALUES (21, 'Betelgeuse IIIb', false, 'A rocky moon of Betelgeuse III, with a molten surface from stellar heating.', 10, 642.5, false, 13);
INSERT INTO public.moon VALUES (22, 'Vega e-I', false, 'An icy moon orbiting Vega’s gas giant, with a smooth, reflective surface.', 455, 25.0, true, 16);
INSERT INTO public.moon VALUES (23, 'M31-1c-I', false, 'A stormy moon of the hot gas giant, with a thick, CO2-rich atmosphere.', 20, 2537000.0, true, 17);
INSERT INTO public.moon VALUES (24, 'M31-1d-I', false, 'An icy moon of the ice giant, with a frozen, methane-heavy surface.', 20, 2537000.0, true, 18);
INSERT INTO public.moon VALUES (25, 'M31-2c-I', false, 'A rocky moon orbiting the terrestrial planet, with a thin, nitrogen atmosphere.', 8000, 2537000.5, true, 19);
INSERT INTO public.moon VALUES (26, 'M33-1c-I', false, 'A glowing, rocky moon of the gas giant, heated by intense stellar radiation.', 5, 2730000.0, false, 22);
INSERT INTO public.moon VALUES (27, 'CenA-2d-I', false, 'An icy moon of the ice giant, with a blue, ammonia-rich surface.', 7000, 11000000.4, true, 30);
INSERT INTO public.moon VALUES (28, 'M51-1c-I', false, 'A massive, icy moon of the gas giant, with a cracked, icy crust.', 30, 23100000.0, true, 31);
INSERT INTO public.moon VALUES (29, 'M101-1c-I', false, 'A metallic moon of the hot gas giant, with a reflective, iron-rich surface.', 8, 20870000.0, true, 33);
INSERT INTO public.moon VALUES (30, 'M101-3b-I', false, 'An icy moon orbiting the gas giant, with a smooth, nitrogen-covered surface.', 5000, 20870000.5, true, 34);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'A small, rocky planet closest to the Sun, with extreme temperatures and no atmosphere.', 4600, 0.0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'A hot, volcanic planet with a thick CO2 atmosphere and crushing surface pressure.', 4600, 0.0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'A rocky planet with liquid water, a nitrogen-oxygen atmosphere, and diverse life.', 4600, 0.0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'A cold, desert-like rocky planet with polar ice caps and ancient riverbeds.', 4600, 0.0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'A massive gas giant with turbulent cloud bands and a strong magnetic field.', 4600, 0.0, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'A gas giant with iconic rings and a pale, hydrogen-rich atmosphere.', 4600, 0.0, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'An ice giant with a pale blue, methane-rich atmosphere and a tilted axis.', 4600, 0.0, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'A deep blue ice giant with dynamic storms and a faint ring system.', 4600, 0.0, 1);
INSERT INTO public.planet VALUES (9, 'Proxima d', false, 'A super-Earth in Proxima Centauri’s habitable zone, with a dense nitrogen atmosphere.', 4850, 4.2, 2);
INSERT INTO public.planet VALUES (10, 'Proxima e', false, 'A gas giant with a stormy, methane-rich atmosphere orbiting Proxima Centauri.', 4850, 4.2, 2);
INSERT INTO public.planet VALUES (11, 'Sirius b-II', false, 'A massive gas giant orbiting Sirius’s white dwarf, with reflective, icy clouds.', 250, 8.6, 3);
INSERT INTO public.planet VALUES (12, 'Sirius A-II', false, 'A hot gas giant close to Sirius A, with glowing atmospheric storms.', 250, 8.6, 3);
INSERT INTO public.planet VALUES (13, 'Betelgeuse III', false, 'A colossal gas giant orbiting the red supergiant, with a turbulent, orange atmosphere.', 10, 642.5, 4);
INSERT INTO public.planet VALUES (14, 'Betelgeuse IV', false, 'An ice giant with a dark, hydrogen-rich atmosphere orbiting Betelgeuse.', 10, 642.5, 4);
INSERT INTO public.planet VALUES (15, 'Vega d', false, 'A super-Earth with potential liquid water, orbiting Vega in the habitable zone.', 455, 25.0, 5);
INSERT INTO public.planet VALUES (16, 'Vega e', false, 'A gas giant with a blue, helium-dominated atmosphere orbiting Vega.', 455, 25.0, 5);
INSERT INTO public.planet VALUES (17, 'M31-1c', false, 'A hot gas giant orbiting the blue supergiant, with extreme atmospheric winds.', 20, 2537000.0, 6);
INSERT INTO public.planet VALUES (18, 'M31-1d', false, 'An ice giant with a greenish, methane-heavy atmosphere orbiting M31-1.', 20, 2537000.0, 6);
INSERT INTO public.planet VALUES (19, 'M31-2c', false, 'A large terrestrial planet in M31-2’s habitable zone, with a CO2-rich atmosphere.', 8000, 2537000.5, 7);
INSERT INTO public.planet VALUES (20, 'M31-2d', false, 'A gas giant with colorful cloud bands orbiting the yellow dwarf in Andromeda.', 8000, 2537000.5, 7);
INSERT INTO public.planet VALUES (21, 'M31-3b', false, 'A super-Earth near the neutron star, with a thin, irradiated atmosphere.', 15, 2537001.0, 8);
INSERT INTO public.planet VALUES (22, 'M33-1c', false, 'A massive gas giant close to the O-type star, with a glowing, plasma-like atmosphere.', 5, 2730000.0, 9);
INSERT INTO public.planet VALUES (23, 'M33-1d', false, 'An ice giant with a faint, nitrogen-rich atmosphere orbiting M33-1.', 5, 2730000.0, 9);
INSERT INTO public.planet VALUES (24, 'M33-2b', false, 'A gas giant with a reddish, dusty atmosphere orbiting the red giant in Triangulum.', 6000, 2730000.3, 10);
INSERT INTO public.planet VALUES (25, 'M104-1c', false, 'An ice giant orbiting the white dwarf, with a frozen, ammonia-based atmosphere.', 9000, 29350000.0, 11);
INSERT INTO public.planet VALUES (26, 'M104-2b', false, 'A gas giant in the black hole-star binary system, with tidal heating and storms.', 3000, 29350000.2, 12);
INSERT INTO public.planet VALUES (27, 'M104-3b', false, 'A super-Earth near the B-type star, with a silicate-rich, thin atmosphere.', 25, 29350000.5, 13);
INSERT INTO public.planet VALUES (28, 'CenA-1b', false, 'A small gas giant orbiting the pulsar, with a radiation-battered atmosphere.', 12, 11000000.0, 14);
INSERT INTO public.planet VALUES (29, 'CenA-2c', false, 'A super-Earth in CenA-2’s habitable zone, with potential subsurface oceans.', 7000, 11000000.4, 15);
INSERT INTO public.planet VALUES (30, 'CenA-2d', false, 'An ice giant with a blue, methane-dominated atmosphere orbiting CenA-2.', 7000, 11000000.4, 15);
INSERT INTO public.planet VALUES (31, 'M51-1c', false, 'A massive gas giant near the blue giant, with dynamic, storm-filled cloud bands.', 30, 23100000.0, 16);
INSERT INTO public.planet VALUES (32, 'M51-2c', false, 'A gas giant in the binary system, with a reflective, icy atmosphere.', 4000, 23100000.1, 17);
INSERT INTO public.planet VALUES (33, 'M101-1c', false, 'A hot gas giant orbiting the young star, with a highly reflective, metallic atmosphere.', 8, 20870000.0, 18);
INSERT INTO public.planet VALUES (34, 'M101-2c', false, 'A super-Earth orbiting the red dwarf, with a dense, CO2-heavy atmosphere.', 10000, 20870000.2, 19);
INSERT INTO public.planet VALUES (35, 'M101-3b', false, 'A gas giant with a pale, hydrogen-dominated atmosphere orbiting M101-3.', 5000, 20870000.5, 20);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble', 'A space telescope capturing detailed images of distant galaxies.', true, 1990, 547.0, 3);
INSERT INTO public.satellite VALUES (2, 'ISS', 'An international space station for research and human habitation.', true, 1998, 408.0, 3);
INSERT INTO public.satellite VALUES (3, 'Starlink-1', 'A satellite for global internet coverage, part of a mega-constellation.', true, 2019, 550.0, 3);
INSERT INTO public.satellite VALUES (4, 'GPS-NAVSTAR', 'A navigation satellite providing global positioning services.', true, 1989, 20200.0, 3);
INSERT INTO public.satellite VALUES (5, 'GOES-16', 'A weather satellite monitoring Earth’s climate and storms.', true, 2016, 35786.0, 3);
INSERT INTO public.satellite VALUES (6, 'Landsat-8', 'An Earth observation satellite for environmental monitoring.', true, 2013, 705.0, 3);
INSERT INTO public.satellite VALUES (7, 'TESS', 'A telescope satellite searching for exoplanets around nearby stars.', true, 2018, 108000.0, 3);
INSERT INTO public.satellite VALUES (8, 'Chandra', 'An X-ray observatory studying high-energy cosmic phenomena.', true, 1999, 139000.0, 3);
INSERT INTO public.satellite VALUES (9, 'Aqua', 'A satellite monitoring Earth’s water cycle and climate.', true, 2002, 705.0, 3);
INSERT INTO public.satellite VALUES (10, 'Terra', 'An Earth observation satellite studying land and atmosphere.', true, 1999, 705.0, 3);
INSERT INTO public.satellite VALUES (11, 'Starlink-2', 'Another satellite in the Starlink constellation for broadband.', true, 2020, 550.0, 3);
INSERT INTO public.satellite VALUES (12, 'Iridium-77', 'A communication satellite for global voice and data services.', true, 1998, 780.0, 3);
INSERT INTO public.satellite VALUES (13, 'CubeSat-1', 'A small research satellite studying Earth’s magnetosphere.', true, 2021, 500.0, 3);
INSERT INTO public.satellite VALUES (14, 'Sentinel-2A', 'A European satellite for land and coastal monitoring.', true, 2015, 786.0, 3);
INSERT INTO public.satellite VALUES (15, 'Voyager-3', 'A fictional future satellite for deep-space communication relay.', false, 2030, 100000.0, 3);
INSERT INTO public.satellite VALUES (16, 'GeoEye-1', 'A high-resolution imaging satellite for commercial use.', true, 2008, 681.0, 3);
INSERT INTO public.satellite VALUES (17, 'WorldView-4', 'A satellite providing high-resolution Earth imagery.', true, 2016, 617.0, 3);
INSERT INTO public.satellite VALUES (18, 'Skysat-1', 'A small satellite for rapid-response Earth imaging.', true, 2013, 450.0, 3);
INSERT INTO public.satellite VALUES (19, 'MAVEN', 'A satellite studying Mars’s atmosphere and climate evolution.', true, 2013, 6200.0, 4);
INSERT INTO public.satellite VALUES (20, 'MRO', 'Mars Reconnaissance Orbiter for high-resolution surface imaging.', true, 2005, 320.0, 4);
INSERT INTO public.satellite VALUES (21, 'Mars-Odyssey', 'A satellite mapping Mars’s surface and relaying data.', true, 2001, 400.0, 4);
INSERT INTO public.satellite VALUES (22, 'Ares-Sat-1', 'A hypothetical satellite for Mars communication networks.', true, 2035, 600.0, 4);
INSERT INTO public.satellite VALUES (23, 'Ares-Sat-2', 'A future Mars satellite for surface weather monitoring.', true, 2040, 500.0, 4);
INSERT INTO public.satellite VALUES (24, 'Proxima-Sat-1', 'A hypothetical satellite studying Proxima d’s atmosphere.', true, 2070, 200.0, 9);
INSERT INTO public.satellite VALUES (25, 'Proxima-Sat-2', 'A future satellite for Proxima d surface mapping.', true, 2075, 300.0, 9);
INSERT INTO public.satellite VALUES (26, 'Vega-Sat-1', 'A fictional satellite probing Vega d’s potential oceans.', true, 2080, 250.0, 15);
INSERT INTO public.satellite VALUES (27, 'Vega-Sat-2', 'A future satellite for Vega d atmospheric analysis.', true, 2085, 350.0, 15);
INSERT INTO public.satellite VALUES (28, 'Earth-Scope-1', 'A next-gen satellite for Earth climate monitoring.', true, 2027, 700.0, 3);
INSERT INTO public.satellite VALUES (29, 'Mars-Relay-1', 'A hypothetical Mars satellite for rover communications.', true, 2045, 450.0, 4);
INSERT INTO public.satellite VALUES (30, 'GlobalEye-1', 'A future Earth satellite for real-time global imaging.', true, 2030, 650.0, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'A G-type main-sequence star at the center of our Solar System, powering Earth’s climate.', 4600, 0.0, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'A small red dwarf, the closest known star to the Sun, with low luminosity.', 4850, 4.2, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in Earth’s night sky, a binary system with a white dwarf companion.', 250, 8.6, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A red supergiant in Orion, nearing the end of its life, likely to supernova soon.', 10, 642.5, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'A bright, young star in Lyra, surrounded by a debris disk, used as a photometric standard.', 455, 25.0, 1);
INSERT INTO public.star VALUES (6, 'M31-1', 'A massive blue supergiant in Andromeda’s outer spiral arm, highly luminous.', 20, 2537000.0, 2);
INSERT INTO public.star VALUES (7, 'M31-2', 'A yellow dwarf star in Andromeda’s core, part of a dense stellar cluster.', 8000, 2537000.5, 2);
INSERT INTO public.star VALUES (8, 'M31-3', 'A neutron star in Andromeda, remnant of a supernova with strong magnetic fields.', 15, 2537001.0, 2);
INSERT INTO public.star VALUES (9, 'M33-1', 'A young, hot O-type star in Triangulum, driving intense star formation.', 5, 2730000.0, 3);
INSERT INTO public.star VALUES (10, 'M33-2', 'A red giant in Triangulum’s spiral arm, expanding as it nears the end of its life.', 6000, 2730000.3, 3);
INSERT INTO public.star VALUES (11, 'M104-1', 'A white dwarf in Sombrero’s dust lane, cooling after exhausting its fuel.', 9000, 29350000.0, 4);
INSERT INTO public.star VALUES (12, 'M104-2', 'A binary star system in Sombrero, with a main-sequence star orbiting a black hole.', 3000, 29350000.2, 4);
INSERT INTO public.star VALUES (13, 'M104-3', 'A massive B-type star in Sombrero’s nucleus, emitting intense ultraviolet radiation.', 25, 29350000.5, 4);
INSERT INTO public.star VALUES (14, 'CenA-1', 'A pulsar in Centaurus A, rapidly rotating with powerful radio emissions.', 12, 11000000.0, 5);
INSERT INTO public.star VALUES (15, 'CenA-2', 'A K-type orange dwarf in Centaurus A, stable with potential habitable planets.', 7000, 11000000.4, 5);
INSERT INTO public.star VALUES (16, 'M51-1', 'A bright blue giant in Whirlpool’s spiral arm, part of an active star-forming region.', 30, 23100000.0, 6);
INSERT INTO public.star VALUES (17, 'M51-2', 'A binary system in Whirlpool with two main-sequence stars in tight orbit.', 4000, 23100000.1, 6);
INSERT INTO public.star VALUES (18, 'M101-1', 'A young, massive star in Pinwheel’s loose spiral arms, surrounded by nebular gas.', 8, 20870000.0, 7);
INSERT INTO public.star VALUES (19, 'M101-2', 'A red dwarf in Pinwheel, faint but long-lived, with minimal flare activity.', 10000, 20870000.2, 7);
INSERT INTO public.star VALUES (20, 'M101-3', 'A white main-sequence star in Pinwheel, part of a loose star cluster.', 5000, 20870000.5, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 35, true);


--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellites_satellite_id_seq', 30, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


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
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


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
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


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
-- Name: satellite satellites_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_description_key UNIQUE (description);


--
-- Name: satellite satellites_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_name_key UNIQUE (name);


--
-- Name: satellite satellites_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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
-- Name: satellite satellites_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

