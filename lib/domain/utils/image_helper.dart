// import 'dart:io';
//
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:path_provider/path_provider.dart';
//
// class ImageHelper {
//   static Future<File> compressImage(File file) async {
//     final tempDir = await getTemporaryDirectory();
//     var result = await FlutterImageCompress.compressAndGetFile(
//       file.absolute.path,
//       "${tempDir.path}/temp.jpg",
//       quality: 40,
//     );
//
//     return File(result?.path ?? file.path);
//   }
// }
