#Jonathan Tahod
#Lab 1 (Section 9 & 10)

#List the first name, last name, and region of all members from Virginia who either have a work phone or an email address.
#List the artist name and web address of any artists who has a web address. Rename the attributes artistname, webaddress as Artist Name, Web Address.
#List the TitleID, TrackNum, and TrackTitle of all tracks with 'Song' at the beginning of the TrackTitle
#Report the total time in minutes of all tracks with length greater than 150.
#List the number of tracks, total length in seconds and the average length in seconds of all tracks with titleID 4.
#Report the number of male members who are in US.
#Report the number of members by state and gender. Sort the results by the region
#For each kind of LeadSource, report the number of artists who came in to the system through that lead source, the earliest EntryDate, and the most recent EntryDate.
#Report the TitleID and number of tracks for any TitleID with fewer than nine tracks.
#Report the titleid, average, shortest and longest track length in minutes of all tracks for each titleid with average length greater than 300. Use proper column alias.





SELECT FirstName,LastName, Region 
FROM Members
WHERE Region='VA' AND
(Email IS NOT NULL OR WorkPhone IS NOT NULL);

SELECT ArtistName AS "Artist Name", WebAddress AS "Web Address"
FROM Artists
WHERE WebAddress IS NOT NULL;
 
SELECT TitleId AS 'TitleID',TrackNum AS 'TrackNum',TrackTitle AS 'TrackTitle'
FROM Tracks
 WHERE TrackTitle LIKE 'Song%';

 
SELECT Sum(lengthseconds)/60  AS 'Total Time'
FROM Tracks
WHERE lengthseconds > 150;
    
 SELECT Count(*) AS 'Average',Sum(lengthseconds)'Number of Tracks',Avg(lengthseconds)'Total Length'
 FROM Tracks
 WHERE titleID = 4;
 
 SELECT Count(*) AS 'Number of Males in US'
 FROM Members
 WHERE Gender='M' and Country = 'USA';
  
  
    
SELECT Count(*) AS 'Number of Members', Gender,Region
 FROM Members
  GROUP BY Region,Gender;
    
SELECT leadsource,Count(*) AS 'Number Of Artists', Min(entrydate) AS 'Earliest Date', Max(entrydate) AS 'Latest Date'
FROM Artists
GROUP BY leadsource;
     

SELECT  titleid, Avg(lengthseconds)/60 AS Average, Min(lengthseconds)/60 AS Shortest, Max(lengthseconds)/60 AS Longest
FROM Tracks
GROUP BY    titleid
HAVING        Avg(lengthseconds) > 300;

	
SELECT TitleID AS 'TitleID', Count(*)AS 'Number of Tracks'
 FROM Tracks
 GROUP BY TitleID
 HAVING Count(*) < 9; 