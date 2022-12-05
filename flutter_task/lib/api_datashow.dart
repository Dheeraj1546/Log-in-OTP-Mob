import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/Album.dart';

class JakesGit extends StatefulWidget {
  // const JakesGit({Key? key}) : super(key: key);

  @override
  State<JakesGit> createState() => _JakesGitState();
}

class _JakesGitState extends State<JakesGit> {




  @override
  void initState() {

    print("object");
    getPostApi();
    print("object");
    // TODO: implement initState
    super.initState();
  }
  List<Album> postList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: Text("Jake's Git"),
        ),
        body: ListView.builder(
            itemCount: postList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(4, 4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(4, 4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        height: 60,
                        width: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(
                              postList[index].owner!.avatarUrl.toString()),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  (postList[index].language.toString()),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(postList[index].description.toString()),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Icon(
                                  //   Icons.data_array,
                                  //   color: Colors.black54,
                                  //   size: 25,
                                  // ),
                                  Text(
                                    "<>",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    (postList[index].language.toString()),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.adb,
                                            color: Colors.black54,
                                            size: 25,
                                          ),
                                          Text(
                                            (postList[index]
                                                .forksCount
                                                .toString()),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.account_circle_outlined,
                                            color: Colors.black54,
                                            size: 25,
                                          ),
                                          Text(
                                            (postList[index]
                                                .stargazersCount
                                                .toString()),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    )
                  ]));
            }));
  }
  Future<List<Album>> getPostApi() async {
    final resposne = await http.get(Uri.parse(
        'https://api.github.com/users/JakeWharton/repos?page=1&per_page=15'));
    var data = jsonDecode(resposne.body.toString());
    if (resposne.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(Album.fromJson(i));
      }

      return postList;
    } else {
      return postList;
    }
  }
}
