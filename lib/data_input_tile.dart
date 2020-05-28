import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum RowOneValue { lowest, low, medium, high }
enum RowTwoValue { lowest, low, medium, high }

class DataInputTile<T> extends StatelessWidget {
  final T value;
  final Color mainColor;
  final Function onTap;
  final double borderWidth;
  final T blocValue;

  DataInputTile(
      {this.value,
      this.mainColor,
      this.onTap,
      this.borderWidth,
      this.blocValue});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final containerWidth = width / 3;
    final containerHeight = width / 3;

    return Container(
        width: containerWidth,
        color: Colors.transparent,
        height: containerHeight,
        child: RaisedButton(
          onPressed: () {
            this.onTap.call();
          },
          color: !isActive() ? Theme.of(context).backgroundColor : mainColor,
          elevation: 1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: mainColor, width: borderWidth)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.donut_small,
              color:
                  !isActive() ? mainColor : Theme.of(context).backgroundColor,
            ),
            Text('  Data', style: Theme.of(context).primaryTextTheme.bodyText1),
          ]),
        ));
  }

  bool isActive() {
    print(this.value);
    print(this.blocValue);
    return this.value == this.blocValue;
  }
}
