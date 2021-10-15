import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:r_player_info/services/results.dart';
import 'package:r_player_info/pages/final_page.dart';

class Loading extends StatefulWidget {


  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



//function that recieves a region and summoner id, and activates all the functions ang gets results
  getResults(String rcvdRegion, String rcvdSummonerID) async{

    //creating the results object
    Results instance = Results(region: rcvdRegion, summonerID:rcvdSummonerID );
    await instance.getInfo();

    //moving on to final page
    Navigator.pushReplacementNamed(context, "/results", arguments: {
      'resultsObject': instance,
    });
  }

  //function for every time state is initiated
  @override
  void initState() {
    super.initState();

  }


  Map data = {};

  //main building widget
  @override
  Widget build(BuildContext context) {
    String finalRegion = "eun1";
    //recieving data from the previous page, and activating getResults with the data
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    //making it work for all euw spelling
    if(data['region'] == ("euw") || data['region'] == ("Euw"))
      finalRegion = "euw1";

    //making it work for all NA spelling
    if(data['region'] == ("Na") || data['region'] == ("NA") || data['region'] == ("na"))
      finalRegion = "na1";

    //activate getResults function
    getResults(finalRegion,data['summonerID']);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
      child: SpinKitFadingCube(
      color: Colors.white,
      size: 50.0,
        ),
      ),
    );
  }
}
