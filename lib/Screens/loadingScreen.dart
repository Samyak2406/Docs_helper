import 'dart:io';

import 'package:docshelper/Screens/BlankPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docshelper/myStorage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class loadingScreen extends StatefulWidget {
  static const id='loadingScreen';

  @override
  _loadingScreenState createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  void initState() {
    super.initState();
    loadRooms();
  }

  void loadRooms()async{
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<roomHandle>(context,listen: false).findRooms(context);
      Navigator.pushNamedAndRemoveUntil(context, BlankPage.id,(Route<dynamic> route) => false);

    });
//    final _store=Firestore.instance;
//    await for(var rooms in _store.collection(Provider.of<emails>(context,listen: false).UserEmail).snapshots()){
//      for(var room in rooms.documents){
//        myRooms.add(room.data['name']);
//      }
//      if(_store!=null){
//        break;
//      }
//    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: true,
        child: Column(
          children: <Widget>[
            Text('Internet...'),
          ],
        ),
      ),
    );
  }
}