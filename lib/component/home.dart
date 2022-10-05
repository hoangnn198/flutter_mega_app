import 'package:flutter/material.dart';
import 'package:flutter_app/api/loginAPI.dart';
import 'package:flutter_app/model/getCourseModel.dart';
import '../custom/Card.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.white),
      // ignore: unnecessary_const
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QUẢN LÝ KHÓA HỌC'),
          backgroundColor: Colors.white,
          // ignore: prefer_const_constructors
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              tooltip: 'ADD',
              onPressed: () {
                // handle the press
                Navigator.of(context).pushNamed('/create');
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: const HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data>? data;
  bool isLoading = true;
  @override
  void initState() {
    GetCourseAPI().getCourse().then(
          (value) => {
            setState(() {
              data = value.data;
            })
          },
        );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      return ListView.builder(
        itemCount: data?.length,
        itemBuilder: (context, index) {
          return CardCustom(
            item: data![index],
          );
        },
      );
    } else {
      return Stack(
        children: [
          Container(
            child: isLoading == true
                ? const Center(child: CircularProgressIndicator())
                : null,
          ),
        ],
      );
    }
  }
}
