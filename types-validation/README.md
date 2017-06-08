# Types & Validation

## Exercises

### Types

- [ ] Make a strict string enum type called `ArticleStatus`
- [ ] Test this with both passing and failing values

### Structs

- [ ] Make an `Article` struct class with the following atributes
  - `title` (strict string)
  - `status` (`ArticleStatus` strict string enum)
  - `published_at` (optional time)
- [ ] Try initializing an article with valid and invalid values

### Validation

- [ ] Write a form schema to validate input to match the `Article` struct attributes
- [ ] Add a high-level rule to validate that `published_at` is filled only when `status` is set to "published"

### In practice

- Think of some examples of where and how these would have helped in your own applications:
  - [ ] Types
  - [ ] Typed structs or value objects
  - [ ] Standalone validation schemas

## Further exploration...

### Types

- [ ] Type with default
- [ ] Constrained type using predicates
- [ ] Type with custom constructor

### Structs

- [ ] Write unit tests for a struct class of your own

### Validation

- [ ] Use a custom predicate (with custom error message)
- [ ] Write a schema for nested data
- [ ] Write a high-level validation block
- [ ] Write unit tests for a schema
