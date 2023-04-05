import 'dart:convert';

import 'package:http/http.dart' as http;

class SB4024Controller {
  final Uri baseHttpAddress;
  SB4024Controller({required this.baseHttpAddress});

  final _client = http.Client();
  void close() {
    _client.close();
  }

  Future<bool> loadPreset(int presetId) async {
    final url = baseHttpAddress.replace(path: '/datasend.php');
    final data = Uri.encodeFull(jsonEncode({
      "param": {"no": presetId}
    }));
    final res = await _client.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      },
      body: 'dummy=0&mode=36&mesmode=0&data=$data',
    );
    return res.statusCode == 200;
  }
}
