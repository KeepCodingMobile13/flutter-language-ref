/*
  Adding tasks to the isolate queue
  =================================

  * Tasks are "thunks".
  * Tasks are scheduled using two classes:
  *   - Duration (how long to wait until executed)
  *   - Timer (add the thunk to the queue)
*/

import 'dart:async';

main(List<String> args) {
  /* Duration
    A Duration represents a difference from one point in time to another. 
    The duration may be "negative" if the difference is from a later 
    time to an earlier.

    See DateTime to represent a point in time. 
    See Stopwatch to measure time-spans.
  */
  const now = Duration.zero;
  const asap = Duration(microseconds: 100);
  const soon = Duration(seconds: 1);
  const later = Duration(hours: 1, minutes: 12);

  // Comparison
  assert(now < asap);
  assert(soon < later);

  /* Timer
    Allows you to add thunks to the runLoop queue.
    Similar to performSelector: in Objective-C
    Either call the constructor with a Duration and a
    thunk or call the static run method to run asap.
  */

  Timer.run(() => print("There's something inside you,"));
  Timer(soon, () => print("They're talking about you, boy"));
  Timer(asap, () => print("it's hard to explain."));
  Timer(soon, () => print("but you're always the same."));

  /*
  Microqueue & Microtasks
  =======================

  If you absolutely need something to run BEFORE any other task in the queue.
  Makem short!

  Created with Future.microtask
  */

  Future.microtask(() => print("Nightcall\n=============="));
}
