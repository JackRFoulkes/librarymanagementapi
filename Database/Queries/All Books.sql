SELECT 
Book.BookId, 
Title [Book Title], 
CoverType.[Name] [Cover Type], 
LiteratureType.[Name] [Literature Type], 
Publisher.[Name] [Publisher], 

(
	SELECT STRING_AGG(Author.FirstName + ' ' + Author.MiddleName + ' ' + Author.Surname, ', ')
	FROM BookAuthor
	INNER JOIN Author
		ON Author.AuthorId = BookAuthor.AuthorId
	WHERE BookAuthor.BookId = Book.BookId
) AS [Authors],

(
	SELECT STRING_AGG(Genre.[Name], ', ')
	FROM BookGenre
	INNER JOIN Genre
		ON Genre.GenreId = BookGenre.GenreId
	WHERE BookGenre.BookId = Book.BookId
) AS [Genres],

(
	SELECT STRING_AGG([Location].[Name] + ' (' + CAST(Quantity AS NVARCHAR(10)) + ')', ', ')
	FROM BookLocation
	INNER JOIN [Location]
		ON [Location].LocationId = BookLocation.LocationId
	WHERE BookLocation.BookId = Book.BookId
) AS [Locations]

FROM Book
INNER JOIN CoverType
	ON CoverType.CoverTypeId = Book.CoverTypeId
INNER JOIN LiteratureType
	ON LiteratureType.LiteratureTypeId = Book.LiteratureTypeId
INNER JOIN Publisher
	ON Publisher.PublisherId = Book.PublisherId