part of '_index.dart';

class AllQuakes extends StatefulWidget {
  final List<QuakeModel> quakes;
  final void Function(List<QuakeModel>) setAllQuakes;
  final void Function(String?) setFilteredAllQuakes;
  const AllQuakes({
    super.key,
    required this.setFilteredAllQuakes,
    required this.quakes,
    required this.setAllQuakes,
  });

  @override
  State<AllQuakes> createState() => _AllQuakesState();
}

class _AllQuakesState extends State<AllQuakes> {
  int page = 0;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (context.read<QuakesAllBloc>().state == QuakesAllInitial()) {
      context
          .read<QuakesAllBloc>()
          .add(GetQuakesAll(QuakeParamsModel(sezildimi: 0, page: 0)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<QuakeParamsCubit, Map>(
          listener: (context, state) {
            widget.setAllQuakes([]);
          },
        ),
        BlocListener<QuakesAllBloc, QuakesAllState>(
          listener: (context, state) {
            if (state is GetQuakesAllSuccess) {
              _refreshController.refreshCompleted();
              _refreshController.loadComplete();
              widget.setAllQuakes(widget.quakes + state.data);
              print("RUUUUUUN");
              setState(() {
                page += 1;
              });
            } else if (state is GetQuakesAllError) {
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
          print(page);
          final params = savedParams.copyWith(
            sezildimi: 0,
            page: page,
          );
          context.read<QuakesAllBloc>().add(GetQuakesAll(params));
        },
        child: SingleChildScrollView(
          child: AppContainer(
            hasTopPadding: true,
            child: Column(
              children: [
                BlocBuilder<QuakesAllBloc, QuakesAllState>(
                  builder: (context, state) {
                    if (state is GetQuakesAllSuccess) {
                      return Column(
                        children: _buildMenu(widget.quakes),
                      );
                    } else if (state is GetQuakesAllLoading &&
                        widget.quakes.isEmpty) {
                      return _buildMenuLoading();
                    } else if (state is GetQuakesAllLoading &&
                        widget.quakes.isNotEmpty) {
                      return Column(
                        children: _buildMenu(widget.quakes),
                      );
                    } else if (state is GetQuakesAllError) {
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onRefresh() async {
    widget.setAllQuakes([]);
    setState(() {
      page = 0;
    });
    context.read<QuakesAllBloc>().add(
          GetQuakesAll(
            QuakeParamsModel(
              sezildimi: 0,
              page: 0,
              regName: controller.text,
            ),
          ),
        );
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
