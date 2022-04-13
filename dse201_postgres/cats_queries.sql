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
-- Name: friends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friends (
    friend_1 integer NOT NULL,
    friend_2 integer NOT NULL
);


ALTER TABLE public.friends OWNER TO postgres;

--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    user_id integer NOT NULL,
    video_id integer NOT NULL,
    ts timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: login_; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_ (
    id integer NOT NULL,
    user_id integer NOT NULL,
    ts timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.login_ OWNER TO postgres;

--
-- Name: login__id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login__id_seq OWNER TO postgres;

--
-- Name: login__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login__id_seq OWNED BY public.login_.id;


--
-- Name: suggested; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suggested (
    login_id integer NOT NULL,
    video_id integer NOT NULL
);


ALTER TABLE public.suggested OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name text,
    last_name text,
    fb_name text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.videos (
    id integer NOT NULL,
    video_name text
);


ALTER TABLE public.videos OWNER TO postgres;

--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.videos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videos_id_seq OWNER TO postgres;

--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.videos_id_seq OWNED BY public.videos.id;


--
-- Name: watched; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.watched (
    user_id integer NOT NULL,
    video_id integer NOT NULL,
    ts timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.watched OWNER TO postgres;

--
-- Name: login_ id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_ ALTER COLUMN id SET DEFAULT nextval('public.login__id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: videos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videos ALTER COLUMN id SET DEFAULT nextval('public.videos_id_seq'::regclass);


--
-- Name: friends friends_friend_1_friend_2_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_friend_1_friend_2_key UNIQUE (friend_1, friend_2);


--
-- Name: likes likes_user_id_video_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_video_id_key UNIQUE (user_id, video_id);


--
-- Name: login_ login__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_
    ADD CONSTRAINT login__pkey PRIMARY KEY (id);


--
-- Name: suggested suggested_login_id_video_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suggested
    ADD CONSTRAINT suggested_login_id_video_id_key UNIQUE (login_id, video_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- Name: friends friends_friend_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_friend_1_fkey FOREIGN KEY (friend_1) REFERENCES public.users(id);


--
-- Name: friends friends_friend_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_friend_2_fkey FOREIGN KEY (friend_2) REFERENCES public.users(id);


--
-- Name: likes likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: likes likes_video_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_video_id_fkey FOREIGN KEY (video_id) REFERENCES public.videos(id);


--
-- Name: login_ login__user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_
    ADD CONSTRAINT login__user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: suggested suggested_login_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suggested
    ADD CONSTRAINT suggested_login_id_fkey FOREIGN KEY (login_id) REFERENCES public.login_(id);


--
-- Name: suggested suggested_video_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suggested
    ADD CONSTRAINT suggested_video_id_fkey FOREIGN KEY (video_id) REFERENCES public.videos(id);


--
-- Name: watched watched_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watched
    ADD CONSTRAINT watched_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: watched watched_video_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watched
    ADD CONSTRAINT watched_video_id_fkey FOREIGN KEY (video_id) REFERENCES public.videos(id);


--
-- PostgreSQL database dump complete
--

--Q1
SELECT
    video_id as vid
FROM
    likes
GROUP BY video_id
ORDER BY COUNT(video_id) DESC LIMIT 10;

--Q2
DEALLOCATE ALL;
PREPARE f_suggest(int) AS
    WITH f1 AS (
        SELECT friend_2 as f_list FROM friends WHERE friends.friend_1 = $1
        UNION --union is used to combine the friendships into 1 column instead of two
        SELECT friend_1 as f_list FROM friends WHERE friends.friend_2 = $1
        )
    SELECT
        l.video_id,
        COUNT(l.video_id)
    FROM
        f1
            inner join likes l on l.user_id = f_list
    GROUP BY l.video_id
    ORDER BY COUNT(l.video_id) DESC LIMIT 10;

EXECUTE f_suggest(1);

--Q3
DEALLOCATE ALL;
PREPARE f_f_suggest(int) AS
    WITH f1 AS (
        SELECT friend_2 as f_list FROM friends WHERE friends.friend_1 = $1
        UNION --union is used to combine the friendships into 1 column instead of two
        SELECT friend_1 as f_list FROM friends WHERE friends.friend_2 = $1
        ),
    f2 as (
        --f2 is used to add to f1 and output friends and friends of friends
        SELECT friend_2 as f_list FROM friends WHERE friend_1 in (select * from f1)
        UNION
        SELECT friend_1 as f_list FROM friends WHERE friend_2 in (select * from f1)
        )
    SELECT
        l.video_id,
        COUNT(l.video_id)
    FROM
        f2
            inner join likes l on l.user_id = f_list
    GROUP BY l.video_id
    ORDER BY COUNT(l.video_id) DESC LIMIT 10;

EXECUTE f_f_suggest(1);

--Q4
DEALLOCATE ALL;
PREPARE kind_cats(int) AS
    WITH
    hist as (
        SELECT
            l.video_id
        FROM
            likes l
        WHERE l.user_id = $1
    ),
    other_users as (
        SELECT
            l.user_id as uid
        FROM
            likes l
                inner join hist on l.video_id = hist.video_id and l.user_id != $1 --get rid of user
    )
    SELECT
        l.video_id as vid
    FROM
        likes l
            inner join other_users u on l.user_id = u.uid
    GROUP BY l.video_id
    ORDER BY COUNT(l.video_id) DESC LIMIT 10;

EXECUTE kind_cats(1);

--Q5
DEALLOCATE ALL;
PREPARE kind_cats_pref(int) AS
    WITH
    x as (
        SELECT
            *
        FROM
            likes
        WHERE likes.user_id = $1
    ),
    weights as (
        SELECT
            l.user_id as yid,
            LOG(COUNT(l.video_id) + 1) as weight --do not get rid of user x since that is included acording to instructions
        FROM
            likes l
                inner join x on x.video_id = l.video_id
        GROUP BY l.user_id
    )
    SELECT
        l.video_id
    FROM
        likes l
            inner join weights w on l.user_id = w.yid
    GROUP BY l.video_id
    ORDER BY SUM(w.weight) DESC LIMIT 10;

EXECUTE kind_cats_pref(1); --notice how in this example, row 5 and 6 have swapped positions compared to Q4