IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Categories] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Countries] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NULL,
    CONSTRAINT [PK_Countries] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Pokemons] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NULL,
    [BirthDate] datetime2 NOT NULL,
    CONSTRAINT [PK_Pokemons] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Reviewers] (
    [Id] int NOT NULL IDENTITY,
    [FirstName] nvarchar(max) NULL,
    [LastName] nvarchar(max) NULL,
    CONSTRAINT [PK_Reviewers] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Owners] (
    [Id] int NOT NULL IDENTITY,
    [FirstName] nvarchar(max) NULL,
    [LastName] nvarchar(max) NULL,
    [Gym] nvarchar(max) NULL,
    [CountryId] int NULL,
    CONSTRAINT [PK_Owners] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Owners_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([Id]) ON DELETE NO ACTION
);
GO

CREATE TABLE [PokemonCategories] (
    [PokemonId] int NOT NULL,
    [CategoryId] int NOT NULL,
    CONSTRAINT [PK_PokemonCategories] PRIMARY KEY ([PokemonId], [CategoryId]),
    CONSTRAINT [FK_PokemonCategories_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Categories] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PokemonCategories_Pokemons_PokemonId] FOREIGN KEY ([PokemonId]) REFERENCES [Pokemons] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [Reviews] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NULL,
    [Text] nvarchar(max) NULL,
    [Rating] int NOT NULL,
    [ReviewerId] int NULL,
    [PokemonId] int NULL,
    CONSTRAINT [PK_Reviews] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Reviews_Pokemons_PokemonId] FOREIGN KEY ([PokemonId]) REFERENCES [Pokemons] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Reviews_Reviewers_ReviewerId] FOREIGN KEY ([ReviewerId]) REFERENCES [Reviewers] ([Id]) ON DELETE NO ACTION
);
GO

CREATE TABLE [PokemonOwners] (
    [PokemonId] int NOT NULL,
    [OwnerId] int NOT NULL,
    CONSTRAINT [PK_PokemonOwners] PRIMARY KEY ([PokemonId], [OwnerId]),
    CONSTRAINT [FK_PokemonOwners_Owners_OwnerId] FOREIGN KEY ([OwnerId]) REFERENCES [Owners] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PokemonOwners_Pokemons_PokemonId] FOREIGN KEY ([PokemonId]) REFERENCES [Pokemons] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_Owners_CountryId] ON [Owners] ([CountryId]);
GO

CREATE INDEX [IX_PokemonCategories_CategoryId] ON [PokemonCategories] ([CategoryId]);
GO

CREATE INDEX [IX_PokemonOwners_OwnerId] ON [PokemonOwners] ([OwnerId]);
GO

CREATE INDEX [IX_Reviews_PokemonId] ON [Reviews] ([PokemonId]);
GO

CREATE INDEX [IX_Reviews_ReviewerId] ON [Reviews] ([ReviewerId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20231219155950_InitialCreate', N'6.0.20');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Categories] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Countries] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NULL,
    CONSTRAINT [PK_Countries] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Pokemons] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NULL,
    [BirthDate] datetime2 NOT NULL,
    CONSTRAINT [PK_Pokemons] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Reviewers] (
    [Id] int NOT NULL IDENTITY,
    [FirstName] nvarchar(max) NULL,
    [LastName] nvarchar(max) NULL,
    CONSTRAINT [PK_Reviewers] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Owners] (
    [Id] int NOT NULL IDENTITY,
    [FirstName] nvarchar(max) NULL,
    [LastName] nvarchar(max) NULL,
    [Gym] nvarchar(max) NULL,
    [CountryId] int NULL,
    CONSTRAINT [PK_Owners] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Owners_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([Id]) ON DELETE NO ACTION
);
GO

CREATE TABLE [PokemonCategories] (
    [PokemonId] int NOT NULL,
    [CategoryId] int NOT NULL,
    CONSTRAINT [PK_PokemonCategories] PRIMARY KEY ([PokemonId], [CategoryId]),
    CONSTRAINT [FK_PokemonCategories_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Categories] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PokemonCategories_Pokemons_PokemonId] FOREIGN KEY ([PokemonId]) REFERENCES [Pokemons] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [Reviews] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NULL,
    [Text] nvarchar(max) NULL,
    [Rating] int NOT NULL,
    [ReviewerId] int NULL,
    [PokemonId] int NULL,
    CONSTRAINT [PK_Reviews] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Reviews_Pokemons_PokemonId] FOREIGN KEY ([PokemonId]) REFERENCES [Pokemons] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Reviews_Reviewers_ReviewerId] FOREIGN KEY ([ReviewerId]) REFERENCES [Reviewers] ([Id]) ON DELETE NO ACTION
);
GO

CREATE TABLE [PokemonOwners] (
    [PokemonId] int NOT NULL,
    [OwnerId] int NOT NULL,
    CONSTRAINT [PK_PokemonOwners] PRIMARY KEY ([PokemonId], [OwnerId]),
    CONSTRAINT [FK_PokemonOwners_Owners_OwnerId] FOREIGN KEY ([OwnerId]) REFERENCES [Owners] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PokemonOwners_Pokemons_PokemonId] FOREIGN KEY ([PokemonId]) REFERENCES [Pokemons] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_Owners_CountryId] ON [Owners] ([CountryId]);
GO

CREATE INDEX [IX_PokemonCategories_CategoryId] ON [PokemonCategories] ([CategoryId]);
GO

CREATE INDEX [IX_PokemonOwners_OwnerId] ON [PokemonOwners] ([OwnerId]);
GO

CREATE INDEX [IX_Reviews_PokemonId] ON [Reviews] ([PokemonId]);
GO

CREATE INDEX [IX_Reviews_ReviewerId] ON [Reviews] ([ReviewerId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20231220101617_InitialCreate1', N'6.0.20');
GO

COMMIT;
GO

