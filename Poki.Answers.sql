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
SELECT COUNT(WordCount) 'Total Words' From Poem;

--Which poem has the fewest characters?


--How many authors are in the third grade?


--How many total authors are in the first through third grades?


--What is the total number of poems written by fourth graders?


--How many poems are there per grade?


--How many authors are in each grade? (Order your results by grade starting with 1st Grade)


--What is the title of the poem that has the most words?


--Which author(s) have the most poems? (Remember authors can have the same name.)


--How many poems have an emotion of sadness?


--How many poems are not associated with any emotion?


--Which emotion is associated with the least number of poems?


--Which grade has the largest number of poems with an emotion of joy?


--Which gender has the least number of poems with an emotion of fear?