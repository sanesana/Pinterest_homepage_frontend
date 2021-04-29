import 'dart:html';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hovering/hovering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imageList = [
    'https://media4.giphy.com/media/xT5LMGV2XA93OY0jJe/200.webp?cid=ecf05e478ehz4213rdb28p344vlcawo9q5rywtxb9cztkhji&rid=200.webp&ct=g',
    'https://media3.giphy.com/media/TtGuVUZS4BVNlVIXg7/giphy.webp?cid=ecf05e478ehz4213rdb28p344vlcawo9q5rywtxb9cztkhji&rid=giphy.webp&ct=g',
    'https://media4.giphy.com/media/K5mhAi01uxnos/giphy.webp?cid=ecf05e478ehz4213rdb28p344vlcawo9q5rywtxb9cztkhji&rid=giphy.webp&ct=g',
    'https://images.unsplash.com/photo-1619228537027-bc8046bcfe47?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMTh8fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://media4.giphy.com/media/ZBJRkXmd6B7tgnL5Gg/200w.webp?cid=ecf05e478ehz4213rdb28p344vlcawo9q5rywtxb9cztkhji&rid=200w.webp&ct=g',
    'https://images.unsplash.com/photo-1619302403693-372e4ef5ec7f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1619261148110-61e742bb091e?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4OHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1619280839060-7c3d9a88a6c7?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMTN8fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1619279393644-d93debbad817?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMTR8fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://media1.giphy.com/media/5L2pp0U3jGcsi33gRq/giphy.gif?cid=ecf05e47uw4o06kzi0kjlnig6zs8igeunxdnc37ksif1lipg&rid=giphy.gif&ct=g',
    'https://images.unsplash.com/photo-1619216733911-b7812f666212?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDN8fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1521120098171-0400b4ec1319?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2lmfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1617182926345-205718965035?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z2lmfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1521120098171-0400b4ec1319?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2lmfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1619315970522-f9604be23f18?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1619186633721-1defa128860a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2MHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1618947084460-148223a0cbc7?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2MXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1618886400440-9d8c03f794ca?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3NHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1619293679707-dd6b54911bd6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3Nnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1619297292286-b3972ccddbbf?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3NXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1619264437738-0c22e4d22f27?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5MXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1619338163326-4afdb492826b?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60s',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Type here for Search",
            icon: Icon(
              Icons.menu,
              color: Colors.blueGrey,
            ),
            suffixIcon: Icon(
              Icons.account_box_sharp,
              color: Colors.blueGrey,
            ),
            prefixIcon: Icon(
              Icons.search_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: new StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: NetworkImage(imageList[index]),
                      fit: BoxFit.cover,
                    ),
                    // color: Colors.,
                    borderRadius: BorderRadius.all(Radius.circular(70))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(70)),
                  // child: FadeInImage.memoryNetwork(
                  //   placeholder: kTransparentImage,
                  //   // image: imageList[index],
                  //   fit: BoxFit.cover,
                  // ),
                  child: HoverWidget(
                    hoverChild: Container(
                      color: Colors.grey.withOpacity(0.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                HoverWidget(
                                    child: Positioned(
                                      bottom: 20,
                                      right: 20,
                                      child: Icon(
                                        Icons.linked_camera,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                    hoverChild: Icon(
                                      Icons.linked_camera,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    onHover: (event) {}),
                                HoverWidget(
                                    child: Positioned(
                                      bottom: 20,
                                      right: 20,
                                      child: Icon(
                                        Icons.link,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                    hoverChild: Icon(
                                      Icons.link,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    onHover: (event) {}),
                                HoverWidget(
                                    child: Icon(
                                      Icons.share,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    hoverChild: Icon(
                                      Icons.share,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    onHover: (event) {}),
                                // Padding(
                                //   padding: EdgeInsets.all(16.0),
                                //   // child: Text(''),
                                // ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.all(16.0),
                          //   child: Text('Hello World!'),/
                          // ),
                          // SizedBox(
                          //   height: 0.1,
                          // ),
                        ],
                      ),
                    ),
                    onHover: (event) {},
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
            }),
      ),
    );
  }
}
