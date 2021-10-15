import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:r_player_info/services/results.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override

  //making controllers for textfields
  final ignController = TextEditingController();
  final regionController = TextEditingController();

  //google says...
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    ignController.dispose();
    regionController.dispose();
    super.dispose();
  }



  //structure
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[

                  //first text
                  AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        'Welcome to LOL Player Info!',
                        textStyle: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Rota',
                          color: Colors.grey[300],
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),


                    ],
                    repeatForever: true,
                    pause: Duration(seconds:10),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),

                  SizedBox(height: 20.0,),

                  //second text
                  AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        'Please input the IGN and region down below:',
                        textStyle: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Rota',
                          color: Colors.grey[300],
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                    repeatForever: true,
                    pause: Duration(seconds:10),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),

                  SizedBox(height: 80.0),

                  //first textfield
                  Container(
                    width: 300.0,
                    child: TextField(
                      controller: ignController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'IGN...'
                ),
              ),
                  ),
                  SizedBox(height: 10.0),

                  //second textfield
                  Container(
                    width: 300.0,
                    child: TextField(
                      controller: regionController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Region...(EUNE Default)'
                      ),
                    ),
                  ),

                  SizedBox(height:55.0),

                  //submit button
                  Container(
                    height: 60,
                    width: 250,
                    child: FlatButton(
                      color: Colors.blue[600],
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, "/loading", arguments: {
                          'summonerID': ignController.text,
                          'region': regionController.text,
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            'Submit',
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

                  SizedBox(height:55.0),


            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Did you know?',
                  textStyle: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Rota',
                    color: Colors.orange[400],
                  ),
                  speed: const Duration(milliseconds: 300),
                ),
              ],
              pause: Duration(seconds: 5,),
              repeatForever: true,
              displayFullTextOnTap: true,
              stopPauseOnTap: false,
            ),

                  SizedBox(height: 10.0,),

                  //repeating 3 sentences
                  AnimatedTextKit(
                    animatedTexts: [
                     TyperAnimatedText(
                        'Renekton and Nasus are brothers.',
                        textStyle: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Rota',
                          color: Colors.grey[300],
                        ),
                      ),
                    TyperAnimatedText(
                      'Ezreal raped lux when she was 5.',
                      textStyle: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Rota',
                        color: Colors.grey[300],
                      ),
                    ),
                      TyperAnimatedText(
                        'Akali has a secret crush on Kayn.',
                        textStyle: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Rota',
                          color: Colors.grey[300],
                        ),
                      ),
                      TyperAnimatedText(
                        'Taric is gay',
                        textStyle: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Rota',
                          color: Colors.grey[300],
                        ),
                      ),
                      TyperAnimatedText(
                        'Some say Fiora is Professor Mcgongall',
                        textStyle: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Rota',
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                    pause: Duration(seconds: 6,),
                    repeatForever: true,
                    displayFullTextOnTap: true,
                    stopPauseOnTap: false,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
