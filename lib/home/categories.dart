import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Widget> imageList = [];
  List categoriesLeft = [
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':'women cloth','colorRight':true},
    {'showRight':true,'text':"women's cloth gogogogogo",'colorRight':true},
    {'showRight':true,'text':"women's cloth",'colorRight':true},
    {'showRight':true,'text':"womennnnnn's cloth",'colorRight':true},
    {'showRight':true,'text':"women's cloth",'colorRight':true},
    {'showRight':true,'text':"women's cloth",'colorRight':true},
    {'showRight':true,'text':"women's cloth",'colorRight':true},
  ];
  getList (length){
    imageList.clear();
    for (var i = 0; i < length; i++) {
      imageList.add(Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/glnz.jpg',fit: BoxFit.contain,),
            Container(height: 10.0,),
            Text('glnz'),
          ],
        ),
      ));
    }
    setState(() {
      imageList = imageList;
    });
  }
  bool showBorder = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('categories'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            new Container(
              width: 100.0,
              child: ListView.builder(
                itemBuilder: (BuildContext context,int index) {
                  return Container(
                    width: 100.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(width:categoriesLeft[index]['showRight']?1.0:0.0,color: categoriesLeft[index]['colorRight']?Colors.red:Colors.white),
                          top: BorderSide(width:categoriesLeft[index]['showRight']?0.0:1.0,color: categoriesLeft[index]['colorRight']?Colors.white:Colors.red),
                          bottom: BorderSide(width:categoriesLeft[index]['showRight']?0.0:1.0,color: categoriesLeft[index]['colorRight']?Colors.white:Colors.red),
                        )
                    ),
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.all(
                           10.0
                        ),
                        child: Text(categoriesLeft[index]['text'],style: TextStyle(fontSize: 12,),softWrap:true,),
                      ),
                      onTap: (){
                        setState(() {
                          for (var i = 0; i < categoriesLeft.length; i++) {
                            if(i == index){
                              this.categoriesLeft[index]['showRight'] = false;
                              this.categoriesLeft[index]['colorRight'] = false;
                            }else{
                              this.categoriesLeft[i]['showRight'] = true;
                              this.categoriesLeft[i]['colorRight'] = true;
                            }
                          }
                        });
                      },
                    )
                  );
                },
                itemCount: categoriesLeft.length,
              ),
            ),
            new Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Container(
                          child: Image.asset('assets/images/glnz.jpg'),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 10.0,
                              bottom: 10.0
                          ),
                          child: Text('Hot Categories'),
                        ),
                      ),
                      SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                return Column(
                                  children: <Widget>[
                                    Image.asset('assets/images/glnz.jpg',fit: BoxFit.cover),
                                    Container(height: 10,),
                                    Text('glnz')
                                  ],
                                );
                              },
                              childCount: 9
                          ),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            childAspectRatio: 1,
                          )
                      ),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                                  (BuildContext context,int index){
                                return ExpansionTile(
                                  title: Text('更多精彩'),
                                  children: <Widget>[
                                    Container(
                                      height: ((index+1)/3).ceil()*95.0,
//                                      margin: EdgeInsets.all(5.0),
                                      child: GridView.extent(
                                        maxCrossAxisExtent: (MediaQuery.of(context).size.width - 120)/3,
//                                      padding: const EdgeInsets.all(4.0),
                                        children: imageList
                                      ),
                                    ),
                                  ],
                                  onExpansionChanged: (f){
                                    if(f){
                                      this.getList(index + 1);
                                    }
                                  },
                                );
                              },
                              childCount: 10
                          )
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
