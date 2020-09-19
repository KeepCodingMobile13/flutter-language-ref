/*
  async & await are syntactic sugar that make async code look like sync.export 
  Even error management works as expected.

  ASYNC
  =====

  Tags a function as asynchronous: must return a Future
  Future<int> f(n) async{}

  AWAIT
  =====

  Way of calling an async function that sends it to the even queue and keeps
  the event loop running. Execution of the continuation code will wait until 
  that Future completes.

  Async doesn't block the queue, it frees it for future use.

  * await can only be used inside an async λ
  * only and async λ can be called with await
*/

// blocking function that returns a Future
import 'dart:io';

Future<String> fetchUserOrder(int orderId) async {
  if (orderId.isEven) {
    return Future.delayed(Duration(seconds: 3), () => 'Mocaccino');
  } else {
    return Future.delayed(Duration(seconds: 3), () {
      throw "Oh Shit!";
    });
  }
}

main(List<String> args) async {
  try {
    print("Fetching the order...");
    String order = await fetchUserOrder(32);
    print("customer ordered a $order");
  } catch (e) {
    print("Something went wrong... $e");
  }

  try {
    print("Fetching next order...");
    print("Customer ordered: ${await fetchUserOrder(3)}");
  } catch (e) {
    print("Crap: $e");
  }
}
