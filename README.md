# Design Patterns in Ruby

Examples from the book **Design Patterns in Ruby** by *Russ Olsen*

This book covers 14 of the original 23 GoF design patterns.

## Five Main Points

1. Separate the things that change from the things that stay the same.
    * promotes DRY code
    * improves maintainability

2.  Program to an interface, not an implementation.

    Code should belong to the most general object possible, and specific classes should inherit from the general class.
    * increases modularity

3. Prefer composition over inheritance
   
   Avoid saying that an object is a kind of something and instead say that it has something.  In other words, it's often better to reference other classes or modules than to put functionality in superclasses.
    * increases encapsulation
    * increases modularity, implementations can be easily swapped

4. delegate, delegate, delegate
  Let other classes handle functionality within their domain

5. You ain't gonna need it (Russ Olsen's addition)
  
   Don't implement features or design in flexibility that you don't immediately need because you will probably never need it.

----------------------------------------------------------------

## Design Patterns

### TEMPLATE METHOD
1. Create a **skeletal class** with methods that are common between algorithms.
2. Create a **subclass** for each algorithm and override the common methods from the skeletal class.

Disadvantages:

  * no runtime flexibility


### STRATEGY

In the Strategy pattern we have an object (the **context**) that is trying to get something done. But to get that thing done, we need to supply the context with a second object (the **strategy**) that helps ￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼get the thing done.

The basic idea is to delegate tasks to encapsulated algorithms which are interchangable at runtime.

1. Define a family of objects which all do the same thing (ex: format output, generate graphics etc.).
2. Ensure the family of objects share the same interface so that they are interchangable.

There are two strategies to passing data from the **context** object to the **strategy** object.  We can pass the data as paramaters when the strategy is called, or we can pass the context object as the single parameter.

If the strategies are very simple and havee only one method, we can even use code blocks for our algorithms and simply use `block.call`.  However, if multiple methods are needed, the strategies must be structured as seperate classes.

Advantages:

* algorithms are interchangable at runtime
* promotes modularity
