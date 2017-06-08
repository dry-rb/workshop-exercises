# Roda

## Exercises

- [ ] Create a Roda app with a single "r.root" route
- [ ] Run the app with `rackup`
- Try each of the following types of routes:
  - [ ] root
  - [ ] GET
  - [ ] POST
  - [ ] routes with multiple nested routes
  - [ ] routes with dynamic parameters
- Try all of the following responses:
  - [ ] HTML response
  - [ ] JSON response
  - [ ] Redirect

# Views

## Exercises

- [ ] Create a view controller, layout, and template (no exposures yet)
- [ ] Use a partial to render some extra "sidebar" content
- [ ] Write a unit test for the view's rendered contents
- [ ] Create a dummy "repo" object returning an article for a given slug
- [ ] Inject repo into the view controller
- [ ] Write an exposure to pass an article to the view for a given slug
- [ ] Display the article in the view
- [ ] Provide a context object with a dummy `asset` helper
- [ ] Use the `asset` helper in "sidebar" partial to display a site logo image
- [ ] Write a custom view part to add view-specific behavior to the article (like an article "banner photo" div that falls back to a default)
- [ ] Update your unit test to reflect the view controller working with the injected repo



# Building a dry-web-roda app

We'll be building a simple blog application with dry-web-roda, rom-rb, and the rest of the dry-rb stack.

As a class, we'll work through 4 tasks together:

1. Create a new dry-web-roda app and explore its setup
2. Show a list of articles on the home page
3. Show an article and list of comments
4. Allow readers to add new comments on an article

## Features

- Home page with paginated list of articles
- Article page
- Admin area (no authentication yet)
  - Articles index
  - Create article
  - Edit article
  - Delete article
