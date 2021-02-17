CREATE TABLE [Book] (
	BookId uniqueidentifier NOT NULL,
	Title nvarchar(255) NOT NULL,
	PageCount int NOT NULL,
	Price decimal(10,2) NOT NULL,
	CoverTypeId uniqueidentifier NOT NULL,
	PublishDate datetime NOT NULL,
	CreationDate datetime NOT NULL,
	LiteratureTypeId uniqueidentifier NOT NULL,
	PublisherId uniqueidentifier NOT NULL,
  CONSTRAINT [PK_BOOK] PRIMARY KEY CLUSTERED
  (
  [BookId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [CoverType] (
	CoverTypeId uniqueidentifier NOT NULL,
	Name nvarchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_COVERTYPE] PRIMARY KEY CLUSTERED
  (
  [CoverTypeId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Genre] (
	GenreId uniqueidentifier NOT NULL,
	Name nvarchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_GENRE] PRIMARY KEY CLUSTERED
  (
  [GenreId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [BookGenre] (
	BookGenreId uniqueidentifier NOT NULL,
	BookId uniqueidentifier NOT NULL,
	GenreId uniqueidentifier NOT NULL,
  CONSTRAINT [PK_BOOKGENRE] PRIMARY KEY CLUSTERED
  (
  [BookGenreId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Author] (
	AuthorId uniqueidentifier NOT NULL,
	FirstName nvarchar(255) NOT NULL,
	MiddleName nvarchar(255) NOT NULL,
	Surname nvarchar(255) NOT NULL,
  CONSTRAINT [PK_AUTHOR] PRIMARY KEY CLUSTERED
  (
  [AuthorId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [BookAuthor] (
	BookAuthorId uniqueidentifier NOT NULL,
	BookId uniqueidentifier NOT NULL,
	AuthorId uniqueidentifier NOT NULL,
  CONSTRAINT [PK_BOOKAUTHOR] PRIMARY KEY CLUSTERED
  (
  [BookAuthorId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Location] (
	LocationId uniqueidentifier NOT NULL,
	Name nvarchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_LOCATION] PRIMARY KEY CLUSTERED
  (
  [LocationId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [BookLoan] (
	BookLoanId uniqueidentifier NOT NULL,
	BookId uniqueidentifier NOT NULL,
	LoanId uniqueidentifier NOT NULL,
	Quantity int NOT NULL,
	Price decimal(10,2) NOT NULL,
  CONSTRAINT [PK_BOOKLOAN] PRIMARY KEY CLUSTERED
  (
  [BookLoanId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Loan] (
	LoanId uniqueidentifier NOT NULL,
	LoanNo uniqueidentifier NOT NULL UNIQUE,
	LoanDate datetime NOT NULL,
	CustomerId uniqueidentifier NOT NULL,
	LoanStatusId uniqueidentifier NOT NULL,
  CONSTRAINT [PK_LOAN] PRIMARY KEY CLUSTERED
  (
  [LoanId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Customer] (
	CustomerId uniqueidentifier NOT NULL,
	FirstName nvarchar(255) NOT NULL,
	Surname nvarchar(255) NOT NULL,
  CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED
  (
  [CustomerId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [LoanStatus] (
	LoanStatusId uniqueidentifier NOT NULL,
	Name nvarchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_LOANSTATUS] PRIMARY KEY CLUSTERED
  (
  [LoanStatusId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [LiteratureType] (
	LiteratureTypeId uniqueidentifier NOT NULL,
	Name nvarchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_LITERATURETYPE] PRIMARY KEY CLUSTERED
  (
  [LiteratureTypeId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Publisher] (
	PublisherId uniqueidentifier NOT NULL,
	Name nvarchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_PUBLISHER] PRIMARY KEY CLUSTERED
  (
  [PublisherId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [BookLocation] (
	BookLocationId uniqueidentifier NOT NULL,
	BookId uniqueidentifier NOT NULL,
	LocationId uniqueidentifier NOT NULL,
	Quantity int NOT NULL,
  CONSTRAINT [PK_BOOKLOCATION] PRIMARY KEY CLUSTERED
  (
  [BookLocationId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [Book] WITH CHECK ADD CONSTRAINT [Book_fk0] FOREIGN KEY ([CoverTypeId]) REFERENCES [CoverType]([CoverTypeId])
ON UPDATE CASCADE
GO
ALTER TABLE [Book] CHECK CONSTRAINT [Book_fk0]
GO
ALTER TABLE [Book] WITH CHECK ADD CONSTRAINT [Book_fk1] FOREIGN KEY ([LiteratureTypeId]) REFERENCES [LiteratureType]([LiteratureTypeId])
ON UPDATE CASCADE
GO
ALTER TABLE [Book] CHECK CONSTRAINT [Book_fk1]
GO
ALTER TABLE [Book] WITH CHECK ADD CONSTRAINT [Book_fk2] FOREIGN KEY ([PublisherId]) REFERENCES [Publisher]([PublisherId])
ON UPDATE CASCADE
GO
ALTER TABLE [Book] CHECK CONSTRAINT [Book_fk2]
GO



ALTER TABLE [BookGenre] WITH CHECK ADD CONSTRAINT [BookGenre_fk0] FOREIGN KEY ([BookId]) REFERENCES [Book]([BookId])
ON UPDATE CASCADE
GO
ALTER TABLE [BookGenre] CHECK CONSTRAINT [BookGenre_fk0]
GO
ALTER TABLE [BookGenre] WITH CHECK ADD CONSTRAINT [BookGenre_fk1] FOREIGN KEY ([GenreId]) REFERENCES [Genre]([GenreId])
ON UPDATE CASCADE
GO
ALTER TABLE [BookGenre] CHECK CONSTRAINT [BookGenre_fk1]
GO


ALTER TABLE [BookAuthor] WITH CHECK ADD CONSTRAINT [BookAuthor_fk0] FOREIGN KEY ([BookId]) REFERENCES [Book]([BookId])
ON UPDATE CASCADE
GO
ALTER TABLE [BookAuthor] CHECK CONSTRAINT [BookAuthor_fk0]
GO
ALTER TABLE [BookAuthor] WITH CHECK ADD CONSTRAINT [BookAuthor_fk1] FOREIGN KEY ([AuthorId]) REFERENCES [Author]([AuthorId])
ON UPDATE CASCADE
GO
ALTER TABLE [BookAuthor] CHECK CONSTRAINT [BookAuthor_fk1]
GO


ALTER TABLE [BookLoan] WITH CHECK ADD CONSTRAINT [BookLoan_fk0] FOREIGN KEY ([BookId]) REFERENCES [Book]([BookId])
ON UPDATE CASCADE
GO
ALTER TABLE [BookLoan] CHECK CONSTRAINT [BookLoan_fk0]
GO
ALTER TABLE [BookLoan] WITH CHECK ADD CONSTRAINT [BookLoan_fk1] FOREIGN KEY ([LoanId]) REFERENCES [Loan]([LoanId])
ON UPDATE CASCADE
GO
ALTER TABLE [BookLoan] CHECK CONSTRAINT [BookLoan_fk1]
GO

ALTER TABLE [Loan] WITH CHECK ADD CONSTRAINT [Loan_fk0] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId])
ON UPDATE CASCADE
GO
ALTER TABLE [Loan] CHECK CONSTRAINT [Loan_fk0]
GO
ALTER TABLE [Loan] WITH CHECK ADD CONSTRAINT [Loan_fk1] FOREIGN KEY ([LoanStatusId]) REFERENCES [LoanStatus]([LoanStatusId])
ON UPDATE CASCADE
GO
ALTER TABLE [Loan] CHECK CONSTRAINT [Loan_fk1]
GO





ALTER TABLE [BookLocation] WITH CHECK ADD CONSTRAINT [BookLocation_fk0] FOREIGN KEY ([BookId]) REFERENCES [Book]([BookId])
ON UPDATE CASCADE
GO
ALTER TABLE [BookLocation] CHECK CONSTRAINT [BookLocation_fk0]
GO
ALTER TABLE [BookLocation] WITH CHECK ADD CONSTRAINT [BookLocation_fk1] FOREIGN KEY ([LocationId]) REFERENCES [Location]([LocationId])
ON UPDATE CASCADE
GO
ALTER TABLE [BookLocation] CHECK CONSTRAINT [BookLocation_fk1]
GO

