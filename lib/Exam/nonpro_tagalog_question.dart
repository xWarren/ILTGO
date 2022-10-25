class NonProTQuestion {
  final String questionText;
  final List<NonProTAnswer> answerList;

  NonProTQuestion(this.questionText, this.answerList);
}

class NonProTAnswer {
  final String answerText;
  final bool isCorrect;

  NonProTAnswer(this.answerText, this.isCorrect);
}

List<NonProTQuestion> getQuestions() {
  List<NonProTQuestion> list = [];
  //Add Question and Answer here
  list.add(
      //1
      NonProTQuestion(
    "Ayon sa R.A. 4136, ang Student-driver's Permit ay dapat hindi bababa sa edad na:",
    [
      NonProTAnswer("16 na taong gulang", true),
      NonProTAnswer("18 na taong gulang", false),
      NonProTAnswer("20 na taong gulang", false),
    ],
  ));
  list.add(
      //2
      NonProTQuestion(
    "Sa anong pagkakataon hindi maaaring mag overtake?",
    [
      NonProTAnswer("Tuwing gabi", false),
      NonProTAnswer("Kung umuulan", false),
      NonProTAnswer("Sa blind curve", true),
    ],
  ));
  list.add(
      //3
      NonProTQuestion(
    "Ano ang maksimum at pinahihintulutang lapad ng saddle box o bag?",
    [
      NonProTAnswer("14 na pulgada mula sa magkabilang gilid", true),
      NonProTAnswer("16 na pulgada mula sa magkabilang gilid", false),
      NonProTAnswer("18 na pulgada mula sa magkabilang gilid", false),
    ],
  ));
  list.add(
      //4
      NonProTQuestion(
    "Ano ang dapat gawin kapag nagmamaneho sa highway na may maraming lubak?",
    [
      NonProTAnswer("Bilisan ang takbo", false),
      NonProTAnswer("Bagalan ang takbo", true),
      NonProTAnswer("Palaging lumipat ng daan o lane", false),
    ],
  ));
  list.add(
      //5
      NonProTQuestion(
    "Ang busina ay para sa:",
    [
      NonProTAnswer("Pampagising", false),
      NonProTAnswer("Ingay", false),
      NonProTAnswer("Magbigay babala para makaiwas sa disgrasya", true),
    ],
  ));
  list.add(
      //6
      NonProTQuestion(
    "Kailan ka maaaring mag-hintay sa dlaw o yellow box sa sangandaan?",
    [
      NonProTAnswer("Kapag ang traffic light ay pula", false),
      NonProTAnswer("Kapag nakatigil ka sa daloy ng trapiko", false),
      NonProTAnswer(
          "Hindi kailanman, ang sangandaan ay dapat malinis sa lahat ng oras",
          true),
    ],
  ));
  list.add(
      //7
      NonProTQuestion(
    "Kung higit sa isang drayber ang dumating sa four way stop, sino sa kanila ang may karapatan sa daan?",
    [
      NonProTAnswer(
          "Ang drayber na unang dumating ang siyang unang dapat na umandar",
          true),
      NonProTAnswer(
          "Ang drayber pa huling dumating ang siyang unang dapat na umandar",
          false),
      NonProTAnswer(
          "Ang drayber ng higit na malaking sasakyan ang siyang unang dapat na umandar",
          false),
    ],
  ));
  list.add(
      //8
      NonProTQuestion(
    "Ang drayber ay nararapat na laging magbigay ng daan sa mga sasakyang may blinkers at sirena na nakabukas dahil sila ay:",
    [
      NonProTAnswer("Malalaking sasakyan", false),
      NonProTAnswer("Maliliit na sasakyan", false),
      NonProTAnswer(
          "Sasakyang tumutugon sa gipit na kalagayan/emergency", true),
    ],
  ));
  list.add(
      //9
      NonProTQuestion(
    "Sino ang may prayoridad sa interseksiyon kung may dalawang sasakyan na dumating?",
    [
      NonProTAnswer("Ang sasakyang nasa kaliwa ang prayoridad", false),
      NonProTAnswer("May prayoridad ang higit na malaking sasakyan", false),
      NonProTAnswer("Ang sasakyang nasa kanan ang may prayoridad", true),
    ],
  ));
  list.add(
      //10
      NonProTQuestion(
    "Kung liliko pakanan, nararapat na:",
    [
      NonProTAnswer(
          "Bagalan ang takbo, manatili sa pinakalabas na bahagi ng daan at mag-signal upang lumiko sa kanan",
          true),
      NonProTAnswer(
          "Manatili sa kaliwang kalsada at mag-signal upang lumiko sa kanan 15 metro bago lumiko",
          false),
      NonProTAnswer(
          "Manatili sa kanang daan ng kalsada at mag-signal upang lumiko sa kanan 30 metro bago lumiko",
          false),
    ],
  ));
  list.add(
      //11
      NonProTQuestion(
          "Ang traffic sign na 'No Stopping' ay nangangahulugan na:", [
    NonProTAnswer(
        "Maaari kang huminto sandali kung magsasakay o magbababa ng pasahero ng mabilis",
        false),
    NonProTAnswer(
        "Hindi maaaring huminto maliban kung tatanggap ng tawag", false),
    NonProTAnswer(
        "Hindi ka maaaring huminto maliban kung pinapahinto ng traffic enforcers",
        true),
  ]));
  list.add(
      //12
      NonProTQuestion(
          "Totoo ba na ang di kumikilos na pulang trapikong ilaw ay nangangahulugang dapat kang huminto hanggang ang sangandaan ay maging maaliwalas para magpatuloy?",
          [
        NonProTAnswer("Totoo", false),
        NonProTAnswer("Hindi totoo", true),
        NonProTAnswer("Walang sagot", false),
      ]));
  list.add(
      //13
      NonProTQuestion(
          "Ayon sa mga sumusunod, alin ang HINDI ipinagbabawal ng Anti-Distracted Driving Act?",
          [
        NonProTAnswer("Pagbabasa ng e-books o e-mail", false),
        NonProTAnswer(
            "Pagpapadala o pagbabasa ng mensahe mula sa iyong mobile device",
            false),
        NonProTAnswer("Paggamit ng hands-free device", true),
      ]));
  list.add(
      //14
      NonProTQuestion(
          "Ang ibig sabihin ng dobleng puting putol-putol na linya sa daan ay:",
          [
        NonProTAnswer("Bawal na mag-overtake sa kaliwang parte", false),
        NonProTAnswer("Bawal na mag-overtake sa kanang parte", false),
        NonProTAnswer(
            "Pwede kang mag-overtake sa kaliwa o sa kanan kapag walang panganib",
            true),
      ]));
  list.add(
      //15
      NonProTQuestion(
          "Kung walang linya na minarkahan sa kalsada, dapat kang magmaneho:", [
    NonProTAnswer("Malapit sa kanang bahagi ng kalsada", true),
    NonProTAnswer("Kahit saang bahagi ng kalsada", false),
    NonProTAnswer("Sa gitna ng kalsada", false),
  ]));
  list.add(
      //16
      NonProTQuestion(
          "Ano ang nararapat mong gawin kung ikaw ay umiinom ng mga gamot na maaaring makaapekto sa iyong pagmamaneho?",
          [
        NonProTAnswer("Humingi ng payo sa doktor bago magmaneho", true),
        NonProTAnswer(
            "Magmaneho lamang kung may kasama na lisensyadong drayber", false),
        NonProTAnswer("Limitahan ang pagmamaneho sa umaga", false),
      ]));
  list.add(
      //17
      NonProTQuestion(
          "Ang bilis ng takbo ng sasakyan ay maaaring nakadepende sa:", [
    NonProTAnswer("Pagiging road worthy ng mga sasakyang minamaneho", false),
    NonProTAnswer("Kakayahan ng drayber", false),
    NonProTAnswer("Lahat ng nabanggit", true),
  ]));
  list.add(
      //18
      NonProTQuestion(
          "Ano ang dapat mong gawin kung pinapatakbo ka ng pulis pantrapiko kahit na pula na ang traffic light o senyas na nagpapahinto?",
          [
        NonProTAnswer(
            "Hindi ka dapat sumunod sapagkat kung susunod ka ay huhulihin ka",
            false),
        NonProTAnswer("Dapat kang sumunod", true),
        NonProTAnswer(
            "Hindi mo dapat pansinin ang pulis pantrapiko at hintayin ang traffic light na berde",
            false),
      ]));
  list.add(
      //19
      NonProTQuestion(
          "Ano ang ibig sabihin ng paunang babala sa pagtawid sa riles?", [
    NonProTAnswer("Upang bigyan ng abiso ang bilis ng motorista", false),
    NonProTAnswer(
        "Para balaan ang motorista na hindi sila maaaring pumarada kahit kailan",
        false),
    NonProTAnswer(
        "Para balaan ang mga motorista na may lebel ng pagtawid sa riles sa unahan",
        true),
  ]));
  list.add(
      //20
      NonProTQuestion(
          "Sa panahon ng pagkakasakit, ang iyong kakayahan sa pagmamaneho ay maaaring humina. Nararapat na ikaw ay:",
          [
        NonProTAnswer(
            "Uminom lamang ng mababang dose ng anumang uri ng gamot sa lahat ng panahon para masigurado ang kaligtasan",
            false),
        NonProTAnswer(
            "Laging bisitahin ang iyong doktor bago magmaneho, lalo na sa mahahabang biyahe",
            false),
        NonProTAnswer(
            "Maging malusog sa pangangatawan at pag-iisip at huwag magmaneho pagkatapos uminom ng gamot",
            true),
      ]));
  list.add(
      //21
      NonProTQuestion(
          "Ano ang maksimum na parusa para sa paulit-ulit na paglabag sa R.A. 10666 o Children's Safety on Motorcycle Act?",
          [
        NonProTAnswer("Pagkabilanggo ng anim (6) na taon", false),
        NonProTAnswer("Multang ₱50,000", false),
        NonProTAnswer("Pagbawi ng driver's license", true),
      ]));
  list.add(
      //22
      NonProTQuestion(
          "Ang drayber ng motorsiklo ay dapat palaging nag iingat. Upang magawa ito, sila ay nangangailangan na nakasuot ng:",
          [
        NonProTAnswer(
            "Mga helmet na laan sa trabahong pang-konstruksyon", false),
        NonProTAnswer("Standard protective helmets", true),
        NonProTAnswer("Sombrero ng police o gloves", false),
      ]));
  list.add(
      //23
      NonProTQuestion(
          "Kapag kailangan mo ng salamin sa mata para makakita ng maayos, kailan mo dapat ito isuot?",
          [
        NonProTAnswer("Sa pangit na panahon", false),
        NonProTAnswer("Sa mabigat na daloy ng trapiko", false),
        NonProTAnswer("Kapag nagmamaneho", true),
      ]));
  list.add(
      //24
      NonProTQuestion(
          "Sino ang responsable para siguraduhing hindi sobra sa dami ang nakasakay ng sasakyan?",
          [
        NonProTAnswer("Ang drayber ng sasakyan", true),
        NonProTAnswer("Ang nagpapasakay sa sasakyan", false),
        NonProTAnswer("Ang may ari ng sasakyan", false),
      ]));
  list.add(
      //25
      NonProTQuestion("Ang mga signal sa pagliko ay dapat gamitin", [
    NonProTAnswer("Bago umalis sa interseksiyon", false),
    NonProTAnswer("Habang patungo sa interseksiyon", false),
    NonProTAnswer("Bago lumiko sa interseksiyon", true),
  ]));
  list.add(
      //26
      NonProTQuestion(
          "Ang U-Turn ay ginagamit para baguhin ang direksiyon. Alin sa mga sumusunod ang pinapayagan?",
          [
        NonProTAnswer("Kung saan walang U-Turn sign na nakalagay", false),
        NonProTAnswer("Sa one-way na kalye", false),
        NonProTAnswer(
            "Kung walang sasakyan na paparating sa kabilang panig na magreresulta ng sagabal o masamang aksidente",
            true),
      ]));
  list.add(
      //27
      NonProTQuestion(
          "Ano ang magiging resulta ng hindi pagpatay ng signal light matapos lumiko mula sa interseksiyon?",
          [
        NonProTAnswer("Makakapagpapalito sa lahat ng mga nasa daan", true),
        NonProTAnswer("Makakapagpapalito sa lahat ng mga motorista", false),
        NonProTAnswer(
            "Makakapagpapalito sa mga tagapagpatupad ng batas pantrapiko",
            false),
      ]));
  list.add(
      //28
      NonProTQuestion(
          "Alin sa mga sumusunod ang gawaing paglabag sa pavement markings?", [
    NonProTAnswer("Pagbusina", false),
    NonProTAnswer("Biglaang pagbagal ng takbo habang naka-berdeng ilaw", false),
    NonProTAnswer(
        "Paghinto at pagbaba ng mga pasahero sa tawiran ng tao", true),
  ]));
  list.add(
      //29
      NonProTQuestion(
          "Ano ang dapat gawin ng isang drayber kung siya ay dadaan sa isang kalye na maraming tao na tumatawid?",
          [
        NonProTAnswer(
            "Bagalan ang takbo, maging alerto o maingat at tingnan kung ligtas ang pagdaan",
            true),
        NonProTAnswer("Magpatuloy sa normal na bilis ng takbo", false),
        NonProTAnswer("Bumusina at pailawin ang mga headlights", false),
      ]));
  list.add(
      //30
      NonProTQuestion(
          "Ang traffic light ay nagpalit mula sa berde pa dilaw habang pasangandaan ka. Ano ang dapat mong gawin?",
          [
        NonProTAnswer("Magpatuloy lang sa iyong kasalukuyang bilis", false),
        NonProTAnswer("Huminto kahit na nasa sangandaan", false),
        NonProTAnswer("Huminto bago magsangandaan", true),
      ]));
  list.add(
      //31
      NonProTQuestion(
          "Ang pagmamaneho ng higit na mabilis sa itinakdang bilis ay:", [
    NonProTAnswer(
        "Pinapayagan lamang kung mag-o-overtake sa isa pang sasakyan", false),
    NonProTAnswer(
        "Pinapayagan lamang kung ang ibang sasakyan ay magpapatakbo ng higit na mabilis sa itinakdang bilis",
        false),
    NonProTAnswer(
        "Ito ay ipinagbabawal ng batas maliban na lamang kung may emergency",
        true),
  ]));
  list.add(
      //32
      NonProTQuestion(
          "Magkano ang parusa para sa pangalawang opensa ng R.A 10666 Children's Safety on Motorcycle Act of 2015?",
          [
        NonProTAnswer("1,000 PHP", false),
        NonProTAnswer("5,000 PHP", true),
        NonProTAnswer("7,000 PHP", false),
      ]));
  list.add(
      //33
      NonProTQuestion("Paano ka naaapektuhan ng alak?", [
    NonProTAnswer("Pinabibilis nito ang iyong reaksiyon", false),
    NonProTAnswer("Pinabubuti nito ang iyong koordinasyon", false),
    NonProTAnswer("Pinapababa nito ang iyong konsentrasyon", true),
  ]));
  list.add(
      //34
      NonProTQuestion(
          "Ang kumikislap na dilaw na ilaw ay signal na nagpapahiwatig na dapat:",
          [
        NonProTAnswer("Bagalan ang takbo at magpatuloy kapag ligtas", true),
        NonProTAnswer("Ipagpatuloy ang kasalukuyang bilis", false),
        NonProTAnswer("Magmabilis", false),
      ]));
  list.add(
      //35
      NonProTQuestion("Kung balak mong bumagal o huminto, dapat mong:", [
    NonProTAnswer("Bumusina", false),
    NonProTAnswer(
        "Tapakan ang iyong preno nang magaan upang buksan ang iyong mga ilaw sa preno",
        true),
    NonProTAnswer("Manatili sa iyong linya pagkatapos huminto", false),
  ]));
  list.add(
      //36
      NonProTQuestion(
          "Kumpletuhin ang tamang sagot: Hindi mo dapat gamitin ang busina kapag ang iyong sasakyan ay nakatigil",
          [
        NonProTAnswer(
            "Maliban kung ang isang gumagalaw na sasakyan ay maaaring maging sanhi ng panganib",
            true),
        NonProTAnswer(
            "Maliban kung ito ay ginagamit lamang nang saglit", false),
        NonProTAnswer(
            "Maliban sa pagbigay na senyales na nakarating ka na", false),
      ]));
  list.add(
      //37
      NonProTQuestion(
          "Ang mga linya, simbolo, at mga salitang nakapinta sa kalsada ay tinawag na?",
          [
        NonProTAnswer("Mga traffic signal", false),
        NonProTAnswer("Pavement markings", true),
        NonProTAnswer("Traffic Hazards", false),
      ]));
  list.add(
      //38
      NonProTQuestion(
          "Ang kulay berdeng traffic light sa interseksiyon ay nangangahulugang:",
          [
        NonProTAnswer(
            "Pinahihintulutang tumawid ang mga tao sa lahat ng tawirang pantao",
            false),
        NonProTAnswer(
            "Hindi pinahihintulutang tumawid ang mga tao sa lahat ng tawirang pantao",
            false),
        NonProTAnswer(
            "Ang mga sasakyan sa kabilang kalsada ay nakahinto", true),
      ]));
  list.add(
      //39
      NonProTQuestion(
          "Sa anong pangyayari maaaring pumarada sa harapan ng pasukan ng ospital?",
          [
        NonProTAnswer("Kapag sumusundo ng pasyente", false),
        NonProTAnswer("Wala", true),
        NonProTAnswer("Kapag empleyado ka ng ospital", false),
      ]));
  list.add(
      //40
      NonProTQuestion(
          "Maiiwasan at mababawasan ang mga aksidente sa kalsada kung:", [
    NonProTAnswer(
        "Hindi binabale-wala ng mga drayber ang mga senyas pantrapiko", true),
    NonProTAnswer(
        "Ganap na binabale-wala ng mga drayber ang mga senyas pantrapiko",
        false),
    NonProTAnswer(
        "Hindi pinapansin ng mga drayber ang mga senyas pantrapiko sa mga partikular na lugar",
        false),
  ]));
  list.add(
      //41
      NonProTQuestion(
          "Aksidente kang nakabangga ng taong naglalakad. Ano ang unang dapat mong gawin?",
          [
        NonProTAnswer("Tulungan ang taong naglalakad", true),
        NonProTAnswer("Maghanap ng ligtas na lugar para pumarada", false),
        NonProTAnswer("Tumawag ng pulis", false),
      ]));
  list.add(
      //42
      NonProTQuestion("Ang sasakyan ay nakaparada kapag:", [
    NonProTAnswer(
        "Hindi gumagalaw ang sasakyan habang nagsasakay ng pasahero", false),
    NonProTAnswer(
        "Hindi gumagalaw ang sasakyan habang nagbababa ng pasahero", false),
    NonProTAnswer(
        "Ang sasakyan ay hindi gumagalaw habang patay ang makina", true),
  ]));
  list.add(
      //43
      NonProTQuestion(
          "Ano ang ibig sabihin ng isang paunang babala na may riles ng tren?",
          [
        NonProTAnswer(
            "Upang bigyan ng babala kaugnay ng bilis ng kanilang takbo", false),
        NonProTAnswer(
            "Upang balaan ang mga motorista na HINDI sila maaaring pumarada anumang oras",
            false),
        NonProTAnswer(
            "Upang balaan ang mga motorista na may riles ng tren sa unahang bahagi ng kalsada",
            true),
      ]));
  list.add(
      //44
      NonProTQuestion(
          "Habang nagmamaneho gusto mong lumiko pakaliwa sa minor na kalsada. Paano ang gagawin mo?",
          [
        NonProTAnswer("Manatili sa gitna ng daan", false),
        NonProTAnswer("Magmabilis na lumipat", false),
        NonProTAnswer("Huwag magmadali at ayusin lamang ang paglipat", true),
      ]));
  list.add(
      //45
      NonProTQuestion(
          "Hindi ka dapat gumamit ng mobile phone habang nagmamaneho:", [
    NonProTAnswer(
        "Dahil mahina ang pagtanggap kapag umaandar ang makina", false),
    NonProTAnswer(
        "Dahil makakaapekto ito sa mga electronic system ng sasakyan", false),
    NonProTAnswer("Dahil maaaring makasagabal ito sa iyong atensyon", true),
  ]));
  list.add(
      //46
      NonProTQuestion(
          "Kapag naka-enkuentro ka sa daan ng mga sasakyang pang-emergency kagaya ng ambulansya, fire truck na sumisirena, ano ang dapat mong gawin?",
          [
        NonProTAnswer("Huwag mo silang pansinin", false),
        NonProTAnswer(
            "Magbigay daan sa pamamagitan ng paggilid sa kanan o kaliwa", true),
        NonProTAnswer("Harangan ang kanilang daanan", false),
      ]));
  list.add(
      //47
      NonProTQuestion(
          "Ang bilis ng pagmamaneho mo sa gabi ay dapat nakadepende sa:", [
    NonProTAnswer("Pisikal at mental na kondisyon at husay ng drayber", false),
    NonProTAnswer("Kakayahan ng sasakyan at lagay ng panahon", false),
    NonProTAnswer("Lahat ng sagot", true),
  ]));
  list.add(
      //48
      NonProTQuestion("Ang paglipat ng linya sa sangandaan ay:", [
    NonProTAnswer("Napakaligtas", false),
    NonProTAnswer("Ligtas", false),
    NonProTAnswer("Hindi ligtas", true),
  ]));
  list.add(
      //49
      NonProTQuestion(
          "Kapag ginagamit ang pangunahing batas sa bilis bilang gabay, ang pagpili ng bilis ay nakadepende sa:",
          [
        NonProTAnswer("Bilis ng sasakyan na minamaneho", false),
        NonProTAnswer("Kasanayan ng drayber", false),
        NonProTAnswer("Lahat ng nabanggit", true),
      ]));
  list.add(
      //50
      NonProTQuestion(
          "Kailan ka dapat magsignal kung ikaw ay liliko pakanan?", [
    NonProTAnswer("Habang lumiliko", false),
    NonProTAnswer("Pagkatapos lumiko", false),
    NonProTAnswer("Bago lumiko", true),
  ]));
  return list;
}
