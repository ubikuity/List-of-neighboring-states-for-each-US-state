List-of-neighboring-states-for-each-US-state
============================================

I was searching for a list of neighboring/bordering/adjacent states for each USA state.

I asked on StackOverflow but I had no luck: [http://stackoverflow.com/questions/12402673/get-the-neighboring-states-of-a-given-usa-state](http://stackoverflow.com/questions/12402673/get-the-neighboring-states-of-a-given-usa-state)

I wasn't able to find any [open data](http://en.wikipedia.org/wiki/Open_data).

So, I finally decided to create my own list using the following sources:

- [http://theincidentaleconomist.com/wordpress/list-of-neighboring-states-with-stata-code/](http://theincidentaleconomist.com/wordpress/list-of-neighboring-states-with-stata-code/)
- [http://www.john.geek.nz/2009/01/sql-tips-list-of-us-states/](http://www.john.geek.nz/2009/01/sql-tips-list-of-us-states/)
- [http://askville.amazon.com/Trivia-state-bordered-states/AnswerViewer.do?requestId=3941039](http://theincidentaleconomist.com/wordpress/list-of-neighboring-states-with-stata-code/)

=> Feel free to verify, contribute and reuse my file: neighbors-states.csv

**Notes**:

- The SQL script was created for SQL Server 2008.

**Possible improvements:**

- Add a column called "IsApproximativeNeighbor" in the table "NeighborStates" to define properly the relation between Alaska and Washington state even if there is no common border.

**Off topic:**

- At first, I wanted to use MySQL but I discovered that MySQL constraint implementation still is incomplete: "the CHECK clause is parsed but ignored by all storage engines". See [http://bugs.mysql.com/bug.php?id=3464](http://bugs.mysql.com/bug.php?id=3464) and [http://dev.mysql.com/doc/refman/5.1/en/create-table.html](http://dev.mysql.com/doc/refman/5.1/en/create-table.html).

- Maybe some of you remember the song from this cartoon: [Animaniacs video of Wakko's famous 50 State Capitols song](http://www.youtube.com/watch?v=sNUDDaEOvuY).

- By the way, I never been to the USA and this list gave some motivation to visit USA!