part of '_index.dart';

class EarthQuakesScreen extends StatefulWidget {
  const EarthQuakesScreen({super.key});

  @override
  State<EarthQuakesScreen> createState() => _EarthQuakesScreenState();
}

class _EarthQuakesScreenState extends State<EarthQuakesScreen> {
  List<QuakeModel> allQuakes = [];
  List<QuakeModel> filteredAllQuakes = [];
  List<QuakeModel> filteredFeltQuakes = [];
  List<QuakeModel> feltQuakes = [];

  void setAllQuakes(List<QuakeModel> quakes) {
    setState(() {
      allQuakes = quakes;
      filteredAllQuakes = quakes;
    });
  }

  void setFeltQuakes(List<QuakeModel> quakes) {
    setState(() {
      feltQuakes = quakes;
      filteredFeltQuakes = quakes;
    });
  }

  void setFilteredAllQuakes(String? country) {
    final lang =
        EasyLocalization.of(context)?.currentLocale?.countryCode?.toLowerCase();

    setState(() {
      if (country != null) {
        filteredAllQuakes = allQuakes.where(
          (e) {
            final regName =
                e.regName.toLowerCase().contains(country.toLowerCase());
            final regNameRu =
                e.regNameRu.toLowerCase().contains(country.toLowerCase());

            return lang == 'uz' ? regName : regNameRu;
          },
        ).toList();
      } else {
        filteredAllQuakes = allQuakes;
      }
    });
  }

  void setFilteredFeltQuakes(String? country) {
    final lang =
        EasyLocalization.of(context)?.currentLocale?.countryCode?.toLowerCase();
    setState(() {
      if (country != null) {
        filteredFeltQuakes = feltQuakes.where(
          (e) {
            final regName =
                e.regName.toLowerCase().contains(country.toLowerCase());
            final regNameRu =
                e.regNameRu.toLowerCase().contains(country.toLowerCase());

            return lang == 'uz' ? regName : regNameRu;
          },
        ).toList();
      } else {
        filteredFeltQuakes = feltQuakes;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar:
              BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
            return Material(
              color: state ? Colors.white : AppColors.darkPrimary2,
              child: TabBar(
                onTap: (value) {
                  context.read<TabCubit>().setTab(value);
                },
                indicatorColor: Colors.transparent,
                labelStyle: context.semiBold18,
                tabs: const [
                  Tab(
                    icon: Icon(Icons.description),
                  ),
                  Tab(
                    icon: Icon(Icons.public),
                  ),
                  Tab(
                    icon: Icon(Icons.menu_book),
                  ),
                ],
              ),
            );
          }),
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.white,
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              AllQuakes(
                setFilteredAllQuakes: setFilteredAllQuakes,
                quakes: filteredAllQuakes,
                setAllQuakes: setAllQuakes,
              ),
              Quakes(
                quakes: filteredFeltQuakes,
                setFeltQuakes: setFeltQuakes,
                setFilteredAllQuakes: setFilteredFeltQuakes,
              ),
              UsefulInfoScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
