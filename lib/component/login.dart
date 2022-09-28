import 'package:flutter/material.dart';

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

class _BodyLoginState extends State<BodyLogin> {
  bool isChecked = false;
  String? username;
  String? password;
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
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
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Tên đăng nhập',
                                    ),
                                    onChanged: (text) async {
                                      // ignore: unnecessary_null_comparison
                                      if (text != null) {
                                        setState(() {
                                          username = text;
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
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Mật khẩu',
                                    ),
                                    onChanged: (text) async {
                                      // ignore: unnecessary_null_comparison
                                      if (text != null) {
                                        setState(() {
                                          password = text;
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
                                      // ignore: avoid_print
                                      print(
                                          'username && password:$username $password');
                                      Navigator.of(context).pushNamed('/b');
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
    );
  }
}
