/*
  Futures in Dart run on the same isolate (thread).
  Futures break a long i/o task into several smaller
  tasks that run on the event queue.

  Once finished, the Future completes and some success or failure
  closure is added to the event queue.

  A Future needs 4 things:

  * an i/o bound function
  * Un callback para el éxito
  * An optional error callback
  * An optional final callback, called no matter what

  Not all callbacks have to be provided in the costructor. You can provide 
  them a posteriori with the following methods:

  * then ((value) =>...)
  * catchError((err) =>....)
  * whenComplete(()=>...)

  CREATION

  You usually don't create Futures. Any function that is i/o bound returns a
  Future.

  For example, http.get, returns a Future<Response>

  >> Any piece of shit that blocks because of i/o, returns a Future.

  IF YOU STILL WANT TO CREATE A FUTURE

  Future(T thunk_that_blocks_and_returns_T());
  Future(Duration wait_for_it, T thunk_that_blocks_and_returns_T());
*/

main(List<String> args) {
  // takes a long time
  Future<int> k = Future(() {
    for (int i = 0; i < 1000000000; i++) {
      return 42;
    }
  }).then((value) {
    print("done");
    print(value);
    return 42;
  });

  /*
  Async code keeps jumping around the closures and is hard to follow.
  There must be a btter way that makes async code look like sync.
  */
}
