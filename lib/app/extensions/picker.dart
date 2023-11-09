import 'package:image_picker/image_picker.dart';

extension PickerUtil on ImagePicker{
  static Future<XFile?> pick()async{
    final ImagePicker picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.gallery);
  }
  //final ImagePicker picker = ImagePicker();
  // // Pick an image.
  // final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  // // Capture a photo.
  // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  // // Pick a video.
  // final XFile? galleryVideo =
  //     await picker.pickVideo(source: ImageSource.gallery);
  // // Capture a video.
  // final XFile? cameraVideo = await picker.pickVideo(source: ImageSource.camera);
  // // Pick multiple images.
  // final List<XFile> images = await picker.pickMultiImage();
  // // Pick singe image or video.
  // final XFile? media = await picker.pickMedia();
  // // Pick multiple images and videos.
  // final List<XFile> medias = await picker.pickMultipleMedia();
}