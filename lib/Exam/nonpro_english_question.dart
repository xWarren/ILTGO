class Question {
  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> NonProEQuestions() {
  List<Question> list = [];
  //Add Question and Answer here

  list.add(
      //1
      Question(
    "How does alcohol affect you?",
    [
      Answer("It speeds up your reaction", false),
      Answer("It improves your coordination", false),
      Answer("It reduces your concentration", true),
    ],
  ));
  list.add(
      //2
      Question(
    "What is the meaning of \"beating the red light\"?",
    [
      Answer("Driving faster upon seeing a yellow/amber light", true),
      Answer("Stopping on the green light", false),
      Answer("Stopping suddenly", false),
    ],
  ));
  list.add(
      //3
      Question(
    "Under R.A. 10666, which of the following phohibits the rider to convey a child?",
    [
      Answer("Where a speed limit of more than 40 kph is imposed", false),
      Answer("Where a speed limit of more than 50 kph is imposed", false),
      Answer("Where a speed limit of more than 60 kph is imposed", true),
    ],
  ));
  list.add(
      //4
      Question(
    "What should you do whenever you are driving on a highway with a lot of potholes?",
    [
      Answer("Increase speed", false),
      Answer("Decrease speed", true),
      Answer("Always change lane", false),
    ],
  ));
  list.add(
      //5
      Question(
    "Using a backbone motorcycle, which stand do you need to use when parking overnight?",
    [
      Answer("Side stand", false),
      Answer("Cross stand", false),
      Answer("Center stand", true),
    ],
  ));
  list.add(
      //6
      Question(
    "Which of the following can you adjust in order to reduce the chance of collision?",
    [
      Answer("Your speed and lane position", true),
      Answer("The sharpness of a curve", false),
      Answer("Another car's speed", false),
    ],
  ));
  list.add(
      //7
      Question(
    "Ahead of you is a vehicle with a flashing yellow light. This means it is:",
    [
      Answer("Broken down vehicle", false),
      Answer("Slow moving", true),
      Answer("A doctor's car", false),
    ],
  ));
  list.add(
      //8
      Question(
    "What should you do if the road is wet?",
    [
      Answer("Increase your speed", false),
      Answer("Keep on swerving", false),
      Answer("Slow down", true),
    ],
  ));
  list.add(
      //9
      Question(
    "A public utility vehicle can only be driven by holder of a:",
    [
      Answer("Student Permit", false),
      Answer("Non-Professional License", false),
      Answer("Professional License", true),
    ],
  ));
  list.add(
      //10
      Question(
    "Which of the traffic lights requires you to prepare for a stop?",
    [
      Answer("Yellow/Amber", true),
      Answer("Green", false),
      Answer("Red", false),
    ],
  ));
  list.add(
      //11
      Question(
    "A pedestrian runs across the street when you are about to move off from a red light. What should you do?",
    [
      Answer("Blow horn once and allow the pedestrian to cross", false),
      Answer("Wait until the pedestrian crossed", true),
      Answer("Expect the pedestrian to walk back", false),
    ],
  ));
  list.add(
      //12
      Question(
    "You are planning a long trip. Do you need to plan rest stops?",
    [
      Answer("No, you will arrive to your destination faster", false),
      Answer("No, only fuel stops will be needed", false),
      Answer("Yes, regular stops help avoid mental and physical fatigue", true),
    ],
  ));
  list.add(
      //13
      Question(
    "During period of illness, your ability to drive may be impaired. You must:",
    [
      Answer(
          "Only take smaller doses of any medicine at all times to ensure safety",
          false),
      Answer(
          "See your doctor each time before you drive, especially for long trips",
          false),
      Answer(
          "Be physically and mentally fit and do not drive after taking medicine",
          true),
    ],
  ));
  list.add(
      //14
      Question(
    "Under R.A. 10666 also known as Children\'s Safety on Motorcycle Act, the child must grasp the rider\'s waist, step and rest his/her feet comfortably on the foot peg, and",
    [
      Answer("He/She must be at least five(5) feet in height", false),
      Answer("He/She must weak standard protective helmet", true),
      Answer("He/She must have parent\'s consent", false),
    ],
  ));
  list.add(
      //15
      Question(
    "A blinking yellow traffic light means?",
    [
      Answer("Slow down and proceed if there is no danger", true),
      Answer("Wait for the green light", false),
      Answer("Stop and wait for the traffic light to change", false),
    ],
  ));
  list.add(
      //16
      Question(
    "When do you need to check your engine oil level?",
    [
      Answer("When the engine is hot", false),
      Answer("When the engine is running", false),
      Answer("When the engine is cold", true),
    ],
  ));
  list.add(
      //17
      Question(
    "Yellow box pavement marking is painted within intersections where no vehicle is allowed to",
    [
      Answer("Pass", false),
      Answer("Blow horn", false),
      Answer("Stop", true),
    ],
  ));
  list.add(
      //18
      Question(
    "What should the driver do if he/she is already within the intersection when the yellow traffic light comes?",
    [
      Answer("Slow down to allow other vehicles to cross", false),
      Answer("Stop automatically on the road", false),
      Answer("The driver may continue driving with caution", true),
    ],
  ));
  list.add(
      //19
      Question(
    "Why are rumble strips installed across the road?",
    [
      Answer("To help you keep the correct separation distance", false),
      Answer("To help you choose the correct lane", false),
      Answer("To make you alert and aware of your speed", true),
    ],
  ));
  list.add(
      //20
      Question(
    "Which one is a mandate of LTO?",
    [
      Answer("Issue certificate of emission compliance", false),
      Answer("Register roadworthy and emission complaint motor vehicles", true),
      Answer("Issue certificate of public convenience", false),
    ],
  ));
  list.add(
      //21
      Question(
    "The purpose of traffic laws, rules and regulations is to:",
    [
      Answer("Generate revenues for the government", false),
      Answer(
          "Establish an orderly movement of vehicles and pedestrian traffic and penalties",
          true),
      Answer("Discipline traffic enforcers", false),
    ],
  ));
  list.add(
      //22
      Question(
    "What is the authority granted by LTO to a person who desires to learn to operate a motor vehicle valid for a period of one year?",
    [
      Answer("Non-Professional Driver's License", false),
      Answer("Professional Driver's License", false),
      Answer("Student Driver's Permit", true),
    ],
  ));
  list.add(
      //23
      Question(
    "Signs that are round, inverted triangle or octagonal and with red colored border are called:",
    [
      Answer("Regulatory signs", true),
      Answer("Warning signs", false),
      Answer("Informative signs", false),
    ],
  ));
  list.add(
      //24
      Question(
    "You arrive at a crossroad. You want to turn left, and you have a green arrow light. Can you proceed?",
    [
      Answer(
          "Yes, you can turn left, as this is a \"protected\" turn where no other cars are allowed to enter the intersection ",
          true),
      Answer(
          "No, you cannot turn left unless you have a green left pointing arrow",
          false),
      Answer(
          "Yes, you can turn left, however you may still need to yield to pedestrians and incoming traffic",
          false),
    ],
  ));
  list.add(
      //25
      Question(
    "What should be done first before changing lanes?",
    [
      Answer("Make signal", true),
      Answer("Check the traffic ahead", false),
      Answer("Check mirrors for traffic behind", false),
    ],
  ));
  list.add(
      //26
      Question(
    "When is it legal to use the shoulder of a road when overtaking another vehicle?",
    [
      Answer("When the vehicle in front of you is making a right turn", false),
      Answer(
          "When the vehicle in front of you is visibly signaling to make a left turn",
          false),
      Answer(
          "During normal circumstances, you are not legally allowed to pass using the shoulder of a road",
          true),
    ],
  ));
  list.add(
      //27
      Question(
    "This action can cause you to skid and lose control when you make an abrupt move especially on a wet and possibly slippery road.",
    [
      Answer("Improper braking", true),
      Answer("Turning too slow", false),
      Answer("Accelerating too slow", false),
    ],
  ));
  list.add(
      //28
      Question(
    "To help reduce air pollution using your brake, what should you do?",
    [
      Answer("Brake properly", true),
      Answer("Brake frequently", false),
      Answer("Brake suddenly", false),
    ],
  ));
  list.add(
      //29
      Question(
    "Night driving is dangerous because:",
    [
      Answer("Street lights tend to blur your vision", false),
      Answer("More vehicles are on the road at night", false),
      Answer("The distance we can see ahead is reduced", true),
    ],
  ));
  list.add(
      //30
      Question(
    "You should not use a mobile phone while riding a motorcycle because:",
    [
      Answer("Reception is poor when the engine is running", false),
      Answer("It will affect your vehicle's electronic system", false),
      Answer(
          "It is prohibited by law and it distracts your attention while driving",
          true),
    ],
  ));
  list.add(
      //31
      Question(
    "What sign will constitute an offense if it will be disregarded?",
    [
      Answer("Regulatory Sign", true),
      Answer("Warning Sign", false),
      Answer("Informative Sign", false),
    ],
  ));
  list.add(
      //32
      Question(
    "A flashing green light means:",
    [
      Answer("Full stop", false),
      Answer("Proceed with caution", true),
      Answer(
          "Slow down and be ready to stop where a pedestrian cross the street",
          false),
    ],
  ));
  list.add(
      //33
      Question(
    "Graft and corruption in the traffic enforcement system can be eliminated by:",
    [
      Answer("Understanding the road and traffic rules and regulations", false),
      Answer("Understanding the road and traffic rules and regulations", false),
      Answer(
          "Self discipline by drivers and obeying traffic rules and regulations",
          true),
    ],
  ));
  list.add(
      //34
      Question(
    "Signs that are round, inverted triangle or octagonal and with red colored border are called:",
    [
      Answer("Regulatory signs", true),
      Answer("Warning signs", false),
      Answer("Informative signs", false),
    ],
  ));
  list.add(
      //35
      Question(
    "A driver while on a highway shall yield the right of way to:",
    [
      Answer("Pedestrians crossing within a crosswalk", true),
      Answer(
          "Pedestrians crossing at an intersection where the movement of traffic is being regulated by a traffic enforcer",
          false),
      Answer("Vehicles about to enter the highway", false),
    ],
  ));
  list.add(
      //36
      Question(
    "Among the list, who are exempted from speed limits?",
    [
      Answer("Drivers evading apprehension", false),
      Answer("Doctors or their drivers going to an emergency", true),
      Answer("Drivers of high ranking officials of the government", false),
    ],
  ));
  list.add(
      //37
      Question(
    "When do you need to switch on your turn signal?",
    [
      Answer("After turning", false),
      Answer("While turning", false),
      Answer("Before turning", true),
    ],
  ));
  list.add(
      //38
      Question(
    "What is the maximum penalty for driving under the influence of liquor or prohibited drugs?",
    [
      Answer("6 months suspension", false),
      Answer("1 year suspension", false),
      Answer("Perpetual revocation", true),
    ],
  ));
  list.add(
      //39
      Question(
    "If the brake light of the vehicle in front of your lights up, you should:",
    [
      Answer("Prepare to brake", true),
      Answer("Press the horn", false),
      Answer("Turn right or left", false),
    ],
  ));
  list.add(
      //40
      Question(
    "The primary objective of looking ahead while driving is:",
    [
      Answer("To check for the presence of traffic enforcers", false),
      Answer("To check the traffic ahead and changes of road condition", true),
      Answer("To check for road crash", false),
    ],
  ));
  return list;
}
