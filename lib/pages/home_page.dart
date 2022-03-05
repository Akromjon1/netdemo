import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';
class HomePage extends StatefulWidget {
static final String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? data;

  void _apiPostList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      showResponse(response!)
    });
  }
  void _apiPostList1(int id) {
    Network.GET(Network.API_LIST_SINGLE +  id.toString(), Network.paramsEmpty()).then((response) => {
      print(response),
      showResponse(response!)
    });
  }


  void _apiPostCreate(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      print(response),
      showResponse(response!),
    });
  }
  void _apiPostUpdate(Post post){
    Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post)).then((response) => {
      print(response),
      showResponse(response!),
    });
  }

  void _apiPostDelete(Post post){
    Network.DEl(Network.API_DELETE + post.id.toString(), Network.paramsEmpty()).then((response) => {
      print(response),
      showResponse(response!),
    });
  }

  void showResponse(String response) {
    setState(() {
      data = response;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = new Post(id: 1, title: "PDP", body: "Online", userId: 1);
    _apiPostDelete(post);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data! : "No data"),
      ),
    );
  }
}
