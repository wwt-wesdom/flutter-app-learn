import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../constants.dart' show Constants,AppColors;
import './conversation_page.dart';
import './horse_list.dart';
import './sliver_app_bar.dart';
import './fourth.dart';
import './five.dart';
import '../routers/routes.dart';
import '../routers/application.dart';
import './horse_home.dart';
import 'package:flutter_app/blocs/app_init/bloc_init_page.dart';
enum ActionItems {
  GROUP_CHAT,ADD_FRIEND,QR_SCAN,PAYMENT,HELP
}
class NavigationIconView {
  final BottomNavigationBarItem item;
  NavigationIconView({Key key,String title,IconData icon ,IconData activeIcon}):
    item = BottomNavigationBarItem(
      title: Text(title,style: TextStyle(
        fontSize: 14.0
      )),
      icon: Icon(icon),
      activeIcon: Icon(activeIcon),
      backgroundColor: Colors.white
    );
}

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

//底部导航栏
class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState(){
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  PageController _pageController;
  int _currentIndex = 0;
  List<Widget> _pages;
  List<NavigationIconView> _navigationViews;
  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
          title: '首页',
          icon: IconData(
            0xe608,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe603,
            fontFamily: Constants.IconFontFamily,
          )
      ),
      NavigationIconView(
          title: '列表',
          icon: IconData(
            0xe601,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe656,
            fontFamily: Constants.IconFontFamily,
          )
      ),
      NavigationIconView(
          title: '工具',
          icon: IconData(
            0xe600,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe671,
            fontFamily: Constants.IconFontFamily,
          )
      ),
      NavigationIconView(
          title: '我',
          icon: IconData(
            0xe6c0,
            fontFamily: Constants.IconFontFamily
          ),
          activeIcon: IconData(
            0xe626,
            fontFamily: Constants.IconFontFamily
          )
      ),
    ];
    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      HorseHome(),
      HorseList(),
      Five(),
      ConversationPage(),
    ];
  }

//  拉下列表
  _buildPopupMunuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(IconData(
        iconName,
        fontFamily: Constants.IconFontFamily
        ),color: const Color(AppColors.AppBarPopupMenuColor),size: 22.0,),
        Container(width: 10.0),
        Text(title,style: TextStyle(color: const Color(AppColors.AppBarPopupMenuColor)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconView view){
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        });
      },
    );
    return Scaffold(
     /* appBar: new AppBar(
        elevation: 0,
        title: Text('微信'),
        actions: <Widget>[
          IconButton(
            icon: Icon(IconData(
              0xe65e,
              fontFamily: Constants.IconFontFamily,
            )),
            onPressed: () {print('点击了按钮');},
          ),
          Container(width: 10.0,),
          PopupMenuButton(
            itemBuilder: (BuildContext context){
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe69e,'发起群聊'),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe638,'添加朋友'),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe61b,'扫一扫'),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe62a,'收付款'),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe63d,'帮助与反馈'),
                  value: ActionItems.HELP,
                )
              ];
            },
            icon: Icon(IconData(
              0xe658,
              fontFamily: Constants.IconFontFamily
            )),
            onSelected: (ActionItems selected) {print('点击的是$selected');},
          ),
          Container(width: 10.0)
        ],
      ),*/
      body: PageView.builder(
         itemBuilder: (BuildContext context,int index){
            return _pages[index];
         },
         controller: _pageController,
         itemCount: _pages.length,
         onPageChanged: (int index) {
           setState(() {
             _currentIndex = index;
           });
         },
       ),
      bottomNavigationBar: botNavBar,
    );
  }
}

