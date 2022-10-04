// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_app/model/getCourseModel.dart';
import 'package:intl/intl.dart';

class CardCustom extends StatelessWidget {
  const CardCustom({super.key, required this.item});
  final Data? item;
  @override
  Widget build(BuildContext context) {
    DateTime? dateTime = DateTime.tryParse(item!.startedDate ?? "");
    final dateFormatter = DateFormat('dd/MM/yyyy');
    final stringDate = dateFormatter.format(dateTime!);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 10.0,
        ),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                width: width * 0.7,
                child: Text(
                  '${item!.courseName}',
                  // 'Chia sẻ kinh nghiệm tư vấn - triển khai dự án TDA ư vấn - triển khai dự án TDA',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff345173),
                  ),
                  maxLines: 2,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                tooltip: 'ADD',
                onPressed: () {
                  // handle the press
                  // ignore: avoid_print
                  print("onPress More!!");
                },
              ),
            ],
          ),
          RowInCard(
            icon: (Icons.person),
            iconColor: const Color(0xffffd237),
            labelText: "Giảng viên: ",
            value: '${item!.trainer}',
            valueColor: const Color(0xff0a8dc3),
          ),
          RowInCard(
            icon: (Icons.contact_mail_outlined),
            iconColor: const Color(0xff40304d),
            labelText: "Cán bộ quản lý: ",
            value: '${item!.createdBy}',
            valueColor: const Color(0xfff0943f),
          ),
          RowInCard(
            icon: (Icons.event),
            iconColor: const Color(0xff42c8fb),
            labelText: "Thời gian: ",
            value: '${stringDate}',
            valueColor: const Color(0xff345173),
          ),
          RowInCard(
            icon: (Icons.business),
            iconColor: const Color(0xff0090d7),
            labelText: "Tòa nhà:",
            value: '${item!.buildingName}',
            valueColor: const Color(0xff345173),
          ),
          RowInCard(
            icon: (Icons.meeting_room),
            iconColor: const Color(0xffff9126),
            labelText: "Phòng:",
            value: '${item!.roomName}',
            valueColor: const Color(0xff345173),
          ),
        ]),
      )
    ]);
  }
}

class RowInCard extends StatelessWidget {
  const RowInCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.labelText,
    required this.value,
    required this.valueColor,
  });

  final IconData icon;
  final Color? iconColor;
  final String? labelText;
  final String? value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          "$labelText ",
          style: const TextStyle(
            color: Color(0xff345173),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        SizedBox(
          width: width * 0.5,
          child: Text(
            "$value ",
            style: TextStyle(
              color: valueColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
