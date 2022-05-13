# test_broadcast
The class should working like this:
1. it has a .subscribe() method, which takes a block and stores it as a handler
2. it has an .unsubscribe() method, which takes a block and removes it from its
list of handlers
3. it has an .broadcast() method, which takes an arbitrary number of arguments and
calls all the stored blocks with these arguments
