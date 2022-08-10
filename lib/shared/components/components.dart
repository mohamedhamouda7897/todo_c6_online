import 'package:flutter/material.dart';

showLoading(BuildContext context, String text, {bool isCancelable = true}) {
  showDialog(
      barrierDismissible: isCancelable,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
        );
      });
}

hideLoadingDialog(BuildContext context) {
  Navigator.pop(context);
}

showMessage(BuildContext context, String message, String actionName,
    VoidCallback actionCallBack,
    {bool isCancelable = true}) {
  showDialog(
      context: context,
      barrierDismissible: isCancelable,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(onPressed: actionCallBack, child: Text(actionName))
          ],
        );
      });
}
