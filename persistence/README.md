# Persistence with rom-rb

## Exercises

### Setup

- [ ] Create a `persistence_exercises` local Postgres database

### Getting started, writing data

- [ ] Write a migration for an "articles" table
  - `id` primary key, `title` text, and `published` boolean columns
- [ ] Create a relation (with inferred schema)
- [ ] Create a repo for the relation
- [ ] Create some records
  - enable `create` command on repo
- [ ] Use `#by_pk` to read records back
- [ ] Update some records
  - enable `update` comand on repo using `by_pk` restriction

### Building queries

- [ ] Add methods to repository to query and return multiple records
  - [ ] listing of published articles
- [ ] Move lower-level query methods into relation
  - `#published` method in relation
  - update repository to use this method
  - create some articles where published is both true and false, ensure they're returned as appropriate
- [ ] Add methods to repository to return single records
- [ ] Create shared `articles` method in repository to ensure all query methods return only published articles
- [ ] Return results as custom structs via a custom struct namespace

### Reading aggregates

- [ ] Write a migration for an associated "authors" table
  - `id` primary key and `name` text column
  - add `author_id` foreign key to "articles" table
- [ ] Add a relation for the table and declare associations
  - declare `belongs_to :author` assocition in "articles" relation
- [ ] Create a repository for authors, with "create" command enabled
- [ ] Create author records
- [ ] Create article records with `author_id` attribute filled
- [ ] In "articles" repository, return aggregate objects including the articles' authors

## Further exploration...

### Building queries

- [ ] Return results as custom via `.as`
- [ ] Investigate using dry-struct to build custom struct classes with strict attribute types

### Testing

- [ ] Write tests for your repository methods
  - Use rom-factory to create records
  - Write tests to assert that repository methods return appropriate records

### Changesets

- [ ] Build and use a custom changeset to transform data before writing
