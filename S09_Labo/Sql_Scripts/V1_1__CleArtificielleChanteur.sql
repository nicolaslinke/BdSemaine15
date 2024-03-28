
	-- Nouvelle colonne pour la PK de type int IDENTITY et la FK
	ALTER TABLE Musique.Chanteur
	ADD ChanteurID int IDENTITY(1,1)
	GO

	ALTER TABLE Musique.Chanson
	ADD ChanteurID int NULL
	GO
	
	-- Supprimer les anciennes contraintes FK puis PK (attention, l'ordre de suppression est important ici)
	ALTER TABLE Musique.Chanson
	DROP CONSTRAINT FK_Chanson_NomChanteur;

	ALTER TABLE Musique.Chanteur
	DROP CONSTRAINT PK_Chanteur_Nom;

	
	-- Nouvelles contraintes PK puis FK
	ALTER TABLE Musique.Chanteur
	ADD CONSTRAINT PK_Chanteur_ChanteurID PRIMARY KEY (ChanteurID)
	GO

	ALTER TABLE Musique.Chanson ADD CONSTRAINT FK_Chanson_ChanteurID
	FOREIGN KEY (ChanteurID) REFERENCES Musique.Chanteur(ChanteurID)
	ON DELETE CASCADE;
	GO

	
	-- Remplir la nouvelle colonne FK et faire en sorte que le nouveau champ ChanteurID n'est pas null
	UPDATE Musique.Chanson
	SET ChanteurID = (Select C.ChanteurID FROM Musique.Chanteur C WHERE C.Nom = NomChanteur)
	GO


	ALTER TABLE Musique.Chanson
	ALTER COLUMN
	ChanteurID int NOT NULL;
	GO
	
	-- Supprimer l'ancienne colonne FK de Musique.Chanson (On veut garder le nom des chanteurs, donc on ne supprime pas l'ancienne PK !)
	ALTER TABLE Musique.Chanson
	DROP COLUMN NomChanteur
	GO


	