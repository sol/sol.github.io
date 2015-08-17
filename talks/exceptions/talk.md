# Exceptions Considered Harmful

```haskell
*** Exception: something bad happened
```

OK, something bad happened, good to know, but still, some information is
missing here.

 * I know that something bad happened, but I have no idea where it happened

 * I know that an Exception occurred, but I have not the slightest idea what
   type of exception I'm dealing with

## Other issues with exceptions

 * Looking at the type of an exception tells me nothing about where this
   exception sits in the exception hierarchy

 * A user can't extend the exception tree at leaves

 * Exception / Java Error / AsyncException discrepancy

## Or in other words

 1. No location info
 2. Having SomeException, you can't get it's type (only unwrapping the first
    level is possible)
 3. Looking at the type of a specific exception does not tell you where it sits
    in the tree
 4. Users can't extend the tree at leaves
 5. `AsyncException`s sit in the same subtree as other exceptions
