part of '_index.dart';

class Quakes extends StatefulWidget {
  final List<QuakeModel> quakes;
  final void Function(List<QuakeModel>) setFeltQuakes;
  final void Function(String?) setFilteredAllQuakes;

  const Quakes({
    super.key,
    required this.quakes,
    required this.setFeltQuakes,
    required this.setFilteredAllQuakes,
  });

  @override
  State<Quakes> createState() => _QuakesState();
}

class _QuakesState extends State<Quakes> {
  int page = 0;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (context.read<QuakesBloc>().state == QuakesInitial()) {
      context
          .read<QuakesBloc>()
          .add(GetQuakes(QuakeParamsModel(sezildimi: 1, page: 0)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<QuakeParamsCubit, Map>(
          listener: (context, state) {
            widget.setFeltQuakes([]);
          },
        ),
        BlocListener<QuakesBloc, QuakesState>(
          listener: (context, state) {
            if (state is GetQuakesSuccess) {
              _refreshController.refreshCompleted();
              _refreshController.loadComplete();
              widget.setFeltQuakes(widget.quakes + state.data);
              setState(() {
                page += 1;
              });
            } else if (state is GetQuakesError) {
              _refreshController.refreshFailed();
            }
          },
        ),
      ],
      child: SmartRefresher(
        footer: ClassicFooter(
          loadingText: "loadingText".tr(),
          canLoadingText: "canLoadingText".tr(),
          idleText: "idleTextFooter".tr(),
        ),
        header: ClassicHeader(
          idleText: "idleText".tr(),
          releaseText: "releaseText".tr(),
          refreshingText: "refreshingText".tr(),
          completeText: "completeText".tr(),
          failedText: "failedText".tr(),
        ),
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: () {
          final savedParams = buildQuakeParamsFromMap(
              formData: context.read<QuakeParamsCubit>().state);
          final params = savedParams.copyWith(
            sezildimi: 1,
            page: page,
          );
          context.read<QuakesBloc>().add(GetQuakes(params));
        },
        child: SingleChildScrollView(
          child: AppContainer(
              hasTopPadding: true,
              child: Column(
                children: [
                  // CommonTextField(
                  //   controller: controller,
                  //   onChanged: (v) {
                  //     widget.setFilteredAllQuakes(v);
                  //   },
                  //   name: 'task',
                  //   hintText: "area_name",
                  //   suffixIcon: Icon(Icons.search),
                  // ),
                  // SizedBox(height: context.spaceM),
                  BlocBuilder<QuakesBloc, QuakesState>(
                    builder: (context, state) {
                      if (state is GetQuakesSuccess) {
                        return Column(
                          children: _buildMenu(widget.quakes),
                        );
                      } else if (state is GetQuakesLoading &&
                          widget.quakes.isEmpty) {
                        return _buildMenuLoading();
                      } else if (state is GetQuakesLoading &&
                          widget.quakes.isNotEmpty) {
                        return Column(
                          children: _buildMenu(widget.quakes),
                        );
                      } else if (state is GetQuakesError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: context.semiBold22
                                ?.copyWith(color: context.danger),
                          ).tr(),
                        );
                      }
                      return _buildMenuLoading();
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _onRefresh() async {
    widget.setFeltQuakes([]);
    setState(() {
      page = 0;
    });
    context.read<QuakesBloc>().add(GetQuakes(QuakeParamsModel(
          sezildimi: 1,
          page: 0,
          regName: controller.text,
        )));
  }

  List<Widget> _buildMenu(List<QuakeModel> quakes) {
    return quakes
        .map((e) => QuakeCard(
              quake: e,
            ))
        .toList();
  }

  Widget _buildMenuLoading() {
    return Column(
      children: AppGlobals.earthquakes
          .map((e) => QuakeCard(loading: true, quake: QuakeModel()))
          .toList(),
    );
  }
}
