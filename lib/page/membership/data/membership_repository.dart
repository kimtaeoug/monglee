import 'package:get/get.dart';

class MemberShipRepository extends GetxService{

}
//class SampleReopsitory extends GetxService implements AbstractSampleRepository {
//   final SampleApi sampleApi;
//
//   SampleReopsitory({required this.sampleApi});
//   @override
//   Future<SampleUserModel> getSampleUserProfile() async {
//     try {
//       Response res = await sampleApi.getSampleUserProfile();
//       debugPrint(res.body.toString());
//       return SampleUserModel.fromJson(res.body);
//     } catch (e) {
//       debugPrint("ERROR: $e");
//       rethrow;
//     }
//   }
// }