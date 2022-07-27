import 'package:flutter/material.dart';
import 'package:flutter_unit/page/widget_detail/widget/panel.dart';
import 'package:toggle_rotate/toggle_rotate.dart';

import '../../../common/widget/widgets.dart';
import 'code/code_widget.dart';
import 'code/highlighter_style.dart';

/// create by 张风捷特烈 on 2020-04-13
/// contact me by email 1981462002@qq.com
/// 说明: 一个Widget的知识点对应的界面

class WidgetNodePanel extends StatefulWidget {
  final String text;
  final String subText;
  final String code;
  final Widget? show;

  final HighlighterStyle? codeStyle;
  final String? codeFamily;

  const WidgetNodePanel({
    Key? key,
    this.text = '',
    this.subText = '',
    this.code = '',
    this.show,
    required this.codeStyle,
    this.codeFamily,
  }) : super(key: key);

  @override
  _WidgetNodePanelState createState() => _WidgetNodePanelState();
}

class _WidgetNodePanelState extends State<WidgetNodePanel> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  bool get isFirst => _crossFadeState == CrossFadeState.showFirst;

  Color get themeColor => Theme.of(context).primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildNodeTitle(),
          const SizedBox(
            height: 20,
          ),
          _buildCode(context),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: widget.show,
          ),
          _buildNodeInfo(),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildNodeTitle() => Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Circle(
              color: themeColor,
              radius: 5,
            ),
          ),
          Expanded(
            child: Text(
              widget.text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          _buildShareButton(),
          _buildCodeButton()
        ],
      );

  Widget _buildNodeInfo() => SizedBox(
        width: double.infinity,
        child: Panel(
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: Text(
              widget.subText,
              style: const TextStyle(fontSize: 14),
            )),
      );

  Widget _buildCodeButton() => Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ToggleRotate(
          durationMs: 300,
          child: Icon(
            Icons.code,
            color: themeColor,
          ),
          onTap: _toggleCodePanel,
        ),
      );

//  分享按钮
  Widget _buildShareButton() => FeedbackWidget(
        mode: FeedMode.fade,
        a: 0.4,
        onPressed: () {
          // Share.share(widget.code);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: Icon(
            Iconfont.share,
            size: 20,
            color: themeColor,
          ),
        ),
      );

  Widget _buildCode(BuildContext context) => AnimatedCrossFade(
        firstCurve: Curves.easeInCirc,
        secondCurve: Curves.easeInToLinear,
        firstChild: const SizedBox(),
        secondChild: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CodeWidget(
            fontFamily: widget.codeFamily,
            code: isFirst ? '' : widget.code,
            style: widget.codeStyle ??
                HighlighterStyle.fromColors(HighlighterStyle.lightColor),
          ),
        ),
        duration: const Duration(milliseconds: 200),
        crossFadeState: _crossFadeState,
      );

  // 折叠代码面板
  _toggleCodePanel() {
    setState(() {
      _crossFadeState =
          !isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond;
    });
  }
}
