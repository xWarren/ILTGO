class ProQuestion {
  final String questionText;
  final List<ProAnswer> answerList;

  ProQuestion(this.questionText, this.answerList);
}

class ProAnswer {
  final String answerText;
  final bool isCorrect;

  ProAnswer(this.answerText, this.isCorrect);
}

List<ProQuestion> ProGetQuestions() {
  List<ProQuestion> list = [];
  //Add Question and Answer here

  list.add(
      //1
      ProQuestion(
    "Ayon sa R.A. 4136, ang Student-driver's Permit ay dapat hindi bababa sa edad na:",
    [
      ProAnswer("16 na taong gulang", true),
      ProAnswer("18 na taong gulang", false),
      ProAnswer("20 na taong gulang", false),
    ],
  ));
  list.add(
      //2
      ProQuestion(
    "Sa anong pagkakataon hindi maaaring mag overtake?",
    [
      ProAnswer("Tuwing gabi", false),
      ProAnswer("Kung umuulan", false),
      ProAnswer("Sa blind curve", true),
    ],
  ));
  list.add(
      //3
      ProQuestion(
    "Ano ang maksimum at pinahihintulutang lapad ng saddle box o bag?",
    [
      ProAnswer("14 na pulgada mula sa magkabilang gilid", true),
      ProAnswer("16 na pulgada mula sa magkabilang gilid", false),
      ProAnswer("18 na pulgada mula sa magkabilang gilid", false),
    ],
  ));
  list.add(
      //4
      ProQuestion(
    "Ano ang dapat gawin kapag nagmamaneho sa highway na may maraming lubak?",
    [
      ProAnswer("Bilisan ang takbo", false),
      ProAnswer("Bagalan ang takbo", true),
      ProAnswer("Palaging lumipat ng daan o lane", false),
    ],
  ));
  return list;
}
