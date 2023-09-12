class TodoModel {
  final int idx;
  final String title;
  final String? contents;
  final String? startTime;
  final String? endTime;
  final String? location;
  bool selected;

  TodoModel(
      {required this.idx,
      required this.title,
      this.contents,
      this.startTime,
      this.endTime,
      this.location,
      this.selected = false});
}
