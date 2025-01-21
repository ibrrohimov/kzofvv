import 'package:flutter/material.dart';
import 'package:seysmoprognoz/core/entities/barrel.dart';
import 'package:seysmoprognoz/core/entities/menu_entity.dart';
import 'package:seysmoprognoz/core/entities/useful_content_entity.dart';
import 'package:seysmoprognoz/core/entities/useful_info_entity.dart';
import 'package:seysmoprognoz/core/widgets/index.dart';
import 'package:seysmoprognoz/features/tasks/presentation/pages/index.dart';

class AppColors {
  // static const Color primary1 = Color(0xFF4285f4);
  static const Color primary1 = Color(0xFF364F6B);
  static const Color primary2 = Color(0xFFE39701);
  static const Color darkPrimary1 = Color(0xFF121212);
  static const Color darkPrimary2 = Color(0xFF262626);
  static const Color primary3 = Color(0xFFEDF3FF);
  static const Color greyScale3 = Color(0xFF404040);
  static const Color greyScale4 = Color(0xFF555555);
  static const Color greyScale5 = Color(0xFF808080);
  static const Color greyScale6 = Color(0xFFCCCCCC);
  static const Color greyScale7 = Color(0xFFE9E9E9);
  static const Color greyScale9 = Color(0xFFF9F9F9);
  static const Color success = Color(0xFF27b414);
  static const Color danger = Color(0xFFfa3d55);
}

class AppSizes {
  static const double spaceXL = 40;
  static const double spaceL = 30;
  static const double spaceM = 15;
  static const double spaceS = 5;

  static const double buttonHeight = 56.0;
  static const double buttonRadius = 16.0;
}

class AppGlobals {
  static const insideRoom = [
    UsefulContentEntity(
      text:
          "Agar siz yer yoki binoning silkinishini sezsangiz, darhol xavfdan qutulishga harakat qiling, yeng katta xavfni yuqoridan tushadigan jismlar yaratishi mumkinligiga ahamiyat bering.",
      textRu:
          "Если вы чувствуете, что земля или здание трясутся, постарайтесь немедленно уйти от опасности, но обратите внимание на то, что предметы, падающие сверху, могут создать большую опасность.",
    ),
    UsefulContentEntity(
      text:
          "Agar siz ko‘p qavatli uyning birinchi qavatida xom g‘ishtli, pishgan g‘ishtli yoki paxsa devorli shaxsiy uylarda yashasangiz, zilzila boshlanishi bilan 15-20 soniya ichida darhol uyning ichidan tashqariga chiqib keting va elektir simlari, gaz quvurlari va baland imoratlar tagidan uzoqroqqa, ochiq joyga o‘ting.",
      textRu:
          "Если вы живете на первом этаже многоквартирного дома в частном доме со стенами из сырцового, жженого кирпича или соломы, немедленно в течение 15-20 секунд с начала землетрясения выйти из дома и избегать электрических проводов, газа трубы и высотные здания.Отойдите от базы на открытую площадку.",
    ),
    UsefulContentEntity(
      text:
          "Agar xonaning ichida qolsangiz, oldindan belgilab olingan xavfsiz joyga turib oling. Mabodo yuqoridan suvoq parchalari, yoritgich asboblari, oyna siniqlari tushadigan bo‘lsa, stol yoki karavotlar tagiga berkinib oling.Maktab o‘quvchilari partalarning tagiga kirib, boshlari va yuzlarini qo‘llari bilan berkitib olishlari zarur.",
      textRu:
          "Если вы остаетесь в помещении, перейдите в указанное безопасное место. При падении сверху кусков штукатурки, светильников, битого стекла укрыться под партами или кроватями Школьники должны зайти под парты и закрыть голову и лицо руками.",
    ),
    UsefulContentEntity(
      text:
          "Agar siz ko‘p qavatli uylar imoratlarning birinchi qavatidan yuqorida bo‘lsangiz, hech qachon lift yoki zinapoyalarga qarab yugurmang, chunki ko‘p hollarda yer qimirlash davrida zinalar birinchi navbatda qulaydi. Bunday hollarda uyning eshigini ochib, uning o‘rniga turing. Eshik kesakisi qotib qolsa, xavotir bo‘lmang, bu hol imorat devorlarining og‘ishidan bo‘ladi.",
      textRu:
          "Если вы находитесь выше первого этажа многоквартирного дома, никогда не бегите к лифту или лестнице, потому что в большинстве случаев во время землетрясения первыми достигаются лестницы. В таких случаях откройте дверь дома и встаньте на его место. Не переживайте, если дверной косяк станет жестким, это связано с отклонением стен здания.",
    ),
    UsefulContentEntity(
      text:
          "Har qanday binoning oynaband devorlaridan uzoqroqda, asosiy devori yonida turishga harakat qiling. Oyna to‘siqlaridan ehtiyot bo‘ling.",
      textRu:
          "Старайтесь стоять у капитальной стены любого здания, подальше от стеклянных стен. Будьте осторожны со стеклянными перегородками.",
    ),
    UsefulContentEntity(
      text:
          "Ikkinchi va undan yuqori qavatlarda bo‘lsangiz, zinhor derazadan pastga sakramang, chunki binoga zarar yetmasa ham, siz jarohatlanishingiz mumkin.",
      textRu:
          "Если вы находитесь на втором этаже и выше, не прыгайте из окна, потому что даже если здание не повреждено, вы можете получить травму.",
    ),
    UsefulContentEntity(
      text:
          "Sakrashga majbur bo‘lgan hollarda zinhor yopiq deraza oynasiga qarab sakramang, oynani taburetka yoki yelkangiz bilan sindirib, keyin sakrang.",
      textRu:
          "Если вам нужно прыгнуть, не прыгайте к закрытому окну, разбейте окно табуреткой или плечом, а затем прыгайте.",
    ),
    UsefulContentEntity(
      text:
          "Odamlar bilan gavjum joylarda (magazin, kinoteatr, maktab, oliygoh, vokzal) sarosimaga tushmang, binoning asosiy devorlariga, ustunlarga yaqinroq osilib turgan buyumlardan, qandil, konditsioner, reklama taxtalaridan uzoqroq turish kerak.",
      textRu:
          "Не путайтесь в местах скопления людей (магазин, кинотеатр, школа, университет, вокзал), держитесь подальше от предметов, висящих вплотную к капитальным стенам здания, колонн, люстр, кондиционеров, рекламных щитов.",
    ),
    UsefulContentEntity(
      text:
          "O‘zingizni xotirjam tuting, atrofingizdagilarni sarosimaga tushiradigan harakatlar qilmang, eshik va yo‘laklarda tirbandlikka yo‘l qo‘ymang.",
      textRu:
          "Сохраняйте спокойствие, не совершайте действий, сбивающих с толку окружающих, не допускайте движения в дверях и коридорах.",
    ),
    UsefulContentEntity(
      text:
          "Qishloq joylarida yer silkinishi oqibatida yer ko‘chkisi ro‘y berishi, sel kelishi, tog‘ toshlari tushishi mumkin. Shuning uchun tepaliklar ustiga yoki suv bosmaydigan, yuqoriroq joyga chiqib olishga yoki tik tog‘ yonbag‘irlari ostidan uzoqroq joylarga o‘tishga harakat qiling.",
      textRu:
          "Землетрясения могут вызывать оползни, наводнения и камнепады в сельской местности. Поэтому старайтесь перебраться через холмы или на возвышенности, которые не затапливаются, или спускайтесь дальше по крутым горным склонам.",
    ),
    UsefulContentEntity(
      text:
          "Molxonalar yonida turish mumkin yemas, chunki hurkib ketgan hayvonlar tagida qolib ketish xavfi mavjud.",
      textRu:
          "Не разрешается стоять возле хлева для скота, так как есть риск застрять под убегающими животными.",
    ),
  ];

  static const atStairs = [
    UsefulContentEntity(
      text:
          "Zilzila paytida zina yoki liftdan foydalanmang. Eshikni oching va uning orasiga turib oling.",
      textRu:
          "Не пользуйтесь лестницей или лифтом во время землетрясения.  Откройте дверь и встаньте между ней.",
    ),
  ];

  static const onRoadContent = [
    UsefulContentEntity(
      text:
          "Ko‘p qavatli bino ostida turgan bo‘lsangiz, ochiq joyga chiqishga harakat qiling, chunki bino silkinishi natijasida siniq parchalari ustingizga tushishi mumkin. Elektr simlari tagida ham turmang, uzulib ketishi mumkin. Uzilib ketgan simlardan ehtiyot bo‘ling.",
      textRu:
          "Если вы стоите под высотным зданием, постарайтесь выбраться на открытое пространство, так как здание трясется и на вас может упасть обломок. Не стойте и под электрическими проводами, они могут порваться. Остерегайтесь ослабленных проводов.",
    ),
    UsefulContentEntity(
      text:
          "Bino bo‘ylab uning tagida yugurmang, binoga kirmang, yuqoridan tushishi mumkin bo‘lgan bo‘laklar hayotingiz uchun xavfli.",
      textRu:
          "Не бегайте под ним по зданию, не входите в здание, осколки, которые могут упасть сверху, опасны для вашей жизни.",
    ),
    UsefulContentEntity(
      text:
          "Yer silkinayotgan vaqtda avtomobilda ketayotgan bo‘lsangiz, yuqori qavatli binolar, elektr simi, tik yonbag‘irlar, ko‘priklar, avtomobillarga yonilg‘i quyish shahobchasi, daryo o‘zanidan uzoqroq joylarga borib mashinani asta to‘xtating.",
      textRu:
          "Если вы ведете машину во время землетрясения, медленно останавливайтесь, двигаясь вдали от высотных зданий, линий электропередач, крутых склонов, мостов, заправочных станций и русел рек.",
    ),
  ];

  static const atHome = [
    UsefulContentEntity(
      text:
          "Yer silkinishi xavfi bo‘lganda binodan chiqish yo‘lini oldindan belgilab qo‘yish kerak. Yodingizda bo‘lsin - yer sikinishi yarim tunda ham yuz berishi mumkin. Chiqish yo‘llari, eshiklar odamlar bilan tirband bo‘lib, tashqariga tez chiqishni qiyinlashtiradi. Binoni zudlik bilan tark etish birinchi qavat derazalari orqali ham amalga oshiriladi.",
      textRu:
          "При угрозе землетрясений необходимо заранее определить выход из здания. Помните - землетрясения могут случиться даже посреди ночи. Выходы и двери забиты людьми, что затрудняет быстрый выход. Непосредственный выход из здания также возможен через окна первого этажа.",
    ),
    UsefulContentEntity(
      text:
          "Uyingizdagi xavfsiz joylarni oldindan belgilab qo‘ying, bu - xonaning asosiydevorlari orasidagi burchagi, ichkieshiklar o‘rni, stol, karavot, stanoklar osti bo‘lishi mumkin. Yer qimirlaganda uyning eng xavfli joylari – ichki va tashqi deraza ostilari, devorlarning oyna bilan qoplangan qismlari, ayniqsa oxirgi qavatlardagi burchakda joylashgan xonalar, lift va zinapoya maydonchalari bo‘lishi mumkinligini hisobga olish kerak.",
      textRu:
          "Заранее определите безопасные места в своем доме, это может быть угол между капитальными стенами комнаты, место межкомнатных дверей, стол, кровать, под машинами. Следует учитывать, что наиболее опасными местами дома при движении грунта являются внутренние и наружные окна, участки стен, застекленные, особенно угловые помещения последних этажей, лифты и лестничные клетки.",
    ),
    UsefulContentEntity(
      text:
          "Oila a’zolaringiz va bolalarga xavfsiz joyni egallashni o‘rgatish zarur.",
      textRu:
          "Необходимо научить членов семьи и детей занимать безопасное место.",
    ),
    UsefulContentEntity(
      text:
          "Oila a’zolaringiz va o‘zingiz kvartirangizda, pod’ezdda, uyingizda gaz, elektr, suvni o‘chirish yo‘llarini bilishingiz lozim.",
      textRu:
          "Вы и члены вашей семьи должны знать, как отключить газ, электричество и воду в квартире, на вокзале, в доме.",
    ),
    UsefulContentEntity(
      text:
          "Qariya, nogiron va bolalar xavfsiligini ta’minlash yo‘lini oldindan o‘ylab qo‘ying.",
      textRu:
          "Заранее продумайте, как обеспечить безопасность пожилых людей, инвалидов и детей.",
    ),
    UsefulContentEntity(
      text:
          "Xonalardagi shkaf, kitob javonlarni devorlarga mahkamlab qo‘ying. Uy jihozlarini uxlaydigan o‘rinlarga yiqilmaydigan holatda, eshik va chiqish yo‘llarini to‘sib qo‘ymaydigan qilib joylashtirish kerak.",
      textRu:
          "Прикрепите шкафы и книжные полки в комнатах к стенам. Бытовые приборы следует размещать таким образом, чтобы они не падали на спальные места и не блокировали двери и выходы.",
    ),
    UsefulContentEntity(
      text:
          "Javonlar, shkaflar ustidagi og‘ir buyumlar qattiq mahkamlab qo‘yilishi yoki odam ustiga tushib ketishi mumkin bo‘lgan buyumlar pastga yoki ishonchli joyga joylashtirilishi shart.",
      textRu:
          "Тяжелые предметы на полках, шкафах должны быть прочно закреплены, а предметы, которые могут упасть на человека, должны располагаться внизу или в безопасном месте.",
    ),
    UsefulContentEntity(
      text:
          "Javonlarni dam olish o‘rinlaridan, xonaga kirish eshigidan, rakovina va unitazlardan uzoqroq joyga o‘rnating.",
      textRu:
          "Установите полки подальше от мест отдыха, входа в помещение, раковин и унитазов.",
    ),
    UsefulContentEntity(
      text:
          "Uyga kirish yo‘lini, yo‘laklarni va zinapoyalarni buyumlar bilan to‘sib qo‘ymang.",
      textRu: "Не загромождать вход в дом, коридоры и лестницы предметами.",
    ),
    UsefulContentEntity(
      text:
          "Tez alangalanuvchi va o‘yuvchi suyuqliklar solingan idishlarni yer qimirlab, bino silkinganda tushib ketib, portlab yoki yonib ketmaydigan xavfsiz joyda saqlang.",
      textRu:
          "Храните емкости с легковоспламеняющимися и едкими жидкостями в безопасном месте, где они не упадут, не взорвутся и не загорятся при движении земли или сотрясении здания.",
    ),
    UsefulContentEntity(
      text:
          "Jarohatlanganda, umuman xar qanday xavf bo‘lganda birinchi tibbiy yordam ko‘rsatish choralarini o‘rganing. Doimo uyingizda dori-darmonlar, birinchi tibbiy yordam ko‘rsatish qutichasini saqlang.",
      textRu:
          "Изучите меры первой помощи при травмах или любой другой опасности. Всегда держите дома лекарство и аптечку.",
    ),
    UsefulContentEntity(
      text:
          "Garaj yoki dala hovli yerto‘lasidan yashirinish joyi sifatida foydalanish mumkin. U yerda ofat tugagunga qadar berkinish, oziq-ovqat zahirasini, kiyim kechak va kerakli narsalarni saqlash mumkin. Shu bilan birga, qaltis qiyaliklar va ko‘chki xavfi bo‘lgan joylarda qurilgan uylar xavfli bo‘lishi mumkinligi yodingizda bo‘lsin.",
      textRu:
          "В качестве тайника можно использовать гараж или подвал на заднем дворе. Там вы можете укрыться, хранить продукты, одежду и другие необходимые вещи, пока бедствие не закончится. В то же время имейте в виду, что дома, построенные на неустойчивых склонах и в местах с риском схода оползней, могут быть опасны.",
    ),
    UsefulContentEntity(
      text:
          "Uyingiz holatini tekshirib chiqing, uni mustahkamlash yo‘llarini aniqlang.",
      textRu: "Проверьте состояние своего дома, найдите способы его укрепить.",
    ),
    UsefulContentEntity(
      text:
          "Uyingiz yoki ish joyingiz qishloqdagi aholi yashayotgan joylarda joylashgan bo‘lsa, xavfli jarayonlar, ya’ni sel kelishi, ko‘chki xavfi bo‘lgan tog‘ xududida, suv bosishi mumkin bo‘lgan xududlarda ekanligini aniqlab, oila a’zolari va qo‘shnilar bilan birgalikda xavfsiz joyga chiqish yo‘llarini belgilab qo‘ying. Chunki yer silkinishi natijasida, yer ko‘chkisi, o‘pirilishi, siljishi, tosh ko‘chkisi, yerning yorilishi, tuproq qatlamlarining cho‘kishi, tuproqning siqilib, balchiqqa aylanish hollari yuz berishi mumkin.",
      textRu:
          "Если ваш дом или рабочее место находится в спальном районе населенного пункта, члены семьи вместе с соседями определяют пути выхода в безопасное место. Потому что в результате землетрясения могут произойти оползни, обвалы, оползни, обвалы камней, трещины в земле, проседание слоев грунта, уплотнение грунта и превращение в ил.",
    ),
  ];

  static const supportedLocales = [
    Locale('uz', 'UZ'),
    Locale('ru', 'RU'),
  ];

  static const statistics = [
    StatisticsEntity(color: Color(0xFFe1765a), title: "kunlik"),
    StatisticsEntity(color: Color(0xFFe1d45a), title: "haftalik"),
    StatisticsEntity(color: Color(0xFF5dbe74), title: "oylik"),
    StatisticsEntity(color: Color(0xFF8f9b9d), title: "yillik"),
  ];

  static const usefulInfo = [
    UsefulInfoEntity(
      title: "on_road",
      image: "assets/images/road.png",
      text: "on_road_desc",
      usefulContent: onRoadContent,
    ),
    UsefulInfoEntity(
      title: "at_home",
      image: "assets/images/house.png",
      text: "at_home_desc",
      usefulContent: atHome,
    ),
    UsefulInfoEntity(
      title: "at_stairs",
      image: "assets/images/stairs.png",
      text: "at_stairs_desc",
      usefulContent: atStairs,
    ),
    UsefulInfoEntity(
      title: "inside_room",
      image: "assets/images/room.png",
      text: "inside_room_desc",
      usefulContent: insideRoom,
    ),
  ];
  static const menuList = [
    MenuEntity(
      title: "statistics",
      icon: Icons.query_stats_outlined,
      routeName: "statistics",
    ),
    MenuEntity(
      title: "about_centre",
      icon: Icons.info_outline_rounded,
      routeName: "about",
    ),
    MenuEntity(
      title: "user_manual",
      icon: Icons.gavel_rounded,
      routeName: "user_manual",
    ),
    MenuEntity(
      bottomBorder: true,
      title: "settings",
      icon: Icons.settings,
      routeName: "settings",
    ),
    MenuEntity(
      bottomBorder: true,
      title: "early_warning",
      icon: Icons.warning,
      routeName: "early_warning",
    ),
  ];

  static const earthquakes = [
    EarthquakeEntity(
      icon: AppAssets.iconLaptop,
      title: "Tojikiston",
      taskCount: 6,
      routeName: TasksScreen.routeName,
    ),
    EarthquakeEntity(
      icon: AppAssets.iconLaptop,
      title: "Turkmaniston",
      taskCount: 6,
      routeName: TasksScreen.routeName,
    ),
    EarthquakeEntity(
      icon: AppAssets.iconLaptop,
      title: "O'zbekiston",
      taskCount: 6,
      routeName: TasksScreen.routeName,
      primary: false,
    ),
    EarthquakeEntity(
      icon: AppAssets.iconLaptop,
      title: "Tojikiston",
      taskCount: 6,
      routeName: TasksScreen.routeName,
    ),
    EarthquakeEntity(
      icon: AppAssets.iconLaptop,
      title: "Turkmaniston",
      taskCount: 6,
      routeName: TasksScreen.routeName,
    ),
    EarthquakeEntity(
      icon: AppAssets.iconLaptop,
      title: "O'zbekiston",
      taskCount: 6,
      routeName: TasksScreen.routeName,
      primary: false,
    ),
    EarthquakeEntity(
      icon: AppAssets.iconLaptop,
      title: "Tojikiston",
      taskCount: 6,
      routeName: TasksScreen.routeName,
    ),
    EarthquakeEntity(
      icon: AppAssets.iconLaptop,
      title: "Turkmaniston",
      taskCount: 6,
      routeName: TasksScreen.routeName,
    ),
    EarthquakeEntity(
      icon: AppAssets.iconLaptop,
      title: "O'zbekiston",
      taskCount: 6,
      routeName: TasksScreen.routeName,
      primary: false,
    ),
  ];

  static const tasks = [
    TaskEntity(
      task: "Start working out",
      type: "Personal project",
      priority: "Nice to have",
      timeframe: "Week",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
    ),
    TaskEntity(
      task: "Start working out",
      type: "Personal project",
      priority: "Personal project",
      timeframe: "Week",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
    ),
    TaskEntity(
      task: "Start working out",
      type: "Personal project",
      priority: "Personal project",
      timeframe: "Week",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
    ),
    TaskEntity(
      task: "Start working out",
      type: "Personal project",
      priority: "Personal project",
      timeframe: "Week",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
    ),
    TaskEntity(
      task: "Start working out",
      type: "Personal project",
      priority: "Personal project",
      timeframe: "Week",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
    ),
    TaskEntity(
      task: "Start working out",
      type: "Personal project",
      priority: "Personal project",
      timeframe: "Week",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
    ),
  ];

  static const taskTypes = [
    "Work",
    "Personal project",
    "Self",
  ];

  static const taskPriorities = [
    "Needs done",
    "Nice to have",
    "Nice idea",
  ];

  static const taskTimeframes = [
    "None",
    "Today",
    "3 Days",
    "Week",
    "Fortnight",
    "Month",
    "90 Days",
    "Year",
  ];
}

class AppAssets {
  static const String translationsPath = "assets/translations";
  static const String iconLaptop = "assets/icons/iconLaptop.png";
}
