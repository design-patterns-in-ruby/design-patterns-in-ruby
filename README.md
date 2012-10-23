# Design Patterns in Ruby

Examples from the book **Design Patterns in Ruby** by *Russ Olsen*

This book covers 14 of the original 23 GoF design patterns.

1. [Template Method](#template_method)
2. [Strategy](#strategy)
3. [Observer](#observer)
4. [Composite](#composite)
5. [Iterator](#iterator)
6. [Commands](#commands)
7. [Adapter](#adapter)
8. [Proxy](#proxy)
9. Decorator
10. Singleton
11. Factory
12. Builder
13. Interpreter


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

<a id="template_method"></a>
### TEMPLATE METHOD
1. Create a **skeletal class** with methods that are common between algorithms.
2. Create a **subclass** for each algorithm and override the common methods from the skeletal class.

Disadvantages:

  * no runtime flexibility

---
<a id="strategy"></a>
### STRATEGY

The basic idea is to **delegate tasks to encapsulated algorithms which are interchangable at runtime**.

In the Strategy pattern we have an object (the *context*) that is trying to get something done. But to get that thing done, we need to supply the context with a second object (the *strategy*) that helps ￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼get the thing done.

1. Define a family of objects which all do the same thing (ex: format output, generate graphics etc.).
2. Ensure the family of objects share the same interface so that they are interchangable.

There are two strategies to passing data from the *context* object to the *strategy* object.  We can pass the data as paramaters when the strategy is called, or we can pass the context object as the single parameter.

If the strategies are very simple and havee only one method, we can even use code blocks for our algorithms and simply use `block.call`.  However, if multiple methods are needed, the strategies must be structured as seperate classes.

Advantages:

* algorithms are interchangable at runtime
* promotes modularity

---
<a id="observer"></a>
### OBSERVER

The observer pattern is for **event driven programming**.

An object, called the **subject**, maintains a list of its dependents, called **observers**, and notifies them automatically of any state changes, usually by calling one of their methods.

The Ruby Standard Library includes an [Observable module](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/observer/rdoc/Observable.html) that implements this pattern.

It's also possible to use code blocks as observers.  This isn't supported by the Observable module in the Ruby Standard Library, but it's easy to implement.

#### Additional Concerns
There are a few additional concerns that should be addressed when working with the Observable pattern.

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

---
<a id="composite"></a>
### COMPOSITE

The composite deisgn pattern is a structural pattern used to represent objects that have a **hierarchical tree structure**.  It allows for the uniform treatment of both individual leaf nodes and of branches composed of many nodes.

The implementation in the book is inflexible and doesn't allow Tasks to be dynamically created and doesn't allow dynamically splitting tasks into subtasks.  To subdivide a task into multiple subtasks, the class of the leaf Task must be changed to a CompositeTask before children can be added.  A better solution would be to use a single Node class for both leaves and internal nodes.  With this implementation, leaf nodes can have children added without the need to change it's class.  

For a specific implementation, you can simply inherit from the Node class and extend it with any additional functions you may need.

---
<a id="iterator"></a>
### ITERATOR

The iterator design pattern provides sequential access to elements within a container without exposing how the container actually represents the elements.  The iterator can be thought of as a moveable pointer that allows access to elements encapsulated within a container.

#### external iterator
The iteration logic is contained in a seperate class.  The iteration class can be generalized to handle multiple object types as long as they allow indexing.

External iterator require the additional class to do the actual iterating, but they do allow for greater flexibility because you can control the iteration, which elements are iterated over and in what order.

#### internal iterator
All the iterating logic occurs inside the aggregate object.
Use a code block to pass your logic into the aggregate which then calls the block for each of it's elements.

    colors = ['red', 'green', 'blue']
    colors.each { |color|
    	puts color
    }

#### Enumerable Module

Ruby includes an [Enumerator module](http://ruby-doc.org/core-1.9.3/Enumerable.html)

> The Enumerable mixin provides collection classes with several traversal and searching methods, and with the ability to sort. The class must provide a method each, which yields successive members of the collection. If Enumerable#max, #min, or #sort is used, the objects in the collection must also implement a meaningful <=> operator, as these methods rely on an ordering between members of the collection.

With custom iterator implementations, if the original collection class changes while you're iterating through it's elements, it can create unexpected results.  To remedy this, you can have the iterator operate on a copy of the oringal collection.

    class ArrayIterator
      def initialize(array)
	  	@array = Array.new(array)
      	@index = 0
	  end
	 … 

---
<a id="commands"></a>
### COMMANDS

The command pattern is a behavior design pattern used to store the information necessary to call methods at a future time.

#### Uses

##### GUI Elements
For many GUIs, you may have a generic button class that you want to use in many different situations.  In each situation, the button may need to do different things.  One appraoch would be to create a subclass for each button your interface requires, however this would lead to a excessive number of button classes.  A better approach would be to create seperate classes for the code executed when the button is clicked.  This action class can then be passed to the button telling it what the button should do when clicked.

**Seperate the thing that changes, in this case the action, from the part that stays the same, the generic button object**.  One advantage of this approach is that since the action is passed to the button, it can be changed at runtime.

The command is merely a set of actions wrapped in an object.  With ruby, we can use Procs to do the same thing without the need to create a seperate object.  This is a good option when the action is simple and doesn't require saving state information, otherwise, a command class is the better option.

##### Macro Recording
Many modern applications have the ability to undo actions, including word processors, spreadsheets and databases.  This undo feature can be implemented by using the command design pattern by keeping track what code is executed.

Another great example of macro recording using the command design pattern is the handling of migrations in Ruby on Rails.

To undo actions we need to store some state information, so we must use a command class rather than a simple Proc.

##### Queing Commands
Commands allow us to queue commands making applications more convenient for the user and for the system.

###### Installation Wizards
When installing applications, many will prompt the user with a number of installation options before starting the actual installations.  The user's choices determines which method calls are added to the installer's to-do list.  Without commands, the installation would have to stop periodically to query the user for their preferences.

###### Fixed Overhead
In some situations there is a fixed overhead to executing a certain type of command.  Queing up multiple commands and executing them together reduces the number of times we have to run the overhead code.  Database operations are an example of this.  If there isn't a persistent database connection, we have to create one each time we run database operations.  Since there is a cost to connecting to the database, a good approach may be to queue up the database operations and execute them in a batch.  The same logic holds for web applications when you need to make API calls to external applications.

---
<a id="adapter"></a>
### ADAPTER

> Convert the interface of a class into another interface clients expect. An adapter lets classes work together that could not otherwise because of incompatible interfaces.
 
http://en.wikipedia.org/wiki/Design_pattern_(computer_science)

Ruby allows for classes to be modified at runtime.  Consequently, rather than create an adapter to modify a classes API, we can simply modify the class at runtime to add or alter methods.

Alternatively, Ruby also allows the runtime modification of individual instances.  This provides a more 

Modifying instances or classes at run-time is advisable only when:

* The modifications are simple
* You understand the class you're modifying well and are sure your changes wont break things.

If either of these points aren't true, it's probably better to create a seperate adapter.

---
<a id="proxy"></a>
### PROXY

#### Types of Proxies

##### Protection Proxy
A protection proxy protects an object from unauthorized access.  To ensure methods can only be run by authorized users, we can run an authorization check before messages are passed to the underlying object.

##### Remote Proxy
Remote proxies provides access to objects which are running on remote machines.

A great example of a remote proxy is [Distributed Ruby (DRb)](http://segment7.net/projects/ruby/drb/introduction.html), which allows Ruby programs to communicate over a network. With DRb, the client machines runs a proxy which handles all of the network communications behind the scenes.

##### Virtual Proxy
Virtual proxies allow us to delay the creation of an object until it is absolutely necessary.  This is useful when creating the object is computationaly expensive.

#### Using Message Passing to Simplify Proxies
When building a proxy, we could implement a method for each method in the underlying object.  However, this leads to a lot of repeated code and tightly couples the proxy with the underlying object.  A better alternative is to pass method calls direcly to the underlying object.  Ruby includes a method that is perfect for this situation called *method_missing*.

In Ruby, when you call a method on an object, Ruby looks for the method in the initial object and it's modules and then works it's way up the stack to that objects superclass and then it's superclass and so on.  If the method is not found, Ruby then looks for the method *method_missing* in the initial object, then it's parent, and it's parent… etc.

Rather than implement each of the underlying objects methods in the proxy, we can use *method_missing* to simply pass method calls to the unerlying object.

Again, this has to big advantages:

1. The proxy is greatly simplified by having far fewer methods
2. The proxy is not coupled to the underlying object and can therefore be reused for multiple object classes.

