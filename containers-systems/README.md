# Containers & systems

## Exercises

- [ ] Create and configure a dry-system container
- [ ] Create a `Comments::Create` class and access it via the container
- [ ] Create a `Persistence::CommentsRepo` class and access it via the container
- [ ] Configure the container's injector to allow the comments repo to be auto
- [ ] Investigate the behavior of a non-finalized container
  - Comment out the code that finalizes the container
  - Inspect the container's registrations (`Container.keys`)
  - Initialize a `Comments::Create` object directly
  - Innspect the container's registrations again

## Further exploration...

- [ ] Take your functional objects [from the previous exercise](/functional-objects/) and make them work with auto-injection using dry-system
- [ ] Update your tests
- [ ] Use dry-transaction to combine the `ImportArticles` operation with another operation to send an email notification once the import completes
- [ ] Add a bootable component to configure the email notification object with email addresses
