// import main
// import 'package:cadence/main.dart';

class AuthService {
  // final currentUserUID = ref.watch(currentUserProvider);

  Future<String> sendOTC({required phoneNumber}) async {
    var code = "123";
    print("sendOTC- phone number: $phoneNumber");
    print("code: $code");

    // final response = await http.post(
    //   Uri.parse('https://api.flownotes.io/login'),
    //   body: jsonEncode(<String, String>{
    //     "phone": phoneNumber,
    //   }),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );

    // if (response.statusCode == 200) {
    //   try {
    //     Map<String, dynamic> user = json.decode(response.body);

    //     if (user['userid'] == null || user['userid'] == '') return '';
    //     print("in auth service: " + user['userid']);
    //     return user['userid'];
    //   } catch (e) {
    //     print(e.toString());
    //   }
    // }
    // print("in auth service: sign up + " + response.body);
    // print(response.statusCode);

    return code;
  }

  Future<List<dynamic>> oneTimeCodeVerified({required phoneNumber}) async {
    print("oneTimeCodeVerified- phone number: $phoneNumber");

    //todo:  set userid in provider

    return [true, "8080808080"];
  }

  Future<bool> updateAccountInfo(
      String uid, String name, String birthday, String city) async {
    print("updateAccountInfo: $uid, $name, $birthday, $city");
    return true;
  }

  Future<bool> signOut() async {
    print("signOut");

    // todo: remove userid from provider
    return true;
  }
}
