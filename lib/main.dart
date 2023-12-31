import 'package:destini_challenge/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: StoryPage(),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/background.png'),
        fit: BoxFit.cover,
      )),
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
      constraints: const BoxConstraints.expand(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 18,
              child: Center(
                child: Text(
                  storyBrain.getStory(),
                  style: const TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: Text(
                      storyBrain.getChoice1(),
                      style:
                          const TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 2,
              child: Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(2);
                    });
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: Text(
                      storyBrain.getChoice2(),
                      style:
                          const TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
