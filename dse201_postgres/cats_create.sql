-- track users
CREATE TABLE users (
    id               SERIAL PRIMARY KEY,
    first_name       TEXT,
    last_name        TEXT,
    fb_name          TEXT
);

-- tracks video ids
-- do not enforce uniqueness of video names since we do not track other info
-- such as year to be able to ensure we do not eliminate remakes
CREATE TABLE videos (
    id               SERIAL PRIMARY KEY,
    video_name       TEXT
);

-- use user and video id references to log liked videos and timestamp
-- unique constraint added to prevent logging of the same video being liked
CREATE TABLE likes (
    user_id          INTEGER REFERENCES users (id) NOT NULL,
    video_id         INTEGER REFERENCES videos (id) NOT NULL,
    ts               timestamp without time zone NOT NULL DEFAULT now(),
    UNIQUE(user_id, video_id)
);

-- use user and video id references to log watched videos and timestamp
-- do not enforce uniqueness since videos can be rewatched
CREATE TABLE watched (
    user_id          INTEGER REFERENCES users (id) NOT NULL,
    video_id         INTEGER REFERENCES videos (id) NOT NULL,
    ts               timestamp without time zone NOT NULL DEFAULT now()
);

-- log unique id of user and time they signed in
CREATE TABLE login_ (
    id               SERIAL PRIMARY KEY,
    user_id          INTEGER REFERENCES users (id) NOT NULL,
    ts               timestamp without time zone NOT NULL DEFAULT now()
);

-- dont need user since login_id references login_ which has user and ts info
-- since videos need to be unique across a given login, unique constraint is used
CREATE TABLE suggested (
    login_id         INTEGER REFERENCES login_ (id) NOT NULL,
    video_id         INTEGER REFERENCES videos (id) NOT NULL,
    UNIQUE(login_id, video_id)
);

-- both friends need to come from user table
-- to prevent repeated friend entries (ie: x,y and x,y) unique constraint added
CREATE TABLE friends (
    friend_1          INTEGER REFERENCES users (id) NOT NULL,
    friend_2          INTEGER REFERENCES users (id) NOT NULL,
    UNIQUE(friend_1, friend_2)
);

INSERT INTO users (first_name, last_name, fb_name)
VALUES ('emily', 'lull', 'emully');

INSERT INTO users (first_name, last_name, fb_name)
VALUES ('ash', 'ketchum', 'pokemaster');

INSERT INTO users (first_name, last_name, fb_name)
VALUES ('wade', 'wilson', 'merc_with_a_mouth_69');

INSERT INTO videos (video_name)
VALUES ('ash vs the evil dead');

INSERT INTO videos (video_name)
VALUES ('pokemon 2000');

INSERT INTO videos (video_name)
VALUES ('free guy');

INSERT INTO videos (video_name)
VALUES ('deadpool');

INSERT INTO likes (user_id, video_id)
VALUES (1, 2);

INSERT INTO likes (user_id, video_id)
VALUES (3, 4);

INSERT INTO watched (user_id, video_id)
VALUES (1, 1);

INSERT INTO watched (user_id, video_id)
VALUES (1, 1);

INSERT INTO login_ (user_id)
VALUES (1);

INSERT INTO login_ (user_id)
VALUES (3);

INSERT INTO login_ (user_id)
VALUES (2);

INSERT INTO suggested (login_id, video_id)
VALUES (2, 1);

INSERT INTO suggested (login_id, video_id)
VALUES (2, 3);

INSERT INTO suggested (login_id, video_id)
VALUES (2, 4);

INSERT INTO suggested (login_id, video_id)
VALUES (1, 1);

INSERT INTO friends (friend_1, friend_2)
VALUES (1, 1);

INSERT INTO friends (friend_1, friend_2)
VALUES (1, 2);

INSERT INTO friends (friend_1, friend_2)
VALUES (2, 1);