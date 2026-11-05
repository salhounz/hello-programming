/// Describe a task; named parameters make boolean arguments readable.
String label(String title, {bool done = false}) {
  return '${done ? "[done]" : "[next]"} ${title.trim()}';
}

void main() {
  // Dart infers static types; final fixes a binding, not its contents.
  final String owner = 'Ada';
  var previewLimit = 2;
  const showCompleted = false;
  String? nickname;
  print('Tasks for ${nickname ?? owner}');

  final tasks = <String, bool>{
    'Read a chapter': true,
    'Water the plants': false,
    'Plan a walk': false,
  };

  // entries exposes typed key/value pairs in map insertion order.
  for (final task in tasks.entries) {
    if (showCompleted || !task.value) {
      print(label(task.key, done: task.value));
    }
  }

  // where filters; map transforms; toList materializes the iterable.
  final pending = tasks.entries
      .where((task) => !task.value)
      .map((task) => task.key)
      .toList();
  print('Preview: ${pending.take(previewLimit).join(", ")}');

  // Collection if and spread keep list construction declarative.
  final agenda = <String>[
    'Morning check-in',
    ...pending,
    if (pending.isNotEmpty) 'Review progress',
  ];
  print(agenda);

  final tags = <String>{'home', 'learning', 'home'};
  print('Unique tags: ${tags.length}');
  final estimates = <String, int>{'reading': 20, 'walk': 30};
  print('Reading minutes: ${estimates['reading'] ?? 0}');

  // Spread makes a shallow copy, so this leaves pending unchanged.
  final extended = [...pending];
  extended.add('Write a note');
  print('Original: ${pending.length}; copy: ${extended.length}');

  // Parsing can return null instead of throwing an exception.
  final requested = int.tryParse('two') ?? previewLimit;
  print('Requested preview: ${pending.take(requested).toList()}');
}
