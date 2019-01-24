import 'package:flutter/material.dart';
import '../constants.dart' show AppColors,AppStyles,Constants;
import '../modal/conversation.dart' show ConversationPageData,Conversation ;

class _ConversationItem extends StatelessWidget {
  const _ConversationItem({Key key,this.conversation})
      :assert(conversation != null),
       super(key:key);
  final Conversation conversation;
  @override
  Widget build(BuildContext context) {
    Widget avatar;
    //根据图片的获取方式初始化头像组件
    if(conversation.isAvatarFromNet()){
      avatar = Image.network(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    }else{
      avatar = Image.asset(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    }
    Widget avatarContainer;
    if(conversation.unreadMsgCount > 0){
      //未读消息角标
      Widget unreadMsgCountText = Container(
        width: Constants.UnReadMsgNotifyDotSize,
        height: Constants.UnReadMsgNotifyDotSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.UnReadMsgNotifyDotSize / 2.0),
          color: Color(AppColors.NotifyDotBg),
        ),
        child: Text(conversation.unreadMsgCount.toString(),style: AppStyles.UnreadMsgCountDotStyle),
      );
      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            child: unreadMsgCountText,
            right: -6.0,
            top: -6.0,
          )
        ],
      );
    } else {
      avatarContainer = avatar;
    }
    //勿扰模式图标
    Widget muteIcon = Icon(IconData(
      0xe755,
      fontFamily: Constants.IconFontFamily,
    ),color: Color(AppColors.ConversationMuteIcon),size: Constants.ConversationMuteIconSize);

    var _rightArea = <Widget>[
      Text(conversation.updateAt,style: AppStyles.DesStyle),
      Container(height: 22.0),
    ];
    if(conversation.isMute){
      _rightArea = [
        Text(conversation.updateAt,style: AppStyles.DesStyle),
        Container(height: 6.0),
        muteIcon
      ];
    }
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Color( AppColors.DividerColor),
              width: Constants.DividerWidth)
        ),
        color: Color( AppColors.ConversationItemBg),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          avatarContainer,
          Container(width: 10.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(conversation.title,style: AppStyles.TitleStyle),
                Container(height: 6.0),
                Text(conversation.des,style: AppStyles.DesStyle,),
              ],
            )
          ),
          Column(
            children: _rightArea,
          )
        ],
      ),
    );
  }
}


class ConversationPage extends StatefulWidget {
  _ConversationPage createState() => _ConversationPage();
}

class _ConversationPage extends State<ConversationPage> {
  final ConversationPageData data = ConversationPageData.mock();
  @override
  void initState() {
    super.initState();
    print("fourth");
  }
  @override
  Widget build(BuildContext context) {
    var mockConversations = data.conversations;
    return ListView.builder(
      itemBuilder: (BuildContext context, int index){
        if(index == 0){
          return Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: Constants.DividerWidth,color: Color(AppColors.DividerColor))
              ),
              color: Color(AppColors.DeviceInfoItemBg)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(IconData(
                  0xe640,
                  fontFamily: Constants.IconFontFamily
                ),size: 26.0,),
                SizedBox(width: 16),
                Text('微信已登录，手机通知已关闭',style: AppStyles.DeviceInfoItemTextStyle)
              ],
            ),
          );
        }
        return  _ConversationItem(conversation: mockConversations[index - 1],);
      },
      itemCount: mockConversations.length + 1,
    );
  }
}
