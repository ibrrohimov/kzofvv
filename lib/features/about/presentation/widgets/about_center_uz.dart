import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';
import 'package:seysmoprognoz/core/cubit/theme_context.dart';
import 'package:seysmoprognoz/core/widgets/barrel.dart';

class AboutCenterUz extends StatelessWidget {
  const AboutCenterUz({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(builder: (context, theme) {
      return Column(
        children: [
          Text(
            "FAVQULODDA VAZIYATLAR VAZIRLIGI",
            style: context.regular18?.copyWith(
              color: theme ? null : Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.spaceS),
          Text(
            "Seysmoprognostik monitoring Respublika markazi to‘g‘risida \nMA’LUMOT",
            style: context.extraBold18?.copyWith(
              color: theme ? null : Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.spaceM),
          Text(
            '''O‘zbekiston Respublikasi Prezidentining “Favqulodda vaziyatlarning oldini olish va ularni bartaraf etish tizimi samaradorligini tubdan oshirish chora-tadbirlari to‘g‘risida”gi 2017-yil 1-iyun PF-5066-son Farmoniga asosan Seysmologiya institutining tezkor xabarlar xizmati va seysmik xavfning seysmologik monitoringi va prognostik monitoring respublika tarmog‘i bazasida O‘zbekiston Respublikasi Favqulodda vaziyatlar vazirligining seysmoprognostik monitoring Respublika markazi tashkil etildi va jami 50 ta stansiyalar Favqulodda vaziyatlar vazirligiga o‘tkazildi.

Seysmoprognostik monitoring Respublika markazi (keyingi o‘rinlarda Markaz deb yuritiladi) — qonun hujjatlarida belgilangan talablarga asosan o‘z faoliyatini amalga oshiradi, respublika va transchegaraviy hududlarda, shuningdek, tabiiy va texnogen xavfli hududlarda hamda muhim obyektlarda seysmik xavfsizlik bo‘yicha monitoringni tashkil etadi, kuchli va talafotli zilzilalar sodir bo‘lishi xavfi mavjud bo‘lganida ularning oqibatlarini bartaraf etish uchun zarur choralarni ko‘rish bo‘yicha takliflarni ishlab chiqadi.

Markaz o‘z ishini O‘zbekiston Respublikasi Favqulodda vaziyatlar vazirligining (yillik, yarim yillik va choraklik) rejalari, shuningdek, vazirlik topshiriq va ko‘rsatmalari asosida tashkil etadi.

Markaz o‘z faoliyatida O‘zbekiston Respublikasi Konstitutsiyasi qonunlariga, O‘zbekiston Respublikasi Oliy Majlis palatalarining qarorlariga, O‘zbekiston Respublikasi Prezidenti farmonlari, qarorlari va farmoyishlariga, O‘zbekiston Respublikasi Vazirlar Mahkamasi qarorlari va farmoyishlariga, vazirlik zimmasiga yuklatilgan vazifalar bo‘yicha xalqaro shartnomalarga, vazirlikning buyruq, buyruqnoma, farmoyish va huquqiy tusdagi boshqa hujjatlariga amal qiladi.

Markaz faoliyatiga O‘zbekiston Respublikasi Favqulodda vaziyatlar vaziri tomonidan lavozimga tayinlanadigan boshliq rahbarlik qiladi.

Markaz O‘zbekiston Respublikasi Favqulodda vaziyatlar vazirligining tarkibiy tuzilmasi hisoblanadi va bevosita Favqulodda vaziyatlar vazirining birinchi o‘rinbosari – Shtab boshlig‘iga bo‘ysunadi, faoliyatini vazirlikning Tashkiliy-tezkor boshqarmasi hamda Favqulodda vaziyatlarda harakat qilish va boshqarish milliy markazi bilan hamkorlikda amalga oshiradi.

O‘zbekiston Respublikasi Fanlar akademiyasining Seysmologiya instituti Markaz faoliyatini ilmiy-metodik tomondan ta’minlaydi.

Markaz Nizomi va uning tashkiliy tuzilmasi O‘zbekiston Respublikasi Favqulodda vaziyatlar vaziri tomonidan tasdiqlanadi.

Markaz yuridik shaxs hisoblanadi, o‘z balansiga, gerbli muhr va blank, shtamp va bankda o‘z hisob raqamiga ega bo‘lib, faoliyati O‘zbekiston Respublikasi Davlat budjetidan moliyalashtiriladi.''',
            style: context.regular16?.copyWith(
              color: theme ? null : Colors.white,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: context.spaceM),
          Text(
            "Markaz xodimlarining umumiy \nXIZMAT MAJBURIYATLARI",
            style: context.extraBold18?.copyWith(
              color: theme ? null : Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.spaceM),
          Text(
            '''
 Markaz xodimlarining umumiy majburiyatlari quyidagilardan iborat:

vazirlik hamda Markaz faoliyatini belgilovchi rahbarlik va normativ-huquqiy hujjatlar talablarini chuqur o‘zlashtirishi;

zilzilalarni monitoring qilish va kompleks-prognostik kuzatuvlar olib borish maqsadida ishlab chiqilgan yo‘riqnoma, qo‘llanma, ishlanmalar va dasturlar talablarini o‘zlashtirib, xizmat faoliyatida qo‘llay olishi;

egallab turgan lavozimi bo‘yicha xizmat majburiyatlarini va rahbariyat topshiriqlarini belgilangan muddatlarda, to‘liq va sifatli bajarib, o‘rnatilgan tartibda axborot berishi;

hujjatlarni ishlab chiqish jarayonida kasb va shtab madaniyati hamda ish yuritish bo‘yicha amaldagi me’yor va qoidalarga qat’iy rioya etishi;

o‘zining kasbiy, ma’naviy, jismoniy va siyosiy bilim darajasini muntazam ravishda oshirib borish bo‘yicha shug‘ullanishi;

avtomatlashtirilgan boshqaruv tizimi va zamonaviy axborot vositalari (orgtexnika)dan foydalana olishi;

o‘ziga biriktirilgan xizmat joyi (hududi)da tozalikni saqlash, xavfsizlik qoidalariga rioya qilishi, davlat mulkini avaylab-asrashi va ulardan oqilona foydalanishi;

vazirlik tizimida o‘tkaziladigan jamoatchilik ishlari va boshqa tadbirlar (ma’naviy, sport va b.)da faol ishtirok etishi;

davlat va xizmat sirlarini saqlay olishi;

Markaz rahbariyati tomonidan tasdiqlangan ish rejimi (kun tartibi)ga hamda ijro va xizmat intizomiga qat’iy rioya qilishi.
''',
            style: context.regular16?.copyWith(
              color: theme ? null : Colors.white,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      );
    });
  }
}
