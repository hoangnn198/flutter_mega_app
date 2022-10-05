import 'package:flutter/material.dart';
import 'package:flutter_app/custom/Select.dart';

class BottomSheetCustom extends StatefulWidget {
  const BottomSheetCustom({
    super.key,
    this.label,
    this.data,
    this.onPressClose,
    this.height,
    this.value,
    required this.onPressedItem,
  });

  final dynamic height;
  final dynamic label;
  final dynamic value;
  final data;
  final dynamic onPressClose;
  final Function onPressedItem;

  @override
  State<BottomSheetCustom> createState() => _BottomSheetCustomState();
}

class _BottomSheetCustomState extends State<BottomSheetCustom> {
  onPressModal(BuildContext context, data) {
    showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: widget.height ?? (MediaQuery.of(context).size.height) * 0.7,
            color: Colors.white,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: widget.data.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {
                            widget.onPressedItem(widget.data[index], index);
                            Navigator.pop(context);
                          },
                          child: Container(
                            // color: Colors.green,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              border: Border(
                                  bottom: BorderSide(
                                      color: Theme.of(context).dividerColor)),
                            ),
                            child: Text('${widget.data[index].label}'),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print('widget data ${widget.data}');
    return Select(
      label: widget.label ?? "Open BottomSheet",
      value: widget.value,
      onPressed: () {
        onPressModal(context, widget.data);
      },
    );
  }
}
