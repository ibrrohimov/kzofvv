part of 'index.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "settings";

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("settings").tr(),
      ),
      body: AppContainer(
        hasTopPadding: true,
        child: Column(
          children: [
            AppCard(
              onTap: () {},
              child: BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.palette_rounded,
                          color: state ? null : Colors.white,
                        ),
                        SizedBox(width: context.spaceS),
                        Text(
                          "dark_mode",
                          style: context.semiBold14
                              ?.copyWith(color: state ? null : Colors.white),
                        ).tr(),
                      ],
                    ),
                    Container(
                      width: 50,
                      child: CupertinoSwitch(
                        activeColor: context.primary1,
                        value: !state,
                        onChanged: (val) {
                          context.read<ThemeCubit>().setTheme(!val);
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: context.spaceM),
            AppCard(
              onTap: showLanguageDialog,
              child: SizedBox(
                height: 40,
                child: BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.language,
                            color: state ? null : Colors.white,
                          ),
                          SizedBox(width: context.spaceS),
                          Text(
                            "select_language",
                            style: context.semiBold14
                                ?.copyWith(color: state ? null : Colors.white),
                          ).tr(),
                        ],
                      ),
                      BlocBuilder<LanguageCubit, String>(
                          builder: (context, lang) {
                        return Text(
                            EasyLocalization.of(context)
                                    ?.currentLocale
                                    ?.countryCode
                                    ?.toUpperCase() ??
                                'UZ',
                            style: context.semiBold18
                                ?.copyWith(color: state ? null : Colors.white));
                      })
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(15),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            title: Text(
              "select_language",
              style: context.extraBold18?.copyWith(
                color: state ? Colors.black : Colors.white,
              ),
            ).tr(),
            content: SizedBox(
              width: 500,
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor:
                      state ? context.greyScale3 : Colors.white,
                ),
                child: FormBuilderRadioGroup(
                  initialValue: EasyLocalization.of(context)
                      ?.currentLocale
                      ?.countryCode
                      ?.toLowerCase(),
                  onChanged: (value) {
                    EasyLocalization.of(context)!
                        .setLocale(Locale(value!, value.toUpperCase()));
                    context.read<LanguageCubit>().setLanguage(value);
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  orientation: OptionsOrientation.vertical,
                  name: 'language',
                  options: [
                    FormBuilderFieldOption(
                      value: 'uz',
                      child: Text(
                        "O'zbekcha",
                        style: context.regular18?.copyWith(
                          color: state ? null : Colors.white,
                        ),
                      ),
                    ),
                    FormBuilderFieldOption(
                      value: 'ru',
                      child: Text(
                        "Pусский язык",
                        style: context.regular18?.copyWith(
                          color: state ? null : Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "close",
                  style: context.semiBold18?.copyWith(
                    color: state ? null : Colors.white,
                  ),
                ).tr(),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Ok",
                  style: context.semiBold18?.copyWith(
                    color: state ? null : Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
