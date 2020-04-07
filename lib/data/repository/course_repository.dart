import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:skill_zycp/data/model/course_result_model.dart';
import 'package:skill_zycp/res/stringsresource/strings.dart';
import 'package:xml2json/xml2json.dart';

abstract class CourseRepository {
  Future<Course> getCourse();
}
// TODO: implement getCourse

class CourseRepositoryImplementation implements CourseRepository {
  @override
  Future<Course> getCourse() async {
    final Xml2Json xml2json = Xml2Json();

    try {
      Map<String, String> headers = {"Accept": "text/html,application/xml"};
      final response =
          await http.get(AppStrings.skillzycpUrl, headers: headers);

      xml2json.parse(response.body);
      var jsonString = xml2json.toParker();
      // print(
      Map<String, dynamic> decodeJsonString =
          json.decode(removeAllHtmlTags(jsonString));

      var getItemsObject = decodeJsonString['string'];

      var jsonStr = """
       $getItemsObject

      """
          .replaceAll(new RegExp(r"\s+"), "");

      var decodeData = json.decode(jsonStr);

      Course course = Course.fromJson(decodeData);
      return course;
    } catch (ex) {
      throw Exception();
    }
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}
