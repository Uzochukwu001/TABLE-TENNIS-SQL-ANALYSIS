# TABLE-TENNIS SQL ANALYSIS



## Exploratory Data Analysis of a mod table tennis data using SQL.




This is a challenge to create a mod dataset and explore it using SQL queries. 


The challenge tasks can be found in the appended pdf file and the utilised codes for exploration can be found in the .sql file attached. 


Each task was spotlighted below with its appropriate image and the following data exploration steps were conducted using MS SQL Server:



- Creation of the mod tables with the right column namings in an appropriate schema. The relationship among the three tables was modelled using the 'manage relationship' tab on the Tools bar; on their respective PKs and FKs.

- Insertion of the different datapoints into the right tables and format. (N.B: Copy the codes from the .sql file attached to insert the required dataset).

- Show the average score of each player, even if they didn't play any games. Expected output (Player ID, Name, Average score) 



![Screenshot (93)](https://user-images.githubusercontent.com/112668327/201498856-6188cfdc-561d-4fc5-abab-eebfe9628bda.png)



- The score table is corrupted: a game can only have two players (not more, not less). Write a query that identifies and only shows the valid games and their winner. Expected output (Game,Winner). As an additional challenge, you can also display the winner's score. The condition described above should still apply. (Expected output (Game, Winner, Winner Score)



![Screenshot (95)](https://user-images.githubusercontent.com/112668327/201498980-067321ff-c56b-4c71-8262-741b8bec80d9.png)


- Show the score of player 'Phil Watertank' for games that he lost. Expected output (Game ID, Player Name, Player Lastname, Score).



![Screenshot (97)](https://user-images.githubusercontent.com/112668327/201499093-89333143-b053-4cf8-bb16-40c0101e4ecf.png)



- The following two queries return the same result. Why and what is the difference?

	QUERY I: 
			SELECT * FROM dbo.Playertable
			LEFT JOIN dbo.mod_Scoretable on dbo.mod_Scoretable.Player = dbo.Playertable.ID
			WHERE dbo.mod_Scoretable.Player IS NOT NULL

	QUERY II:
			SELECT * FROM dbo.Playertable
			RIGHT JOIN dbo.mod_Scoretable on dbo.mod_Scoretable.Player = dbo.Playertable.ID 
			WHERE dbo.mod_Scoretable.Player IS NOT NULL; 
			
### ANSWERS TO THE QUESTIONS.

 The two queries are similar because the adjoining column and the specified constraints in both queries are similar which didn't have much effect as it was only a reorder statement.

 The first Query returns all records on the player table joined together with the matching key values on the score table, eliminating the rows where the score.player's column is empty (which was inexistent) WHILE 
 The Query II returns all records on the score table joined together with the matching key values on the player table, eliminating the rows where the score.player's column is empty(which was inexistent).
 
 
 - The following two queries return the players which have not played any games. In your opinion, which one is the best and why? Discuss. 

	QUERY I:
			SELECT DISTINCT dbo.Playertable.id, dbo.Playertable.firstname, dbo.Playertable.lastname FROM dbo.Playertable
			LEFT JOIN dbo.mod_Scoretable on dbo.mod_Scoretable.player = dbo.Playertable.id
			WHERE dbo.mod_Scoretable.player IS NULL

	QUERY II:
			SELECT dbo.Playertable.id, dbo.Playertable.firstname, dbo.Playertable.lastname FROM dbo.Playertable
			WHERE dbo.Playertable.id NOT IN (SELECT DISTINCT dbo.mod_Scoretable.player FROM dbo.mod_Scoretable)

### ANSWER TO THE QUESTIONS.

 The second query which implements a subquery,is not just simple in structure, but is better as it requires lesser resources to achieve optimum query performance than joins.


- Show the list of player combinations who have never played together. Expected output (Player 1, Player 2). Reverse duplicates are authorized (A-E and E-A for example)


