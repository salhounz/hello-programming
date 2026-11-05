class Counter {
  int _count = 0;
  int get value => _count;
  void increment() { _count++; }
}

Future<void> main() async {

  /*
      Type Systems & Variables
  */
  // var infers a static type; final fixes a binding and const describes a compile-time constant.
  var score = 10;
  score += 5;
  final language = "Dart";
  const limit = 20;
  String? missing;

  /*
      Control Flow Operations
  */
  // if, for, and null-aware operators handle decisions and absence.
  final status = score >= 10 ? "pass" : "retry";
  final displayName = missing ?? "Guest";
  for (final value in [1, 2, 3]) { score += value; }

  /*
      Execution Blocks
  */
  // Functions have typed parameters and can use concise arrow bodies.
  int add(int left, int right) => left + right;
  final sum = add(2, 3);

  /*
      Code Health & Documentation
  */
  // Use line and block comments and /// documentation on declarations.
  // A single-line comment.
  /* A multi-line comment. */
  /// Return the square of value.
  int square(int value) => value * value;

  /*
      Built-In Collections
  */
  // List is ordered, Map associates keys, and Set keeps unique members.
  final values = <int>[1, 2, 3];
  final inventory = <String, int>{"apples": 3};
  final unique = <int>{1, 2};

  /*
      Data Mutability
  */
  // Spread creates a shallow copy; const collections cannot be mutated.
  final copied = [...values];
  copied.add(4);
  const fixed = [1, 2, 3];

  /*
      Access & Encapsulation
  */
  // Library-private fields and public getters keep representation behind a small API.
  final counter = Counter();
  counter.increment();
  final count = counter.value;

  /*
      Design Paradigms & Patterns
  */
  // Functions and iterable methods compose transformations without changing the input.
  final doubled = values.map((value) => value * 2).toList();
  final total = values.fold<int>(0, (sum, value) => sum + value);

  /*
      Memory Management
  */
  // The runtime collects objects; clear retained collections and close resources you open.
  final cache = <String, int>{"old": 42};
  cache.clear();

  /*
      Concurrency & Parallelism
  */
  // Future.wait coordinates async work; isolates provide independent execution for CPU work.
  final loaded = await Future.wait([
    Future<String>.delayed(const Duration(milliseconds: 1), () => "first"),
    Future<String>.delayed(const Duration(milliseconds: 1), () => "second"),
  ]);

  /*
      Performance Optimization
  */
  // Use sets for repeated membership checks and avoid needless toList conversions.
  final allowed = <String>{"Ada", "Grace"};
  final isAllowed = allowed.contains("Ada");

  print('Hello, World!');
}
