# test_broadcast
The class should working like this:
it has a .subscribe() method, which takes a block and stores it as a handler
it has an .unsubscribe() method, which takes a block and removes it from its
list of handlers
it has an .broadcast() method, which takes an arbitrary number of arguments and
calls all the stored blocks with these arguments
