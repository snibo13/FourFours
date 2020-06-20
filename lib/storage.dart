String _generateKey
(

String id = 1,
    String
key) {
return "$id/$key";
}

@override
void saveString(String userId, String key, int score) async {
  final prefs = await SharedPreferences.getInstance();
  await pres._setString("Highscore", score)
}