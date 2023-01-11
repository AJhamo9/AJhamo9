class minuppgift {
  final int id;
  final String title;
  final int isDone;
  minuppgift({this.title, this.id, this.isDone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };
  }
}
