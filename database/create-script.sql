--------------------------------------------
--  Authentication and Authorization
-- (Tables used by the authentication and authorization system)
--------------------------------------------
drop table if exists users, user_roles, track, mood_playlist, track_mood;
create table users (
    username varchar(255) primary key,
    email varchar(255),
    password varchar(255)
    -- Additional fields can be added here,
    -- such as first name, last name, etc.
    -- Just also update the spring user model/dao
);

create table user_roles (
    username varchar(255),
    role varchar(255),
    primary key (username, role)
);

-- Create the admin/admin user with the ADMIN role
insert into users (username, password, email) values ('admin', '$2a$10$kRbQq1xPISiteFw/LMEoi.Cid/tKI4.flGJB.05hhtPpgIYu.LPbS', 'admin@example.com');
insert into user_roles (username, role) values ('admin', 'ADMIN');

--------------------------------------------
--  Application
-- (Tables used by the application)
--------------------------------------------

-- TODO: Add your tables here!
create table track (
	track_id serial PRIMARY KEY,
	title varchar(255),
	description varchar(255),
	artist varchar(255),
	image varchar(255),
	energy int,
        valence int
);

create table mood_playlist (
	mood_id serial PRIMARY KEY,
	mood varchar(255) not null,
	mood_img varchar(255)
);

create table track_mood (
	track_mood_id serial PRIMARY KEY,
	track_id int,
	mood_id int,
	FOREIGN KEY (track_id) references track(track_id),
	FOREIGN KEY (mood_id) references mood_playlist(mood_id)

);

insert into track(title, description, artist, image, energy, valence) values('What a Wonderful World','Genre: Jazz, Released: 1967','Louis Armstrong','https://i.postimg.cc/x1SgFhNs/1.jpg',3, 0);
insert into track(title, description, artist, image, energy, valence) values('Fast Car','Genre: Folk Rock , Released: 1988 ','Tracy Chapman','https://i.postimg.cc/x1ygr5K9/2.jpg',3, 0);
insert into track(title, description, artist, image, energy, valence) values('Fake Plastic Trees','Genre: Alt. Rock , Released: 1995','Radiohead','https://i.postimg.cc/6QM0qQjS/3.jpg',3, 0);
insert into track(title, description, artist, image, energy, valence) values('Nothing Compares 2 U','Genre: Pop, Released: 1990','Sinead OConnor','https://i.postimg.cc/0Nkn9SfD/4.jpg',3, 0);
insert into track(title, description, artist, image, energy, valence) values('Angel','Genre: Adult Contemporary, Released: 1998','Sarah McLachlan','https://i.postimg.cc/k4DybdL5/5.jpg',3, 0);
insert into track(title, description, artist, image, energy, valence) values('Fix You','Genre: Alt. Rock, Released: 2005','Coldplay','https://i.postimg.cc/k4ZvNpdv/6.jpg',3, 0);
insert into track(title, description, artist, image, energy, valence) values('Wild Horses','Genre: Country Rock, Released: 1971','The Rolling Stones','https://i.postimg.cc/L51Bx39K/7.jpg',3, 0);
insert into track(title, description, artist, image, energy, valence) values('Wake Me Up When September Ends','Genre: Emo, Released: 2005','Green Day','https://i.postimg.cc/XY8K1JbJ/8.jpg',3, 0);
insert into track(title, description, artist, image, energy, valence) values('The Sound of Silence','Genre: Folk Rock, Released: 1966','Simon & Garfunkel','https://i.postimg.cc/BvnTr0SC/9.jpg',3, 0);
insert into track(title, description, artist, image, energy, valence) values('Mad World','Genre: Soft Rock, Released: 2003','Gary Jules','https://i.postimg.cc/fbqcZrkQ/10.jpg',3, 0);
insert into track(title, description, artist, image, energy, valence) values('Girl From the North Country ','Genre: Folk, Released: 1963','Bob Dylan & Johnny Cash','https://i.postimg.cc/76CgLnTG/11.jpg',0, 7);
insert into track(title, description, artist, image, energy, valence) values('How Ya Doin ','Genre: Folk, Released: 2022','Neil Young & Crazy Horse','https://i.postimg.cc/sfhYdKrb/12.jpg',0, 7);
insert into track(title, description, artist, image, energy, valence) values('Skyline Pigeon','Genre: Soft Rock, Released: 1969','Elton John','https://i.postimg.cc/tTLFnnhr/13.jpg',0, 7);
insert into track(title, description, artist, image, energy, valence) values('Cinderella','Genre: Rap, Released: 2016','Mac Miller & Ty Dolla Sign','https://i.postimg.cc/hvTTL4sK/14.jpg',0, 7);
insert into track(title, description, artist, image, energy, valence) values('Aqueous Transmission','Genre: Alt. Metal, Released: 2001','Incubus','https://i.postimg.cc/1XhN3hQ2/15.jpg',0, 7);
insert into track(title, description, artist, image, energy, valence) values('Harvest Moon','Genre: Folk Rock, Released: 1992','Neil Young','https://i.postimg.cc/ZYpdDRPS/16.jpg',0, 7);
insert into track(title, description, artist, image, energy, valence) values('An Ending (Ascent)','Genre: Ambient, Released: 1982','Brian Eno','https://i.postimg.cc/L6N45Kk7/17.jpg',0, 7);
insert into track(title, description, artist, image, energy, valence) values('Gravity','Genre: Prog. Rock, Released: 2003','A Perfect Circle','https://i.postimg.cc/sDzhFrKZ/18.jpg',0, 7);
insert into track(title, description, artist, image, energy, valence) values('Aruarian Dance','Genre: Lo-fi Hip Hop, Released: 2004','Nujabes','https://i.postimg.cc/0jYK6W5Q/19.jpg',0, 7);
insert into track(title, description, artist, image, energy, valence) values('Puffy Cloud','Genre: Punk Rock, Released: 1990','Ween','https://i.postimg.cc/PrM8TRFV/20.jpg',0, 7);
insert into track(title, description, artist, image, energy, valence) values('Eye of the Tiger','Genre: Hard Rock, Released: 1982','Survivor','https://i.postimg.cc/nhRjQQxv/21.jpg',10, 6);
insert into track(title, description, artist, image, energy, valence) values('We Will Rock You','Genre: Arena Rock, Released: 1977','Queen','https://i.postimg.cc/K8v3zD6G/22.jpg',10, 6);
insert into track(title, description, artist, image, energy, valence) values('Get Lucky','Genre: Disco, Released: 2013','Daft Punk','https://i.postimg.cc/6qfT68z4/23.jpg',10, 6);
insert into track(title, description, artist, image, energy, valence) values('Pump It','Genre: Dance, Released: 2006','Black Eyed Peas','https://i.postimg.cc/bNqsCRNx/24.jpg',10, 6);
insert into track(title, description, artist, image, energy, valence) values('Stronger','Genre: Hip Hop, Released: 2007','Kanye West','https://i.postimg.cc/tCD7LVYL/25.jpg',10, 6);
insert into track(title, description, artist, image, energy, valence) values('Night of Fire','Genre: Eurobeat, Released: 2000','N.I.K.O','https://i.postimg.cc/kMQ2vH9M/26.jpg',10, 6);
insert into track(title, description, artist, image, energy, valence) values('Pump Up the Jam','Genre: House, Released: 1989','Technotronic','https://i.postimg.cc/520j1Nzj/27.jpg',10, 6);
insert into track(title, description, artist, image, energy, valence) values('Highway Star','Genre: Hard Rock, Released: 1972','Deep Purple','https://i.postimg.cc/6pmqQJVc/28.jpg',10, 6);
insert into track(title, description, artist, image, energy, valence) values('Dont Start Now','Genre: Nu-Disco, Released: 2019','Dua Lipa','https://i.postimg.cc/yN3dgQvH/29.jpg',10, 6);
insert into track(title, description, artist, image, energy, valence) values('Alterlife','Genre: Pop, Released: 2017','Rina Sawayama','https://i.postimg.cc/qMBvXMjQ/30.jpg',10, 6);
insert into track(title, description, artist, image, energy, valence) values('Hey Ya!','Genre: Pop, Released: 2003','OutKast','https://i.postimg.cc/dtWtWPfF/31.jpg',3, 7);
insert into track(title, description, artist, image, energy, valence) values('Walking on Sunshine','Genre: Bubblegum, Released: 1985','Katrina and the Waves','https://i.postimg.cc/52T9V51k/32.jpg',3, 7);
insert into track(title, description, artist, image, energy, valence) values('Lovely Day','Genre: R&B, Released: 1977','Bill Whithers','https://i.postimg.cc/L8n4wQd1/33.jpg',3, 7);
insert into track(title, description, artist, image, energy, valence) values('Shiny Happy People','Genre: Pop Rock, Released: 1991','R.E.M.','https://i.postimg.cc/1zFm5g3R/34.jpg',3, 7);
insert into track(title, description, artist, image, energy, valence) values('Shake It Off','Genre: Dance-Pop, Released: 2014','Taylor Swift','https://i.postimg.cc/3RHKyKkX/35.jpg',3, 7);
insert into track(title, description, artist, image, energy, valence) values('Good as Hell','Genre: Hip Pop, Released: 2016','Lizzo','https://i.postimg.cc/C1HwkW8W/36.jpg',3, 7);
insert into track(title, description, artist, image, energy, valence) values('Three Little Birds','Genre: Reggae, Released: 1980','Bob Marley & The Wailers','https://i.postimg.cc/7YLqJtZW/37.jpg',3, 7);
insert into track(title, description, artist, image, energy, valence) values('September','Genre: Funk, Released: 1978','Earth, Wind, and Fire','https://i.postimg.cc/7YQw31CY/38.jpg',3, 7);
insert into track(title, description, artist, image, energy, valence) values('Candy','Genre: Pop, Released: 1986','Cameo','https://i.postimg.cc/nr3ZwB02/39.jpg',3, 7);
insert into track(title, description, artist, image, energy, valence) values('Dancing Queen','Genre: Disco, Released: 1976','ABBA','https://i.postimg.cc/dQ6q1cwC/40.jpg',3, 7);
insert into track(title, description, artist, image, energy, valence) values('You Oughta Know','Genre: Alt. Rock, Released: 1995','Alanis Morissette','https://i.postimg.cc/Nj9YpyT8/41.jpg',6, 0);
insert into track(title, description, artist, image, energy, valence) values('Were Not Gonna Take It','Genre: Glam Metal, Released: 1984','Twisted Sister','https://i.postimg.cc/0yTv38dT/42.jpg',6, 0);
insert into track(title, description, artist, image, energy, valence) values('Chop Suey!','Genre: Nu Metal, Released: 2001','System of a Down','https://i.postimg.cc/bv1PfKms/43.jpg',6, 0);
insert into track(title, description, artist, image, energy, valence) values('Last Resort','Genre: Nu Metal, Released: 2000','Papa Roach','https://i.postimg.cc/C5xpDdSq/44.jpg',6, 0);
insert into track(title, description, artist, image, energy, valence) values('Break Stuff','Genre: Nu Metal, Released: 2000','Limp Bizkit','https://i.postimg.cc/9Mpjry52/45.jpg',6, 0);
insert into track(title, description, artist, image, energy, valence) values('The Way I Am','Genre: Hip Hop, Released: 2000','Eminem','https://i.postimg.cc/C5rT4Yx6/46.jpg',6, 0);
insert into track(title, description, artist, image, energy, valence) values('Before He Cheats','Genre: Country, Released: 2006','Carrie Underwood','https://i.postimg.cc/NGdct8k7/47.jpg',6, 0);
insert into track(title, description, artist, image, energy, valence) values('Rage','Genre: Trap, Released: 2018','Rico Nasty','https://i.postimg.cc/yYWz8Jfq/48.jpg',6, 0);
insert into track(title, description, artist, image, energy, valence) values('St. Anger','Genre: Alt. Metal, Released: 2003','Metallica','https://i.postimg.cc/wTPYy6P1/49.jpg',6, 0);
insert into track(title, description, artist, image, energy, valence) values('Ambitionz az a Ridah','Genre: Gangsta Rap, Released: 1996','https://i.postimg.cc/9Q75y65J/50.jpg','2Pac',6, 0);
insert into track(title, description, artist, image, energy, valence) values('Geeks In Love','Genre: Geek Rock, Released: 2005','Lemon Demon','https://i.postimg.cc/ZnM2dcwG/51.jpg',7, 9);
insert into track(title, description, artist, image, energy, valence) values('Unforgettable','Genre: Pop, Released: 1951','Nat King Cole','https://i.postimg.cc/WpWQCNs5/52.jpg',7, 9);
insert into track(title, description, artist, image, energy, valence) values('Sweet Love','Genre: R&B, Released: 1986','Anita Baker','https://i.postimg.cc/hvjNvw18/53.jpg',7, 9);
insert into track(title, description, artist, image, energy, valence) values('Unchained Melody','Genre: Blue-eyed Soul, Released: 1965','The Righteous Brothers','https://i.postimg.cc/8P7qV25N/54.jpg',7, 9);
insert into track(title, description, artist, image, energy, valence) values('By Your Side','Genre: Soul, Released: 2000','Sade','https://i.postimg.cc/pX33Vsh8/55.jpg',7, 9);
insert into track(title, description, artist, image, energy, valence) values('Cigarettes & Coffee','Genre: Soul, Released: 1966','Otis Redding','https://i.postimg.cc/cLY2vfwz/56.jpg',7, 9);
insert into track(title, description, artist, image, energy, valence) values('I Will Always Love You','Genre: Soul, Released: 1992','Whitney Houston','https://i.postimg.cc/q7TYygGv/57.jpg',7, 9);
insert into track(title, description, artist, image, energy, valence) values('At Last','Genre: Jazz, Released: 1960','Etta James','https://i.postimg.cc/k5vHc9jF/58.jpg',7, 9);
insert into track(title, description, artist, image, energy, valence) values('La-La Means I Love You','Genre: R&B, Released: 1968','The Delfonics','https://i.postimg.cc/4d8FDPRY/59.jpg',7, 9);
insert into track(title, description, artist, image, energy, valence) values('SSultan Qalbam Tu Asti','Genre: Romantic, Released: 1970','Ahmed Zahir','https://i.postimg.cc/FRFBCq8t/60.jpg',7, 9);

insert into mood_playlist(mood, mood_img) values ('sad','https://i.postimg.cc/02SKK44C/sad.png');
insert into mood_playlist(mood, mood_img) values ('calm','https://i.postimg.cc/0QCcvQYb/calm.png');
insert into mood_playlist(mood, mood_img) values ('energetic','https://i.postimg.cc/T2CCHK2s/energetic.png');
insert into mood_playlist(mood, mood_img) values ('happy','https://i.postimg.cc/QxvgR52f/happy.png');
insert into mood_playlist(mood, mood_img) values ('angry','https://i.postimg.cc/7ZCszqkW/angry.png');
insert into mood_playlist(mood, mood_img) values ('love','https://i.postimg.cc/rwS43HCp/love.png');

insert into track_mood(track_id,mood_id) values(1,1);
insert into track_mood(track_id,mood_id) values(2,1);
insert into track_mood(track_id,mood_id) values(3,1);
insert into track_mood(track_id,mood_id) values(4,1);
insert into track_mood(track_id,mood_id) values(5,1);
insert into track_mood(track_id,mood_id) values(6,1);
insert into track_mood(track_id,mood_id) values(7,1);
insert into track_mood(track_id,mood_id) values(8,1);
insert into track_mood(track_id,mood_id) values(9,1);
insert into track_mood(track_id,mood_id) values(10,1);
insert into track_mood(track_id,mood_id) values(11,2);
insert into track_mood(track_id,mood_id) values(12,2);
insert into track_mood(track_id,mood_id) values(13,2);
insert into track_mood(track_id,mood_id) values(14,2);
insert into track_mood(track_id,mood_id) values(15,2);
insert into track_mood(track_id,mood_id) values(16,2);
insert into track_mood(track_id,mood_id) values(17,2);
insert into track_mood(track_id,mood_id) values(18,2);
insert into track_mood(track_id,mood_id) values(19,2);
insert into track_mood(track_id,mood_id) values(20,2);
insert into track_mood(track_id,mood_id) values(21,3);
insert into track_mood(track_id,mood_id) values(22,3);
insert into track_mood(track_id,mood_id) values(23,3);
insert into track_mood(track_id,mood_id) values(24,3);
insert into track_mood(track_id,mood_id) values(25,3);
insert into track_mood(track_id,mood_id) values(26,3);
insert into track_mood(track_id,mood_id) values(27,3);
insert into track_mood(track_id,mood_id) values(28,3);
insert into track_mood(track_id,mood_id) values(29,3);
insert into track_mood(track_id,mood_id) values(30,3);
insert into track_mood(track_id,mood_id) values(31,4);
insert into track_mood(track_id,mood_id) values(32,4);
insert into track_mood(track_id,mood_id) values(33,4);
insert into track_mood(track_id,mood_id) values(34,4);
insert into track_mood(track_id,mood_id) values(35,4);
insert into track_mood(track_id,mood_id) values(36,4);
insert into track_mood(track_id,mood_id) values(37,4);
insert into track_mood(track_id,mood_id) values(38,4);
insert into track_mood(track_id,mood_id) values(39,4);
insert into track_mood(track_id,mood_id) values(40,4);
insert into track_mood(track_id,mood_id) values(41,5);
insert into track_mood(track_id,mood_id) values(42,5);
insert into track_mood(track_id,mood_id) values(43,5);
insert into track_mood(track_id,mood_id) values(44,5);
insert into track_mood(track_id,mood_id) values(45,5);
insert into track_mood(track_id,mood_id) values(46,5);
insert into track_mood(track_id,mood_id) values(47,5);
insert into track_mood(track_id,mood_id) values(48,5);
insert into track_mood(track_id,mood_id) values(49,5);
insert into track_mood(track_id,mood_id) values(50,5);
insert into track_mood(track_id,mood_id) values(51,6);
insert into track_mood(track_id,mood_id) values(52,6);
insert into track_mood(track_id,mood_id) values(53,6);
insert into track_mood(track_id,mood_id) values(54,6);
insert into track_mood(track_id,mood_id) values(55,6);
insert into track_mood(track_id,mood_id) values(56,6);
insert into track_mood(track_id,mood_id) values(57,6);
insert into track_mood(track_id,mood_id) values(58,6);
insert into track_mood(track_id,mood_id) values(59,6);
insert into track_mood(track_id,mood_id) values(60,6);

