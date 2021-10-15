import 'package:flutter/material.dart';
import 'package:r_player_info/services/results.dart';

class final_page extends StatefulWidget {


  @override
  _final_pageState createState() => _final_pageState();
}

class _final_pageState extends State<final_page> {

  Map data = {};

  //function that returns the right png text for the right rank
  String getEmblemText(String rank){
    if(rank == "IRON")
      return "Emblem_Iron.png";
    if(rank == "BRONZE")
      return "Emblem_Bronze.png";
    if(rank == "SILVER")
      return "Emblem_Silver.png";
    if(rank == "GOLD")
      return "Emblem_Gold.png";
    if(rank == "PLATINUM")
      return "Emblem_Platinum.png";
    if(rank == "DIAMOND")
      return "Emblem_Diamond.png";
    if(rank == "MASTER")
      return "Emblem_Master.png";
    if(rank == "GRANDMASTER")
      return "Emblem_Grandmaster.png";
    return "Emblem_Challenger.png";
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    Results results = data['resultsObject'];

    String emblemText;

    emblemText = getEmblemText(results.tier);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(

        children: <Widget>[
          SizedBox(height:50),
          Image.asset('assets/ranked-emblems/$emblemText'),
          SizedBox(height:10),
          Text(
              "${results.summonerID}, Level ${results.summonerLevel}",
              style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Rota',
              color: Colors.grey[300],
            ),
          ),
          SizedBox(height:10.0),
          Text(
              "${results.tier} ${results.rank}, with ${results.lp} LP.",
                style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Rota',
                color: Colors.grey[300],
          ),),
          SizedBox(height:10.0),
          Text(
              "${results.wins} wins and ${results.losses} losses.",
                style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Rota',
                color: Colors.grey[300],
          ),),
          SizedBox(height:25.0),

          Container(
              height: 60,
              width: 250,
              child: FlatButton(
                color: Colors.blue[600],
                onPressed: (){
                  Navigator.pushReplacementNamed(context, "/", arguments: {

                  });
                },

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 5, 5),
                  child: Text(
                      'Try another name',
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontFamily: 'Rota',
                        fontSize: 30.0,
                      )
                  ),

                ),
                shape: RoundedRectangleBorder(side: BorderSide(
                    color: Colors.grey,
                    width: 1,
                    style: BorderStyle.solid
                ), borderRadius: BorderRadius.circular(15)),
              )
          ),
        ]

    ),
      ),
    );
  }
}
