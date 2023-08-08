import 'package:flutter/material.dart';
import 'storyEng.dart';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),

    );
  }
}



class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  storyEng eng = storyEng();
  bool res=true;
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Images/pexels-philippe-donn-1257860.jpg'),
          fit: BoxFit.cover
        )
      ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Expanded(


                flex: 12,
                child: Center(
                  child: Text(
                   eng.getStory(),
                    style: TextStyle(

                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    setState(() {
                      eng.nextStory(1);
                    });
                    res = eng.buttonShouldVisible();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  child: Text(
                   eng.getChoice1(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,


                child: Visibility(

                  visible: res,
                  child: TextButton(
                    onPressed: () {
                      //Choice 2 made by user.

                      setState(() {
                        eng.nextStory(2);
                      });
                      res = eng.buttonShouldVisible();
                      print(res);
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red
                    ),
                    child: Text(
                      eng.getChoice2(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/