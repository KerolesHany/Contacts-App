import 'package:flutter/material.dart';

class VisibleContact extends StatelessWidget {
  String name, number;
  bool isVisible;
  int index;
  void Function(int index)? onDelete;
  VisibleContact({
    super.key,
    this.isVisible = false,
    this.name = "",
    this.number = "",
    this.index = 0,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isVisible,
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          // height: 100,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Name : $name",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Number : $number",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  onDelete!(index);
                },
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                  size: 28,
                ),
              ),
            ],
          ),
        ));
  }
}
