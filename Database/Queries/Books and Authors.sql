SELECT Book.Title, STRING_AGG(Author.FirstName + ' ' + Author.MiddleName + ' ' + Author.Surname, ', ') AS Author FROM Book
LEFT JOIN BookAuthor
	ON BookAuthor.BookId = Book.BookId
INNER JOIN Author
	ON Author.AuthorId = BookAuthor.AuthorId
GROUP BY Book.Title