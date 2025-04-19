https://www.linkedin.com/pulse/50-vital-advanced-javascript-interview-questions-answers-h30ce/


Advanced Javascript (More Advanced not necessary for ror https://www.linkedin.com/pulse/50-vital-advanced-javascript-interview-questions-answers-h30ce/)
  1. Event Loop: The event loop is a mechanism that allows JavaScript to perform non-blocking I/O operations by using callbacks, promises, and async/await.
      It offloads the operations to kernel when needed to perform non-blocking I/O operations.
  2. Closures: A closure is a function that retains access to its lexical scope, even when the function is executed outside that scope.
  3. Prototypal Inheritance: JavaScript uses prototypal inheritance, where objects can inherit properties and methods from other objects.
  4. Promises: A promise is an object that represents the eventual completion (or failure) of an asynchronous operation and its resulting value.
  5. Async/Await: Async/await is a syntactic sugar built on top of promises, allowing for more readable asynchronous code.
  6. Debouncing: Debouncing is a technique used to limit the rate at which a function is executed. It ensures that a function is not called too frequently, especially during events like scrolling or resizing.
  7. Throttling: Throttling is a technique used to ensure that a function is called at most once in a specified time interval. It helps to control the rate of function execution.
  8. "This" is object in method, Global object (Window) in function or alone and element in event listener
  9. Hoisting: Hoisting is a JavaScript mechanism where variables and function declarations are moved to the top of their containing scope during the compile phase.
  10. Event Delegation: Event delegation is a technique where a single event listener is attached to a parent element instead of multiple listeners on child elements. This improves performance and reduces memory usage.
  11. Callbacks: A callback is a function passed as an argument to another function, which is then invoked inside that function.
  12. bind: The bind() attaches the context of argument to the function
  13. IIFEs (Immediately Invoked Function Expressions): IIFEs are functions that are executed immediately after they are defined. They help to create a new scope and avoid polluting the global namespace.
  14. Promise.all and Promise.race: Promise.all takes an array of promises and returns a single promise that resolves when all of the promises in the array have resolved or when the iterable
  contains no promises. Promise.race takes an array of promises and returns a single promise that resolves or rejects as soon as one of the promises in the array resolves or rejects, with its
  value or reason.
  15. localstorage vs sessionStorage: localstorage is used to store data with no expiration time, while sessionStorage is used to store data for the duration of the page session. Data stored in
  localStorage is available across browser sessions, while data stored in sessionStorage is only available for the duration of the page session.
  16. yield: The yield keyword is used in generator functions to pause the execution of the function and return a value to the caller. When the generator function is called again, it resumes
  execution from where it left off.



React Performance Optimization
  1. Use usememo usecallbacks
  2. Lazy load images
  3. Windowing list/ list virtualization
  4. Use const and let prefer const
  5. Debouncing: Debouncing is a technique used to limit the rate at which a function is executed. It ensures that a function is not called too frequently, especially during events like scrolling or resizing.
  6. Throttling: Throttling is a technique used to ensure that a function is called at most once in a specified time interval. It helps to control the rate of function execution.
  7. Avoid unnecessary re-renders
