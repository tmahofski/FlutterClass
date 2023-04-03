class Exercise {
  final String name;
  final String bodyPart;
  final String target;
  final String gifUrl;
  final String equipment;
  final String id;
  final String currentWeight;
  final String sets;
  final String reps;

  const Exercise({
    required this.name,
    required this.bodyPart,
    required this.target,
    required this.gifUrl,
    required this.equipment,
    required this.id,
    required this.currentWeight,
    required this.sets,
    required this.reps,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      bodyPart: json['bodyPart'],
      target: json['target'],
      gifUrl: json['gifUrl'],
      equipment: json['equipment'],
      id: json['id'],
      currentWeight: 'Not Set',
      sets: 'Not Set',
      reps: 'Not Set',
    );
  }

  Exercise copyWith({
    String? name,
    String? bodyPart,
    String? target,
    String? gifUrl,
    String? equipment,
    String? id,
    String? currentWeight,
    String? sets,
    String? reps,
  }) {
    return Exercise(
      name: name ?? this.name,
      bodyPart: bodyPart ?? this.bodyPart,
      target: target ?? this.target,
      gifUrl: gifUrl ?? this.gifUrl,
      equipment: equipment ?? this.equipment,
      id: id ?? this.id,
      currentWeight: currentWeight ?? this.currentWeight,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
    );
  }
}
