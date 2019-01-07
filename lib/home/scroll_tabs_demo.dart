import 'package:flutter/material.dart';

enum TabsDemoStyle {
  iconsAndText,
  iconsOnly,
  textOnly
}
class _Page {
  const _Page({this.icon,this.text});
  final IconData icon;
  final String text;
}
const List<_Page> _allPages = <_Page>[
  _Page(icon: Icons.grade, text: 'TRIUMPH'),
  _Page(icon: Icons.playlist_add, text: 'NOTE'),
  _Page(icon: Icons.check_circle, text: 'SUCCESS'),
  _Page(icon: Icons.question_answer, text: 'OVERSTATE'),
  _Page(icon: Icons.sentiment_very_satisfied, text: 'SATISFACTION'),
  _Page(icon: Icons.camera, text: 'APERTURE'),
  _Page(icon: Icons.assignment_late, text: 'WE MUST'),
  _Page(icon: Icons.assignment_turned_in, text: 'WE CAN'),
  _Page(icon: Icons.group, text: 'ALL'),
  _Page(icon: Icons.block, text: 'EXCEPT'),
  _Page(icon: Icons.sentiment_very_dissatisfied, text: 'CRYING'),
  _Page(icon: Icons.error, text: 'MISTAKE'),
  _Page(icon: Icons.loop, text: 'TRYING'),
  _Page(icon: Icons.cake, text: 'CAKE'),
];

class ScrollTabsDemo extends StatefulWidget {

  @override
  _ScrollTabsDemoState createState() => _ScrollTabsDemoState();
}

class _ScrollTabsDemoState extends State<ScrollTabsDemo> with SingleTickerProviderStateMixin {
  TabController _controller;
  TabsDemoStyle _demoStyle = TabsDemoStyle.iconsAndText;
  bool _customIndicator = false;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _allPages.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeDemoStyle(TabsDemoStyle style){
    setState(() {
      _demoStyle = style;
    });
  }

  Decoration getIndicator() {
    if (!_customIndicator)
      return const UnderlineTabIndicator();

    switch(_demoStyle) {
      case TabsDemoStyle.iconsAndText:
        return ShapeDecoration(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            side: BorderSide(
              color: Colors.white24,
              width: 2.0,
            ),
          ) + const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            side: BorderSide(
              color: Colors.transparent,
              width: 4.0,
            ),
          ),
        );

      case TabsDemoStyle.iconsOnly:
        return ShapeDecoration(
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.white24,
              width: 4.0,
            ),
          ) + const CircleBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 4.0,
            ),
          ),
        );

      case TabsDemoStyle.textOnly:
        return ShapeDecoration(
          shape: const StadiumBorder(
            side: BorderSide(
              color: Colors.white24,
              width: 2.0,
            ),
          ) + const StadiumBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 4.0,
            ),
          ),
        );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).accentColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll tabs'),
        actions: <Widget>[
         IconButton(
           icon: const Icon(Icons.sentiment_satisfied),
           onPressed: () {
             setState(() {
               _customIndicator = !_customIndicator;
             });
           },
         ),
          PopupMenuButton<TabsDemoStyle>(
            onSelected: changeDemoStyle,
            itemBuilder: (BuildContext context) => <PopupMenuItem<TabsDemoStyle>>[
              const PopupMenuItem(
                  value: TabsDemoStyle.iconsAndText,
                child: Text('Icons and text')
              ),
              const PopupMenuItem(
                  value: TabsDemoStyle.iconsOnly,
                  child: Text('Icons only')
              ),
              const PopupMenuItem(
                  value: TabsDemoStyle.textOnly,
                  child: Text('Text only')
              )
            ],
          )
        ],
        bottom: TabBar(
          isScrollable: true,
          indicator: getIndicator(),
          controller: _controller,
          tabs: _allPages.map<Tab>((_Page page){
            assert (_demoStyle != null);
            switch (_demoStyle){
              case TabsDemoStyle.iconsAndText:
                return Tab(text: page.text, icon: Icon(page.icon));
              case TabsDemoStyle.iconsOnly:
                return Tab(icon: Icon(page.icon));
              case TabsDemoStyle.textOnly:
                return Tab(text: page.text);
            }
            return null;
          }).toList()
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: _allPages.map<Widget>((_Page page) {
          return SafeArea(
            child: Container(
              key: ObjectKey(page.icon),
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Center(
                  child: Icon(
                    page.icon,
                    color: Colors.white,
                    size: 128.0,
                    semanticLabel: 'Placeholder for ${page.text} tab',
                  ),
                ),
              ),
            )
          );
        }).toList()
      ),
    );
  }
}





