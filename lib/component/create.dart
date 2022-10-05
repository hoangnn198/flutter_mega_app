import 'package:flutter/material.dart';
import 'package:flutter_app/api/getBuilding.dart';
import 'package:flutter_app/custom/BottomSheet.dart';
import 'package:flutter_app/custom/DatePicker.dart';
import 'package:flutter_app/model/buildingRoomModel.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const Create());
}

class Create extends StatelessWidget {
  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.white),
      // ignore: unnecessary_const
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TẠO KHÓA HỌC'),
          backgroundColor: Colors.white,
          // ignore: prefer_const_constructors
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: const BodyCreate(),
        ),
      ),
    );
  }
}

class BodyCreate extends StatefulWidget {
  const BodyCreate({super.key});

  @override
  State<BodyCreate> createState() => _BodyCreateState();
}

class _BodyCreateState extends State<BodyCreate> {
  dynamic? fromTime;
  dynamic? toTime;
  String? buidingName;
  dynamic indexSelectedBuilding;
  String? idBuiding;
  String? roomName;
  String? idRoom;
  List<Data>? dataBuilding;

  @override
  void initState() {
    getBuildingAPI()
        .getBuilding()
        // ignore: avoid_print
        .then(
          (value) => {
            print('value ${value.resultCode}'),
            if (value.resultCode == 1)
              {
                setState(
                  () => {
                    // dataBuilding = value.data,
                  },
                ),
              }
          },
        );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tên khóa',
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    )),
              ),
              onChanged: (text) async {
                // ignore: unnecessary_null_comparison
              },
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tên giảng viên',
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    )),
              ),
              onChanged: (text) async {
                // ignore: unnecessary_null_comparison
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                Expanded(
                  flex: 1,
                  child: DatePicker(
                    label: "Từ ngày",
                    onPressed: (value) {
                      setState(
                        () {
                          fromTime = DateFormat('dd/MM/yyyy').format(value);
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 1,
                  child: DatePicker(
                    label: "Đến ngày",
                    onPressed: (value) {
                      setState(
                        () {
                          toTime = DateFormat('dd/MM/yyyy').format(value);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            BottomSheetCustom(
              label: 'Chọn tòa nhà',
              value: buidingName,
              data: dataBuilding,
              onPressClose: () {},
              onPressedItem: (value, index) {
                setState(() {
                  buidingName = value.buildingName;
                  idBuiding = value.value;
                  indexSelectedBuilding = index;
                  roomName = null;
                  idRoom = null;
                });
              },
            ),
            const SizedBox(
              height: 12,
            ),
            BottomSheetCustom(
              label: 'Chọn phòng',
              value: roomName,
              data: dataBuilding != null
                  ? dataBuilding![indexSelectedBuilding ?? 0].room
                  : null,
              onPressClose: () {},
              onPressedItem: (value, index) {
                setState(() {
                  roomName = value.label;
                  idRoom = value.value;
                });
              },
            ),
          ],
        ));
  }
}
