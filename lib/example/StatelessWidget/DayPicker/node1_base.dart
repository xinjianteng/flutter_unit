

/// create by 张风捷特烈 on 2020-03-25
/// contact me by email 1981462002@qq.com
/// 说明:
import 'package:flutter/material.dart';

class CustomDayPicker extends StatelessWidget{

  const CustomDayPicker({Key? key}) : super(key: key);

  final String info =
      'DayPicker 日期选择器于 Flutter3.0 退出历史舞台。取代者为 CalendarDatePicker 日历选择器。';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(0.1),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Text(info),
    );
  }

  // final DateTime _date = DateTime.now();
  //
  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     height: 350,
  //     child: DayPicker(
  //         selectedDate: _date,
  //         currentDate: DateTime.now(),
  //         onChanged: (date)=> setState(() => _date = date),
  //         firstDate:  DateTime(2018),
  //         lastDate: DateTime(2030),
  //         displayedMonth: DateTime.now()
  //     ),
  //   );
  // }
}
