import 'package:validator/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    @required this.title,
    @required this.value,
    this.enableCopy = true,
    Key key,
  }) : super(key: key);
  final String title;
  final String value;
  final bool enableCopy;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !this.value.isNullOrBlank,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(this.title ?? ''),
        subtitle: Text(this.value ?? ''),
        trailing: Visibility(
          visible: this.enableCopy && !this.value.isNullOrBlank,
          child: IconButton(
            onPressed: () => TransferDetailController.con.copy(
              this.title,
              this.value,
            ),
            icon: Icon(Icons.content_copy),
          ),
        ),
      ),
    );
  }
}
