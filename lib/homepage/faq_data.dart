import 'package:iltgo/pages/faq.dart';

class FAQInfo {
  final String question;
  final String answer;
  FAQInfo(this.question, this.answer);
}

List<FAQInfo> faqinfos = [
  FAQInfo('How many questions are there in LTO exam?',
      'There are 40 questions for non-professional license exam, and 60 questions for professional drivers license exam.'),
  FAQInfo('What is the passing score in LTO exam?',
      'The passing score for non-professional driver exam is 30 out of 40; while for professional driver exam it is 45 out of 60.'),
  FAQInfo('How can I pass LTO exam?',
      'You need to pass both the actual driving test, and written exam to be able to pass the LTO exam.'),
  FAQInfo('What is the written test for driver\'s license?',
      'The LTO written test is a 40 (non-pro) to 60 (pro) item exam that consists of questions about road and traffic rules in the Philippines.'),
  FAQInfo('Is there a practical exam for non pro license?',
      'Yes, aside from the written or theoretical examination there is an actual driving test that you must pass to be able to get a non-pro driver\'s license.'),
  FAQInfo('What if I fail my license test?',
      'A driver\'s license applicant can retake the LTO exam one month after failing either or both written and actual driving tests. If you fail on the second attempt, you\'ll have to wait for one year to be able to reapply. Lastly, failure to pass the driving test on the third try and you\'ll have to wait for two years before you can reapply again.'),
];
