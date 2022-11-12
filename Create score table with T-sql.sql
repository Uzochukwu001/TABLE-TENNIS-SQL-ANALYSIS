/*1a. CREATION OF THE DIFFERENT TABLES*/

--Create Score Table

CREATE TABLE mod_Scoretable (
		id int IDENTITY(1,1) NOT NULL,
		game int NOT NULL,
		player varchar(1) NULL,
		score int NULL
);


--Create Game Table

CREATE TABLE Gametable (
		id int IDENTITY(1,1) NOT NULL,
		winner varchar(1) NOT NULL,
		gamedate datetime2 NOT NULL
);


--Create Player Table

CREATE TABLE Playertable (
		id varchar(1) NOT NULL,
		firstname varchar(4) NOT NULL,
		lastname varchar(9) NOT NULL
);



/*1b. INSERTION OF DATA INTO THE DIFFERENT TABLES*/

--Insert data into Scoretable

INSERT INTO [mod_Scoretable] (game,player,score)
		VALUES (1,'A',11),
				(1,'B',7),
				(2,'A',15),
				(2,'C',13),
				(3,'B',11),
				(3,'D',9),
				(4,'D',11),
				(4,'A',5),
				(5,'A',11),
				(6,'B',11),
				(6,'C',2),
				(6,'D',5)
;


--Insert data into Gametable

INSERT INTO Gametable (winner,gamedate)
		VALUES ('A','2017-01-02'),
				('A','2016-05-06'),
				('B','2017-12-15'),
				('D','2016-05-06')
;


--Insert data into Playertable

INSERT INTO Playertable (id,firstname,lastname)
		VALUES ('A','Phil','Watertank'),
				('B','Eva', 'Smith'),
				('C','John','Wick'),
				('D','Bill','Bull'),
				('E','Lisa', 'Owen')
;

--The relationships among the three tables was modelled using the 'manage relationship' tab on the Tools bar above; on their respective PKs and FKs.


/*2. Show the average score of each player, even if they didn't play any games.
	 Expected output (Player ID, Name, Average score) */

SELECT dbo.Playertable.id as Player_ID, dbo.Playertable.firstname as Name, ROUND(AVG(dbo.mod_Scoretable.score),0) Average_score
FROM dbo.Playertable
LEFT JOIN dbo.mod_Scoretable
ON dbo.Playertable.id = dbo.mod_Scoretable.player
GROUP BY dbo.Playertable.id, dbo.Playertable.firstname;



/*3a. The score table is corrupted: a game can only have two players (not more, not less). 
	  Write a query that identifies and only shows the valid games and their winner. Expected output (Game,Winner) */

/*3b. As an additional challenge, you can also display the winner's score. The condition described above should still apply.
	  Expected output (Game, Winner, Winner Score) */

WITH scoreboard AS (SELECT dbo.mod_Scoretable.game AS game, COUNT(dbo.mod_Scoretable.player) AS num_of_players, MAX(dbo.mod_Scoretable.score) AS score
				FROM  dbo.mod_Scoretable
				GROUP BY dbo.mod_Scoretable.game
				HAVING COUNT(dbo.mod_Scoretable.player) = 2),
		gaming AS (SELECT dbo.Gametable.id AS game, dbo.Gametable.winner AS winner
					FROM  dbo.Gametable)
SELECT gaming.game, gaming.winner, scoreboard.score
FROM gaming 
INNER JOIN scoreboard
ON gaming.game = scoreboard.game



/*4. Show the score of player 'Phil Watertank' for games that he lost. 
	 Expected output (Game ID, Player Name, Player Lastname, Score) */


WITH Scores AS (SELECT dbo.mod_Scoretable.game AS game_id, MIN(dbo.mod_Scoretable.score) AS S
				FROM dbo.mod_Scoretable
				GROUP BY dbo.mod_Scoretable.game),
	Player AS (SELECT dbo.Playertable.id AS B, dbo.Playertable.firstname AS p, dbo.Playertable.lastname AS l
				FROM dbo.Playertable),
	Gaming AS (SELECT dbo.mod_Scoretable.game AS G, dbo.mod_Scoretable.player AS P
				FROM dbo.mod_Scoretable)

SELECT Scores.game_id AS Game_ID, Player.p AS Player_Name, Player.l AS Player_Lastname, Scores.S AS min_score
FROM Gaming
INNER JOIN Player
ON Gaming.P = Player.B
LEFT JOIN Scores
ON Gaming.G = Scores.game_id
WHERE Player.p = 'Phil' AND Scores.game_id = 4;



/*5. The following two queries return the same result. Why and what is the difference?*/

	QUERY I: 
			SELECT * FROM dbo.Playertable
			LEFT JOIN dbo.mod_Scoretable on dbo.mod_Scoretable.Player = dbo.Playertable.ID
			WHERE dbo.mod_Scoretable.Player IS NOT NULL

	QUERY II:
			SELECT * FROM dbo.Playertable
			RIGHT JOIN dbo.mod_Scoretable on dbo.mod_Scoretable.Player = dbo.Playertable.ID 
			WHERE dbo.mod_Scoretable.Player IS NOT NULL; 
			
--ANSWERS TO THE QUESTIONS.

--The two queries are similar because the adjoining column and the specified constraints in both queries are similar which didn't have much effect as it was only a reorder statement.

--The first Query returns all records on the player table joined together with the matching key values on the score table,
--eliminating the rows where the score.player's column is empty (which was inexistent) WHILE 
--The Query II returns all records on the score table joined together with the matching key values on the player table,
--eliminating the rows where the score.player's column is empty(which was inexistent)

/*6. The following two queries return the players which have not played any games. In your opinion, which one is the best and why? Discuss. */

	QUERY I:
			SELECT DISTINCT dbo.Playertable.id, dbo.Playertable.firstname, dbo.Playertable.lastname FROM dbo.Playertable
			LEFT JOIN dbo.mod_Scoretable on dbo.mod_Scoretable.player = dbo.Playertable.id
			WHERE dbo.mod_Scoretable.player IS NULL

	QUERY II:
			SELECT dbo.Playertable.id, dbo.Playertable.firstname, dbo.Playertable.lastname FROM dbo.Playertable
			WHERE dbo.Playertable.id NOT IN (SELECT DISTINCT dbo.mod_Scoretable.player FROM dbo.mod_Scoretable)

--ANSWER TO THE QUESTIONS.

--The second query which implements a subquery,is not just simple in structure, but is better as it requires lesser resources to achieve optimum query performance than joins.



/*7. Show the list of player combinations who have never played together.
	 Expected output (Player 1, Player 2). Reverse duplicates are authorized (A-E and E-A for example) */

--Possible Game Combinations for all players 

SELECT P1.id AS player_1, P2.id AS player_2
FROM Playertable P1
CROSS JOIN Playertable P2
WHERE P1.id IN ('A','B','C','D', 'E') AND P1.id != P2.id


--possible combinations of players who have played together Home/Away (for valid games only).

WITH S1 AS (SELECT dbo.mod_Scoretable.game AS game, COUNT(dbo.mod_Scoretable.player) AS num_of_players
				FROM  dbo.mod_Scoretable
				GROUP BY dbo.mod_Scoretable.game
				HAVING COUNT(dbo.mod_Scoretable.player) = 2),
	S2 AS (SELECT dbo.mod_Scoretable.game AS gamingA, dbo.mod_Scoretable.player AS player_1
				FROM  dbo.mod_Scoretable),
	S3 AS (SELECT dbo.mod_Scoretable.game AS gamingB, dbo.mod_Scoretable.player AS player_2
				FROM  dbo.mod_Scoretable)
SELECT S2.player_1, S3.player_2 
FROM S1
INNER JOIN S2
ON S1.game = S2.gamingA
INNER JOIN S3
ON S1.game = S3.gamingB
WHERE S2.player_1 != S3.player_2


--possible combinations of players who have never played together. Home/Away (For valid games only)
--below is a test on EXCEPT fnxn

SELECT dbo.Playertable.id
FROM dbo.Playertable

EXCEPT 

SELECT dbo.mod_Scoretable.player 
FROM dbo.mod_Scoretable

--To get players that never played, all possible combinations minus valid games players

SELECT P1.id AS player_1, P2.id AS player_2
FROM Playertable P1
CROSS JOIN Playertable P2
WHERE P1.id IN ('A','B','C','D', 'E') AND P1.id != P2.id

EXCEPT

WITH S1 AS (SELECT dbo.mod_Scoretable.game AS game, COUNT(dbo.mod_Scoretable.player) AS num_of_players
				FROM  dbo.mod_Scoretable
				GROUP BY dbo.mod_Scoretable.game
				HAVING COUNT(dbo.mod_Scoretable.player) = 2),
	S2 AS (SELECT dbo.mod_Scoretable.game AS gamingA, dbo.mod_Scoretable.player AS player_1
				FROM  dbo.mod_Scoretable),
	S3 AS (SELECT dbo.mod_Scoretable.game AS gamingB, dbo.mod_Scoretable.player AS player_2
				FROM  dbo.mod_Scoretable)
SELECT S2.player_1, S3.player_2 
FROM S1
INNER JOIN S2
ON S1.game = S2.gamingA
INNER JOIN S3
ON S1.game = S3.gamingB
WHERE S2.player_1 != S3.player_2