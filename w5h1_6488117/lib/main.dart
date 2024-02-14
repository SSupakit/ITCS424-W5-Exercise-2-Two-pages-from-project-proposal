import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.deepPurpleAccent),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(
        title: 'Project 1',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size; // Get the screen size
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: const Color.fromRGBO(16, 44, 87, 1), // Change background color
        padding:
            const EdgeInsets.all(20.0), // Add padding around the containers
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              for (var stepData in steps) // Loop through the step data
                _buildStepContainer(
                    stepData, screenSize), // Build step container
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 116, 204, 255),
        unselectedItemColor: Color.fromARGB(255, 82, 82, 82),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        onTap: (int index) {
          if (index == 3) {
            // Check if Settings item is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildStepContainer(StepData stepData, Size screenSize) {
    return Container(
      width: screenSize.width * 1, // Set width based on screen width
      height: screenSize.height * 0.15, // Set height based on screen height
      margin: const EdgeInsets.only(bottom: 20.0), // Set margin
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.83),
        borderRadius: BorderRadius.circular(10.0), // Set border radius
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(
                20.0, 10.0, 10.0, 10.0), // Set padding
            child: SizedBox(
              width: 115,
              height: 115,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255)
                      .withOpacity(0.95),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Icon(
                    Icons.help_outline,
                    size: 50,
                    color: const Color.fromARGB(255, 104, 104, 104)
                        .withOpacity(0.95),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 5), // Add some space between the icon and the text
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(2.0, 10.0, 30.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'STEP ${stepData.stepNumber}', // Display step number
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                      height: 5), // Add space between the title and description
                  Text(
                    stepData.description, // Display step description
                    style: TextStyle(
                      fontSize: 12.0,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 10.0, 30.0, 10.0),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Make the container circular
                        color: Color.fromARGB(255, 255, 112, 112)
                            .withOpacity(0.45), // Set the background color
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            Text(
                              '${stepData.percentage}%', // Display step percentage
                              style: TextStyle(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text(
          'Settings Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class StepData {
  final int stepNumber;
  final String description;
  final int percentage;

  StepData(this.stepNumber, this.description, this.percentage);
}

// Example list of step data
List<StepData> steps = [
  StepData(
      1,
      'Description for STEP 1 TEst TEst TEst TEst TEst TEst TEst TEst TEst TEst TEst',
      20),
  StepData(2, 'Description for STEP 2', 50),
  StepData(3, 'Description for STEP 3', 75),
  StepData(4, 'Description for STEP 4', 100),
];
