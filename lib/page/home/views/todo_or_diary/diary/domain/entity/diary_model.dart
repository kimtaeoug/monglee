class DiaryModel {
  final int idx;
  final String cottonType;
  final String? imgUrl;
  final String contents;

  DiaryModel(
      {required this.idx,
      required this.cottonType,
      this.imgUrl,
      required this.contents});
}
