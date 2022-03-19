import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trivial_app/MODELS/response_model_model.dart';



class NetworkHelper {
  Future<Response?> getQustens() async {
    final response = await http.get(
      Uri.parse(
          'https://opentdb.com/api.php?amount=10&category=18&difficulty=medium&type=multiple'),
    );
    var responseJson = json.decode(response.body.toString());
    var r = Response.fromJson(responseJson);
    print(r.results.first.question);
    return r;
  }
}
