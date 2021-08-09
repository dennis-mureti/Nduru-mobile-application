import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;
import '../models/contact_model.dart';


import 'package:nduru_mobile_aplication/widget/navigation_drawer_widget.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  List<ContactModel>? model;

  set data(Map<String, dynamic> data) {}

  @override
  //  void initState(){
  //   //  getData();
  //    super.initState();
  //    getData().whenComplete(() {
  //       setState(() {});
  //   });
  //  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Your Contact Persons'),
      ),
      // ignore: unnecessary_null_comparison
      body: model == null ? Center (
        child: CircularProgressIndicator(),
      ) : 
      ListView.builder(itemBuilder: (BuildContext context, int index){
        return Card(
          child: ExpansionTile(title: Text('Contact Persons'),
          children: [
            Text('model![index].contacts')
          ],),
        );
      },
      itemCount: model!.length,
      ),
    );
  }
  

  // Future<void> getData() async{
  //   Uri url = Uri.http('10.0.2.2:8000', '/api/emergencies/all');
  //   http.Response res = await http.get(url);
  //   print(res.body);
  //   List<dynamic> body = cnv.jsonDecode(res.body); 
  //   model = body.map((dynamic item) => EmergenciesModel.fromJson(item)).toList();

    // Map<String, dynamic> body = new Map<String, dynamic>.from(cnv.jsonDecode(res.body));
    	
    // Map<String, dynamic> item = new Map<String, dynamic>.from(res.['body']);
    // data = item;

  //   setState(() {
  //   });
  // }
}
