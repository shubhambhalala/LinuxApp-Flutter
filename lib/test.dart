import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

void main() {
  var uuid = Uuid();
  print(uuid.v1());
}
/*if (snack[1] != "0") {
                        print("Command failed");
                        print(ex);
                        fs.collection("command").add({
                          "cmd": _command,
                          "data": snack.substring(10, snack.length - 3),
                          "exno": ex,
                        });
                        fs
                            .collection("command")
                            .where("exno", isEqualTo: ex)
                            .get()
                            .then((value) => {
                                  value.docs.forEach((element) {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(element.get('data')),
                                      elevation: 5.0,
                                      shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      action: SnackBarAction(
                                          label: "Close", onPressed: () {}),
                                    ));
                                  })
                                });
                      } else {
                        fs.collection("command").add({
                          "cmd": _command,
                          "data": snack.substring(10, snack.length - 3),
                          "exno": ex,
                        });
                        fs
                            .collection("command")
                            .where("exno", isEqualTo: ex)
                            .get()
                            .then((value) => {
                                  value.docs.forEach((element) {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(element.get('data')),
                                      elevation: 5.0,
                                      shape: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      action: SnackBarAction(
                                          label: "Close", onPressed: () {}),
                                    ));
                                  })
                                });
                      }*/
