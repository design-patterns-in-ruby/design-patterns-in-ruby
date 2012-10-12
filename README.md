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

The basic idea is to delegate tasks to encapsulated algorithms which are interchangable at runtime.

In the Strategy pattern we have an object (the **context**) that is trying to get something done. But to get that thing done, we need to supply the context with a second object (the **strategy**) that helps ￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼get the thing done.

1. Define a family of objects which all do the same thing (ex: format output, generate graphics etc.).
2. Ensure the family of objects share the same interface so that they are interchangable.

There are two strategies to passing data from the **context** object to the **strategy** object.  We can pass the data as paramaters when the strategy is called, or we can pass the context object as the single parameter.

If the strategies are very simple and havee only one method, we can even use code blocks for our algorithms and simply use `block.call`.  However, if multiple methods are needed, the strategies must be structured as seperate classes.

Advantages:

* algorithms are interchangable at runtime
* promotes modularity


### OBSERVER

The observer pattern is for event driven programming.

An object, called the **subject**, maintains a list of its dependents, called **observers**, and notifies them automatically of any state changes, usually by calling one of their methods.

The Ruby Standard Library includes an [Observable module](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/observer/rdoc/Observable.html) that implements this pattern.

It's also possible to use code blocks as observers.  This isn't supported by the Observable module in the Ruby Standard Library, but it's easy to implement.

There are a few additional concerns that should be addressed when working with the Observable pattern.

#### Additional Concerns

##### Push vs Pull
In the default implementation, the notification sent to the observer doens't specify which of the Subjects attributes has changed.  To find out which attribute has changed, the Observer has to check the Subjects attributes, this is the *pull* method.

Another approach would be the *push* method where the notification includes other attributes which provide the Observer with additional information like the examples below.

    observer.update(self, :salary_changed)
    observer.update(self, :salary_changed, old_salary, new_salary)


An observer may only need to know when a specific attribute of the subject changes.  The simple implementation would notify the observer when any attribute changes.

##### Atomic Event Notifications
If multiple attributes of a Subject are being updated and the updates are not independent, notifying Observers before all the updates are executed could cause an inconsistent state.

	fred = Employee.new('Fred', 'Crane Operator', 30000)
	fred.salary = 1000000
	# Warning! Inconsistent state here!
	fred.title = 'Vice President of Sales'

##### What to do When an Observer Raises an Exception 
It's also important to address what should happen when a notification causes an Observer to raise an exception. The correct way to handle exceptions will vary from case to case.


### COMPOSITE

The composite deisgn pattern is a structural pattern used to represent objects that have a hierarchical tree structure.  It allows for the uniform treatment of both individual leaf nodes and of branches composed of many nodes.

The implementation in the book is inflexible and doesn't allow Tasks to be dynamically created and doesn't allow dynamically splitting tasks into subtasks.  To subdivide a task into multiple subtasks, the class of the leaf Task must be changed to a CompositeTask before children can be added.  A better solution would be to use a single Node class for both leaves and internal nodes.  With this implementation, leaf nodes can have children added without the need to change it's class.  

For a specific implementation, you can simply inherit from the Node class and extend it with any additional functions you may need.

