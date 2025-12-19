import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

const String _cloudName = "dev61pyjy";
const String _uploadPreset = "holbegram_unsigned";

Future<Map<String, dynamic>> uploadImageToCloudinary(
  Uint8List bytes, {
  String folder = "holbegram/posts",
  String? publicId,
}) async {
  final uri = Uri.parse("https://api.cloudinary.com/v1_1/$_cloudName/image/upload");

  final request = http.MultipartRequest("POST", uri)
    ..fields["upload_preset"] = _uploadPreset
    ..fields["folder"] = folder;

  if (publicId != null && publicId.isNotEmpty) {
    request.fields["public_id"] = publicId;
  }

  request.files.add(
    http.MultipartFile.fromBytes("file", bytes, filename: "post.jpg"),
  );

  final response = await request.send();
  final body = await response.stream.bytesToString();

  if (response.statusCode != 200 && response.statusCode != 201) {
    throw Exception("Cloudinary upload failed: ${response.statusCode} $body");
  }

  final data = jsonDecode(body) as Map<String, dynamic>;
  return {
    "secure_url": data["secure_url"],
    "public_id": data["public_id"],
  };
}
