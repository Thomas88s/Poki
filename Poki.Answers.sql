--What grades are stored in the database?
SELECT * FROM Grade; 

--What emotions may be associated with a poem?
SELECT * FROM Emotion;

--How many poems are in the database?
SELECT COUNT(Poem.Id) FROM Poem;

--Sort authors alphabetically by name. What are the names of the top 76 authors?
SELECT TOP 76 Author.Name FROM Author ORDER BY Author.Name ASC;

--Starting with the above query, add the grade of each of the authors.
SELECT DISTINCT TOP 76 Author.Name, Grade.Name FROM Author JOIN Grade ON Author.GradeId = Grade.Id ORDER BY Author.Name ASC;

--Starting with the above query, add the recorded gender of each of the authors.
SELECT DISTINCT TOP 76 Author.Name, Grade.Name, Gender.Name FROM Author JOIN Grade ON Author.GradeId = Grade.Id JOIN Gender ON Author.GenderId = Gender.Id ORDER BY Author.Name ASC;

--What is the total number of words in all poems in the database?
SELECT COUNT(WordCount) 'Total Words' From Poem GROUP BY Poem.Title ORDER BY 'T';

--Which poem has the fewest characters?
SELECT TOP 1 Poem.Title, Count(CharCount) 'Number Of Characters' FROM Poem GROUP BY Poem.Title ORDER BY 'Number of Characters' ASC;

--How many authors are in the third grade?
SELECT COUNT(Id) FROM Author WHERE GradeId = 3;

--How many total authors are in the first through third grades?
SELECT COUNT(Id) FROM Author GROUP BY GradeId HAVING GradeId <= 3;

--What is the total number of poems written by fourth graders?
SELECT COUNT(Poem.Id) FROM Poem JOIN Author ON AuthorId  = Author.Id JOIN Grade ON Author.GradeId = Grade.Id WHERE GradeId = 4;

--How many poems are there per grade?
SELECT COUNT(Poem.Id) FROM Poem JOIN Author ON AuthorId  = Author.Id JOIN Grade ON Author.GradeId = Grade.Id GROUP BY Grade.Name;

--How many authors are in each grade? (Order your results by grade starting with 1st Grade)
SELECT COUNT(Author.Id) 'Number of Authors' FROM Author JOIN Grade ON Author.GradeId = Grade.Id GROUP BY Grade.Name;

--What is the title of the poem that has the most words?
SELECT TOP 1 Poem.Title, COUNT(WordCount) 'Number Of Words' FROM Emotion LEFT JOIN PoemEmotion  ON Emotion.ID = PoemEmotion.EmotionId LEFT JOIN Poem  ON PoemEmotion.PoemID = Poem.ID GROUP BY Poem.Title ORDER BY 'Number Of Words';


--Which author(s) have the most poems? (Remember authors can have the same name.)
SELECT Author.ID, Author.Name, COUNT(*) 'Number of Poems' FROM Author JOIN Poem ON Poem.AuthorId = Author.Id GROUP BY Author.Id, Author.Name ORDER BY 'Number of Poems' DESC;

--How many poems have an emotion of sadness?
SELECT COUNT(Poem.Id) FROM Poem JOIN PoemEmotion ON Poem.Id = PoemEmotion.PoemId JOIN Emotion ON Emotion.Id = EmotionId WHERE Emotion.Name = 'sadness';

--How many poems are not associated with any emotion?
SELECT COUNT(Poem.Id) FROM Poem JOIN PoemEmotion ON Poem.Id = PoemEmotion.PoemId JOIN Emotion ON Emotion.Id = EmotionId WHERE Emotion.Id = NULL;

--Which emotion is associated with the least number of poems?
SELECT TOP 1 Emotion.Name, COUNT(*) 'Number of Poems' FROM Emotion JOIN PoemEmotion ON Emotion.Id = EmotionId JOIN Poem ON Poem.Id = PoemEmotion.PoemId GROUP BY Emotion.Name ORDER BY 'Number Of Poems' ASC;

--Which grade has the largest number of poems with an emotion of joy?
SELECT TOP 1 Grade.Name, COUNT(Poem.id) 'number of poems' FROM Poem JOIN PoemEmotion on Poem.Id = PoemEmotion.PoemId JOIN Emotion on Emotion.Id = PoemEmotion.EmotionId JOIN Author on Poem.AuthorId = Author.Id JOIN Grade on Grade.Id = Author.GradeId WHERE Emotion.Name = 'joy' GROUP BY Grade.Name ORDER BY 'number of poems' DESC;

--Which gender has the least number of poems with an emotion of fear?