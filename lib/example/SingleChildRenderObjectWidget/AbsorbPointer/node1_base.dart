import 'package:flutter/material.dart';

class CustomAbsorbPointer extends StatefulWidget {
  const CustomAbsorbPointer({Key? key}) : super(key: key);

  @override
  _CustomAbsorbPointerState createState() => _CustomAbsorbPointerState();
}

class _CustomAbsorbPointerState extends State<CustomAbsorbPointer> {
  bool _absorbing = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: (){
            print('AbsorbPointer');
          },
          child: AbsorbPointer(
            absorbing: _absorbing,
            child: _buildButton(),
          ),
        ),
        _buildSwitch(),
        Text(!_absorbing ? '允许点击' : '事件已被吸收')
      ],
    );
  }

  Widget _buildButton() => RaisedButton(
      color: Theme.of(context).primaryColor,
      child: const Text(
        'To About',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => Navigator.of(context).pushNamed('AboutMePage'));

  Widget _buildSwitch() => Switch(
      value: _absorbing,
      onChanged: (v) {
        setState(() {
          _absorbing = v;
        });
      });
}
