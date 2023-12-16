# Design Patterns in Ruby
updated to work with **ruby 2.2.0**

Examples from the book **Design Patterns in Ruby** by *Russ Olsen*

This book covers 14 of the original 23 GoF design patterns.

* [Template Method](#template-method)
* [Strategy](#strategy)
* [Observer](#observer)
* [Composite](#composite)
* [Iterator](#iterator)
* [Commands](#commands)
* [Mediator](#mediator)
* [Adapter](#adapter)
* [Proxy](#proxy)
* [Decorator](#decorator)
* [Singleton](#singleton)
* [Factory](#factory)
* [Abstract Factory](#abstract-factory)
* [Builder](#builder)
* [Interpreter](#interpreter)

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

4. Delegate, delegate, delegate
  
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

---
### STRATEGY

The basic idea is to **delegate tasks to encapsulated algorithms which are interchangable at runtime**.

In the Strategy pattern we have an object (the *context*) that is trying to get something done. But to get that thing done, we need to supply the context with a second object, called the *strategy*, that helps ￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼get the thing done.

1. Define a family of objects which all do the same thing (ex: format output, generate graphics etc.).
2. Ensure the family of objects share the same interface so that they are interchangable.

There are two strategies to passing data from the *context* object to the *strategy* object.  We can pass the data as parameters when the strategy is called, or we can pass the context object as the single parameter.

If the strategies are very simple and have only one method, we can even use code blocks for our algorithms and simply use `block.call`.  However, if multiple methods are needed, the strategies must be structured as separate classes.

Advantages:

* algorithms are interchangable at runtime
* promotes modularity

---
### OBSERVER

The observer pattern is for **event driven programming**.

An object, called the **subject**, maintains a list of its dependents, called **observers**, and notifies them automatically of any state changes, usually by calling one of their methods.

The Ruby Standard Library includes an [Observable module](http://ruby-doc.org/stdlib/libdoc/observer/rdoc/Observable.html) that implements this pattern.

It's also possible to use code blocks as observers.  This isn't supported by the Observable module in the Ruby Standard Library, but it's easy to implement.

#### Additional Concerns
There are a few additional concerns that should be addressed when working with the Observable pattern.

##### Push vs Pull
In the default implementation, the notification sent to the observer doesn't specify which of the Subjects attributes has changed.  To find out which attribute has changed, the Observer has to check the Subjects attributes, this is the *pull* method.

Another approach would be the *push* method where the notification includes other attributes which provide the Observer with additional information like the examples below.

````ruby
observer.update(self, :salary_changed)
observer.update(self, :salary_changed, old_salary, new_salary)
````

An observer may only need to know when a specific attribute of the subject changes.  The simple implementation would notify the observer when any attribute changes.

##### Atomic Event Notifications
If multiple attributes of a Subject are being updated and the updates are not independent, notifying Observers before all the updates are executed could cause an inconsistent state.

````ruby
fred = Employee.new('Fred', 'Crane Operator', 30000)
fred.salary = 1000000
# Warning! Inconsistent state here!
fred.title = 'Vice President of Sales'
````

##### What to do When an Observer Raises an Exception
It's also important to address what should happen when a notification causes an Observer to raise an exception. The correct way to handle exceptions will vary from case to case.

---
### COMPOSITE

The composite design pattern is a structural pattern used to represent objects that have a **hierarchical tree structure**.  It allows for the uniform treatment of both individual leaf nodes and of branches composed of many nodes.

The implementation in the book is inflexible and doesn't allow Tasks to be dynamically created and doesn't allow dynamically splitting tasks into subtasks.  To subdivide a task into multiple subtasks, the class of the leaf Task must be changed to a CompositeTask before children can be added.  A better solution would be to use a single Node class for both leaves and internal nodes.  With this implementation, leaf nodes can have children added without the need to change it's class.

For a specific implementation, you can simply inherit from the Node class and extend it with any additional functions you may need.

---
### ITERATOR

The iterator design pattern provides sequential access to elements within a container without exposing how the container actually represents the elements.  The iterator can be thought of as a moveable pointer that allows access to elements encapsulated within a container.

#### external iterator
The iteration logic is contained in a separate class.  The iteration class can be generalized to handle multiple object types as long as they allow indexing.

External iterator require the additional class to do the actual iterating, but they do allow for greater flexibility because you can control the iteration, which elements are iterated over and in what order.

#### internal iterator
All the iterating logic occurs inside the aggregate object.
Use a code block to pass your logic into the aggregate which then calls the block for each of it's elements.

````ruby
colors = ['red', 'green', 'blue']
colors.each { |color| puts color }
````

#### Enumerable Module

Ruby includes an [Enumerator module](http://ruby-doc.org/core/Enumerable.html)

> The Enumerable mixin provides collection classes with several traversal and searching methods, and with the ability to sort. The class must provide a method each, which yields successive members of the collection. If Enumerable#max, #min, or #sort is used, the objects in the collection must also implement a meaningful <=> operator, as these methods rely on an ordering between members of the collection.

With custom iterator implementations, if the original collection class changes while you're iterating through it's elements, it can create unexpected results.  To remedy this, you can have the iterator operate on a copy of the original collection.

````ruby
class ArrayIterator
  def initialize(array)
  	@array = Array.new(array)
  	@index = 0
  end
  …
````

---
### COMMANDS

The command pattern is a behavior design pattern used to store the information necessary to call methods at a future time.

#### Uses

##### GUI Elements
For many GUIs, you may have a generic button class that you want to use in many different situations.  In each situation, the button may need to do different things.  One approach would be to create a subclass for each button your interface requires, however this would lead to a excessive number of button classes.  A better approach would be to create separate classes for the code executed when the button is clicked.  This action class can then be passed to the button telling it what the button should do when clicked.

**separate the thing that changes, in this case the action, from the part that stays the same, the generic button object**.  One advantage of this approach is that since the action is passed to the button, it can be changed at runtime.

The command is merely a set of actions wrapped in an object.  With ruby, we can use Procs to do the same thing without the need to create a separate object.  This is a good option when the action is simple and doesn't require saving state information, otherwise, a command class is the better option.

##### Macro Recording
Many modern applications have the ability to undo actions, including word processors, spreadsheets and databases.  This undo feature can be implemented by using the command design pattern by keeping track what code is executed.

Another great example of macro recording using the command design pattern is the handling of migrations in Ruby on Rails.

To undo actions we need to store some state information, so we must use a command class rather than a simple Proc.

##### Queuing Commands
Commands allow us to queue commands making applications more convenient for the user and for the system.

###### Installation Wizards
When installing applications, many will prompt the user with a number of installation options before starting the actual installations.  The user's choices determines which method calls are added to the installer's to-do list.  Without commands, the installation would have to stop periodically to query the user for their preferences.

###### Fixed Overhead
In some situations there is a fixed overhead to executing a certain type of command.  Queuing up multiple commands and executing them together reduces the number of times we have to run the overhead code.  Database operations are an example of this.  If there isn't a persistent database connection, we have to create one each time we run database operations.  Since there is a cost to connecting to the database, a good approach may be to queue up the database operations and execute them in a batch.  The same logic holds for web applications when you need to make API calls to external applications.


### MEDIATOR
The Mediator pattern promotes a "many-to-many relationship network" to "full object status". Modelling the inter-relationships with an object enhances encapsulation, and allows the behavior of those inter-relationships to be modified or extended through subclassing.

The Mediator defines the interface for communication between Colleague objects. The ConcreteMediator implements the Mediator interface and coordinates communication between Colleague objects. It is aware of all the Colleagues and their purpose with regards to inter communication.The ConcreteColleague communicates with other colleagues through the mediator.

Without this pattern, all of the Colleagues would know about each other, leading to high coupling. By having all colleagues communicate through one central point we have a decoupled system while maintaining control on the object's interactions.

---
### ADAPTER

> Convert the interface of a class into another interface clients expect. An adapter lets classes work together that could not otherwise because of incompatible interfaces.

http://en.wikipedia.org/wiki/Design_pattern_(computer_science)

Ruby allows for classes to be modified at runtime.  Consequently, rather than create an adapter to modify a classes API, we can simply modify the class at runtime to add or alter methods.

Alternatively, Ruby also allows the runtime modification of individual instances.

Modifying instances or classes at run-time is advisable only when:

* The modifications are simple
* You understand the class you're modifying well and are sure your changes wont break things.

If either of these points aren't true, it's probably better to create a separate adapter.

---
### PROXY

#### Types of Proxies

##### Protection Proxy
A protection proxy protects an object from unauthorized access.  To ensure methods can only be run by authorized users, we can run an authorization check before messages are passed to the underlying object.

##### Remote Proxy
Remote proxies provides access to objects which are running on remote machines.

A great example of a remote proxy is [Distributed Ruby (DRb)](http://ruby-doc.org/stdlib/libdoc/drb/rdoc/DRb.html), which allows Ruby programs to communicate over a network. With DRb, the client machines runs a proxy which handles all of the network communications behind the scenes.

##### Virtual Proxy
Virtual proxies allow us to delay the creation of an object until it is absolutely necessary.  This is useful when creating the object is computationaly expensive.

#### Using Message Passing to Simplify Proxies
When building a proxy, we could implement a method for each method in the underlying object.  However, this leads to a lot of repeated code and tightly couples the proxy with the underlying object.  A better alternative is to pass method calls direcly to the underlying object.  Ruby includes a method that is perfect for this situation called *method_missing*.

In Ruby, when you call a method on an object, Ruby looks for the method in the initial object and it's modules and then works it's way up the stack to that objects superclass and then it's superclass and so on.  If the method is not found, Ruby then looks for the method *method_missing* in the initial object, then it's parent, and it's parent… etc.

Rather than implement each of the underlying objects methods in the proxy, we can use *method_missing* to simply pass method calls to the underlying object.

Again, this has to big advantages:

1. The proxy is greatly simplified by having far fewer methods
2. The proxy is not coupled to the underlying object and can therefore be reused for multiple object classes.

---
### DECORATOR

The decorator design pattern allows for features to be added dynamically to an existing object.

[Motivation](http://en.wikipedia.org/wiki/Decorator_pattern#Motivation) via wikipedia

With Ruby, the easiest way to use the decorator pattern is to create a module for each decorator. The decorators that you want to use can be dynamically added to an instance using `extend`.

Ruby includes a [`forwardable` module](http://ruby-doc.org/stdlib/libdoc/forwardable/rdoc/Forwardable.html) that provides an easy way to add delegation methods. `forwardable` may allow you to create cleaner more readable code, it really depends on the situation.

#### Dynamic Alternatives

Ruby allows for dynamically modifying instances. We can use to this feature to add decorators at run-time.

This is a quick and dirty approach to adding decorators to an instance. Create an alias for the original method, then add a module with the same name as the original method.  This is shown below:

````ruby
w = SimpleWriter.new('out')

class << w
  alias old_write_line write_line

  def write_line(line)
    old_write_line("#{Time.new}: #{line}")
  end
end
````

For the `w` instance of `SimpleWriter`, the original `write_line` method still exists and is pointed to by `old_write_line`.  Now, when `write_line` is called, the new method is executed and it then executes `old_write_line`.


disadvantage of using extend with modules:
- can't easily remove modules

---
### SINGLETON

The singleton pattern is used to ensure that there is only one instance of a class and provides global access to that instance.

This pattern is useful when you want one instance of a class and many different objects need to access it, rather than pass the object around, we can make the object global.

GoF: Let the class of the singleton object manage the creation and access to its sole instance.

The Ruby standard library includes a [Singleton module](http://ruby-doc.org/stdlib/libdoc/singleton/rdoc/Singleton.html).

The `singleton module` is thorough, it overrides multiple methods to prevent multiple instances of the singleton class. It also uses lazy instantiation, creating the instance only once the `instance` method is called.

#### Alternatives

##### Global Variables
As an alternative, it is possible to use global variables to store singletons. There can be only one instance of a global variable and by definition they are globally accessible.

Disadvantages:

* Global variables can be reassigned at any time.
* Lazy instantiation isn't possible.

##### Constants
Since we can use global variables to hold singletons, it follows that we can also use constants.

Disadvantages:

* Constant variables can be reassigned at any time. A warning is returned when they are changed but they are still changed.
* Lazy instantiation isn't possible.
* We can't prevent the creation of more than one instance of the singleton class.

##### Classes as Singletons
Disadvantages:

* Using a class to hold all the variables and methods doesn't follow traditional coding conventions.

Advantages:

* There can be only one class of a given name and therefore only one instance of the singleton.

##### Modules as Singletons
The code is exactly the same as using a class as a singleton, except we define a module instead of a class.

A module is a collection of methods and variables, but unlike classes, modules cannot be instantiated.  Because of this, using a module for a singleton better adheres to coding conventions and makes for clearer code.

---
### Factory

Factory pattern is one of most used design pattern in Object oriented design. This type of design pattern comes under creational pattern as this pattern provides one of the best ways to create an object.

In Factory pattern, we create object without exposing the creation logic to the client and refer to newly created object using a common interface.

#### Implementation

We're going to create a Shape interface and concrete classes implementing the Shape interface. A factory class ShapeFactory is defined as a next step.

FactoryPatternDemo, our demo class will use ShapeFactory to get a Shape object. It will pass information (CIRCLE / RECTANGLE / SQUARE) to ShapeFactory to get the type of object it needs.

---

### Abstract Factory

Abstract Factory patterns work around a super-factory which creates other factories. This factory is also called as factory of factories. This type of design pattern comes under creational pattern as this pattern provides one of the best ways to create an object.

In Abstract Factory pattern an interface is responsible for creating a factory of related objects without explicitly specifying their classes. Each generated factory can give the objects as per the Factory pattern.

#### Implementation

We are going to create a Shape and Color interfaces and concrete classes implementing these interfaces. We create an abstract factory class AbstractFactory as next step. Factory classes RedCircleFactory, GreenSquareFactory and BlueRectangleFactory are defined where each factory extends AbstractFactory. A factory creator/generator class ColoredShapeFactory is created.

AbstractFactoryPatternDemo, our demo class uses ColoredShapedFactory to get an AbstractFactory object. It will pass information (RedCircle / GreenSquare / BlueRectangle) to ColoredShapeFactory to get the type of factory object it needs.

---
### Builder

The very simple idea behind the Builder pattern is that you encapsulate object construction logic behind a class of its own. The builder class takes charge of assembling all the components of a complex object. Each builder has an interface that lets you specify the configuration of your new object step by step.

In a sense, a builder is a sort of like a multipart new method, where objects are created in an extended process instead of all in one shot.

#### Implementation

We follow the example in the book by first starting to implement the classes of the basic components of a computer system (CPU, Motherboard, Drives). The Motherboard class is a composite containing components such as CPU. The Computer class is a composite as well containing a display, motherboard, and drives. There are two types of CPUs (BasicCPU and TurboCPU). You might now appreciate the complexity of building a single computer system everytime you might need one.

We continue by building our builder ComputerBuilder which will simplify the way we build computers in our client application. The ComputerBuilder class handles an instance of a Computer object. We then construct instance method to handle building our Computer instance object. Methods such as, turbo() to tell our Computer's Motherboard to have a TurboCPU and not a BasicCPU by default. Moreover, (add_cd, add_dvd, add_hard_disk) methods to add drives to our Computer. And also other methods.

Finally, in our client application we instantiate an object of ComputerBuilder and we call the aforementioned methods on the builder to build our custom computer object during run-time.

Note that we also make use of magic methods to rapidly build our computer object. As per the book we have overridden the method_missing() method to parse the method name and rapidly construct the object we need.

---

### Interpreter

The Interpreter Pattern specifies how to evaluate(interpret) expressions in a language. The basic idea is to have a class for each symbol that may occur in expression. If we instantiate these classes and connect the objects together they will form a syntax tree of the language.

#### Uses

This design pattern is good at solving contained, well-bounded problems. Some characteristic uses of the interpreter design pattern are: 

* Pattern matching languages such as regular expressions
* Query languages such as SQL
* Configuration languages(e.g. languages describing communication protocols).

#### Implementation

The book presents an interesting case of the pattern where we want to find files by name, size and more complex searches. The pattern implementation can be split in three parts the class definitions, the parser development and the expression evaluation. 

##### Class definitions

Lets consider the book example, where we have the following symbols:

1) '|' -> Or Class

2) '&' -> And Class

For each symbol-token above we create a class, that is responsible for interpreting it's part of the expression.

After we define and implement our classes we need a parser. The parser will read the input and produce an Abstract Syntax Tree or AST. The nodes of the tree are the instantiated objects of our classes. 

##### Parser

The produced AST is an object representation of our file finding expression. Each node of the tree is either terminal(objects that won't be broken down any further) or nonterminal(more abstract objects). 

##### Expression evaluation

This is basically the evaluation of the AST that was build by the parser. The nodes of the tree are evaluated against specific conditions we set.
