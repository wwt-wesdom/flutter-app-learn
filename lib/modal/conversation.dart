import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:dio/dio.dart';
class SkyHorseList {
  final String title;
  final String imgUrl;
  final String price;
  final String time;
  SkyHorseList({
    this.title,
    this.imgUrl,
    this.price,
    this.time
  });
}

const List<SkyHorseList> mokSkyHorseList = [
  /*const SkyHorseList(
    title:'了对方即可',
    imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
    price: '20.99',
    time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'放大发送到',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '30.99',
      time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'反反复复付',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '40.99',
      time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'少时诵诗书',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '50.99',
      time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'反反复复付非',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '60.99',
      time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'了对方即可',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '70.99',
      time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'是发撒的发生大',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '80.99',
      time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'了对方即可',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '90.99',
      time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'下水道',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '100.99',
      time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'惆怅长岑长',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '110.99',
      time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'了对方即可',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '20.99',
      time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'了对方少时诵诗书即可',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '120.99',
      time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'了对方即可',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '130.99',
      time: '2018-10-15 20:18:58'
  ),
  const SkyHorseList(
      title:'啛啛喳喳所所',
      imgUrl: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181218/p1pj3xct5fxp45v03tueah5mi2583781639!thum400',
      price: '140.99',
      time: '2018-10-15 20:18:58'
  ),*/
];
var listData = [];
void main(){
  dioText();
}
dioText() async{
  Dio dio = Dio();
  Response response = await dio.get("http://192.168.100.133:8099/api/theme/list.json?pageIndex=1&pageSize=10&sort=&orderBy=");
  print(response.data);
  listData = response.data.content;
  print(listData);
  listData.forEach((item){
    mokSkyHorseList.add(SkyHorseList(
      title: item.content,
      imgUrl: item.items[0].itemPicUrl,
      price: item.items[0].itemPrice?item.items[0].itemPrice:0,
      time: item.createTime
    ));
  });
}
class Conversation {
  const Conversation({
    @required this.avatar,
    @required this.title,
    this.des,
    this.titleColor : AppColors.TitleTextColor,
    @required this.updateAt,
    this.isMute : false,
    this.unreadMsgCount : 0,
    this.displayDot : false,
  }):assert(avatar != null),
     assert(title != null),
     assert(updateAt != null);
  final String avatar;
  final String title;
  final String des;
  final String updateAt;
  final bool isMute;
  final int titleColor;
  final int unreadMsgCount;
  final bool displayDot;
  bool isAvatarFromNet() {
    if(this.avatar.indexOf('http') >= 0 || this.avatar.indexOf('https') >= 0){
      return true;
    }
    return false;
  }
}

const List<Conversation> mockConversations = [
  const Conversation(
    avatar: 'assets/images/ic_file_transfer.png',
    title: '文件传输助手',
    des: '',
    updateAt: '19:56',
  ),
  const Conversation(
    avatar: 'assets/images/ic_tx_news.png',
    title: '腾讯新闻',
    des: '豪车与出租车刮擦 俩车主划拳定责',
    updateAt: '17:20',
  ),
  const Conversation(
    avatar: 'assets/images/ic_wx_games.png',
    title: '微信游戏',
    titleColor: 0xff586b95,
    des: '25元现金助力开学季！',
    updateAt: '17:12',
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
    title: '汤姆丁',
    des: '今晚要一起去吃肯德基吗？',
    updateAt: '17:56',
    isMute: true,
    unreadMsgCount: 0,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
    title: 'Tina Morgan',
    des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
    updateAt: '17:58',
    isMute: false,
    unreadMsgCount: 3,
  ),
  const Conversation(
    avatar: 'assets/images/ic_fengchao.png',
    title: '蜂巢智能柜',
    titleColor: 0xff586b95,
    des: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
    updateAt: '17:12',
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
    title: 'Lily',
    des: '今天要去运动场锻炼吗？',
    updateAt: '昨天',
    isMute: false,
    unreadMsgCount: 99,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
    title: '汤姆丁',
    des: '今晚要一起去吃肯德基吗？',
    updateAt: '17:56',
    isMute: true,
    unreadMsgCount: 0,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
    title: 'Tina Morgan',
    des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
    updateAt: '17:58',
    isMute: false,
    unreadMsgCount: 3,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
    title: 'Lily',
    des: '今天要去运动场锻炼吗？',
    updateAt: '昨天',
    isMute: false,
    unreadMsgCount: 0,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
    title: '汤姆丁',
    des: '今晚要一起去吃肯德基吗？',
    updateAt: '17:56',
    isMute: true,
    unreadMsgCount: 0,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
    title: 'Tina Morgan',
    des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
    updateAt: '17:58',
    isMute: false,
    unreadMsgCount: 1,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
    title: 'Lily',
    des: '今天要去运动场锻炼吗？',
    updateAt: '昨天',
    isMute: false,
    unreadMsgCount: 0,
  ),
];
const Map<String,List<Conversation>> mockConversationData = {
  'conversations': mockConversations
};

class ConversationPageData {
  final List<Conversation> conversations;
  ConversationPageData({this.conversations});
  static mock(){
    return ConversationPageData(conversations: mockConversations);
  }

}
