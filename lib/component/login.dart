import 'package:flutter/material.dart';
import 'package:flutter_app/api/loginAPI.dart';

void main() {
  runApp(const MaterialApp(
    home: Login(),
  ));
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return const Scaffold(body: BodyLogin());
  }
}

enum SingingCharacter { lafayette, jefferson }

class BodyLogin extends StatefulWidget {
  const BodyLogin({super.key});

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> with TickerProviderStateMixin {
  bool isChecked = false;
  String? username;
  String? password;
  bool isLoading = false;
  String? errorUsername;
  String? errorPassword;

  final TextEditingController addressController = TextEditingController();
  final FocusNode addressFocus = FocusNode();
  final TextEditingController stateController = TextEditingController();
  final FocusNode stateFocus = FocusNode();
  final _validationKey = GlobalKey<FormState>();

  void onPressLogin() async {
    LoginAPI().login(username.toString(), password.toString()).then((value) => {
          if (value.resultCode == 1)
            {Navigator.of(context).pushNamed('/tab')}
          else
            {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Alert'),
                  content: Text('${value.message}'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => {
                        setState(() {
                          isLoading = false;
                        }),
                        Navigator.pop(context, 'Cancel')
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => {
                        setState(() {
                          isLoading = false;
                        }),
                        Navigator.pop(context, 'OK'),
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              )
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height);
    // ignore: avoid_unnecessary_containers
    return Container(
        child: Stack(
      children: [
        Column(
          children: [
            Container(
              width: width,
              height: 236,
              color: Colors.green,
              // ignore: prefer_const_literals_to_create_immutables
              child: Stack(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Image(
                    image: AssetImage('asset/welcome.png'),
                    fit: BoxFit.cover,
                    height: 236,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  Positioned(
                    top: 236 / 2 - 35,
                    left: 32,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('asset/logo_fpt.png'),
                          height: 32,
                          width: 53,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          // ignore: avoid_unnecessary_containers
                          child: Container(
                              child: const DefaultTextStyle(
                            style: TextStyle(decoration: TextDecoration.none),
                            child: Text(
                              "MegaAPP",
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                // height: 28,
                              ),
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height - 236,
                decoration: const BoxDecoration(
                  // color: Colors.red,
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                    topRight: Radius.circular(17),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SingleChildScrollView(
                      child: Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height -
                              236 - // height banner
                              10 * 2 - // height padding Vertical
                              10 - // height SizeBox Center 2 Button
                              15, // lineHeight Text copyright
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Column(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        errorText: errorUsername,
                                        border: const OutlineInputBorder(),
                                        labelText: 'Tên đăng nhập',
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: Colors.red,
                                            )),
                                      ),
                                      onChanged: (text) async {
                                        // ignore: unnecessary_null_comparison
                                        if (text != null) {
                                          setState(() {
                                            username = text;
                                            errorUsername = null;
                                          });
                                        } else {
                                          setState(() {
                                            username = null;
                                          });
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        errorText: errorPassword,
                                        border: const OutlineInputBorder(),
                                        labelText: 'Mật khẩu',
                                      ),
                                      onChanged: (text) async {
                                        // ignore: unnecessary_null_comparison
                                        if (text != null) {
                                          setState(() {
                                            password = text;
                                            errorPassword = null;
                                          });
                                        } else {
                                          setState(() {
                                            password = null;
                                          });
                                        }
                                      },
                                    ),
                                    // ignore: avoid_unnecessary_containers
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Checkbox(
                                                checkColor: Colors.white,
                                                // fillColor: MaterialStateProperty.resolveWith(getColor),
                                                value: isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },
                                              ),
                                              const Text("Ghi nhớ đăng nhập")
                                            ],
                                          ),
                                          const Text("Quên mật khẩu?"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            Colors.orange[700], // foreground
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 32, vertical: 12),
                                        minimumSize: Size(width - 48, 0),
                                      ),
                                      onPressed: () {
                                        if (username != null &&
                                            password != null) {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          onPressLogin();
                                        } else {
                                          if (username == null &&
                                              password == null) {
                                            setState(() {
                                              errorUsername =
                                                  "Nhập tên đăng nhập";
                                              errorPassword = "Nhập mật khẩu";
                                            });
                                          } else if (username == null) {
                                            setState(() {
                                              errorUsername =
                                                  "Nhập tên đăng nhập";
                                              errorUsername = null;
                                            });
                                          } else if (password == null) {
                                            setState(() {
                                              errorUsername = null;
                                              errorPassword = "Nhập mật khẩu";
                                            });
                                          }
                                        }
                                      },
                                      child: const Text(
                                        'Đăng nhập',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            Colors.white70, // foreground
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 32, vertical: 12),
                                        minimumSize: Size(width - 48, 0),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Liên hệ hỗ trợ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Copyright © 2022, FPT Information System",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))),
                ),
              ),
            ),
          ],
        ),
        // ignore: avoid_unnecessary_containers
        Container(
          child: isLoading == true
              ? const Center(child: CircularProgressIndicator())
              : null,
        ),
      ],
    ));
  }
}
