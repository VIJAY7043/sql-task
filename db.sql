
CREATE TABLE Movie (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ReleaseYear INT,
  
);

CREATE TABLE Media (
    MediaID INT PRIMARY KEY,
    MovieID INT,
    MediaType VARCHAR(20) NOT NULL, 
    MediaURL VARCHAR(255) NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

CREATE TABLE Genre (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(50) NOT NULL
);

CREATE TABLE MovieGenre (
    MovieID INT,
    GenreID INT,
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
);

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(255) NOT NULL,
   
);

CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    MovieID INT,
    UserID INT,
    Rating DECIMAL(3, 1), -- Assuming a rating scale of 0.0 to 10.0
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
   
);


CREATE TABLE Skill (
    SkillID INT PRIMARY KEY,
    SkillName VARCHAR(50) NOT NULL
);

CREATE TABLE ArtistSkill (
    ArtistID INT,
    SkillID INT,
    PRIMARY KEY (ArtistID, SkillID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (SkillID) REFERENCES Skill(SkillID)
);

CREATE TABLE Role (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL
);

CREATE TABLE MovieArtistRole (
    MovieID INT,
    ArtistID INT,
    RoleID INT,
    PRIMARY KEY (MovieID, ArtistID, RoleID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

