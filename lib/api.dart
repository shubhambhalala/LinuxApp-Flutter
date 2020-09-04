import 'package:http/http.dart' as http;

linuxcommand({command}) async {
  var url =
      'http://192.168.99.102/cgi-bin/linux/create/command.py?a=${command}';
  var response = await http.get(url);
  var data = response.body;
  return data;
}
