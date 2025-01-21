part of '_index.dart';

class SingleQuakeScreen extends StatefulWidget {
  final QuakeModel quake;
  const SingleQuakeScreen({super.key, required this.quake});
  static const String routeName = 'single_quake';

  @override
  State<SingleQuakeScreen> createState() => _SingleQuakeScreenState();
}

class _SingleQuakeScreenState extends State<SingleQuakeScreen> {
  final ScrollController _controller = ScrollController();
  bool isComment = false;

  // This is what you're looking for!
  void _scrollDown() async {
    await Future.delayed(Duration(milliseconds: 100));
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTab = context.read<TabCubit>().state;
    return BlocBuilder<LanguageCubit, String>(builder: (context, lang) {
      return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (currentTab == 1)
              SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isComment ? context.danger : null,
                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    setState(() {
                      isComment = !isComment;
                    });

                    _scrollDown();
                  },
                  child: Icon(isComment ? Icons.close : Icons.chat),
                ),
              ),
            Container(
              margin: EdgeInsets.only(left: context.spaceM),
              height: 60,
              width: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0088cc),
                  shape: CircleBorder(),
                ),
                onPressed: () {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'https',
                    path: 't.me/rcsm_fvv/${widget.quake.telegramMessageId}',
                  );

                  launchUrl(emailLaunchUri,
                      mode: LaunchMode.externalApplication);
                },
                child: Container(
                  child: SvgPicture.asset(
                    "assets/icons/bxl-telegram.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        appBar: AppBar(
          title: Text(
            lang == 'uz' ? widget.quake.regName : widget.quake.regNameRu,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: MapSample(quake: widget.quake),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                controller: _controller,
                child: AppContainer(
                  hasTopPadding: true,
                  child:
                      BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
                    return Column(
                      children: [
                        Text(
                          lang == 'uz'
                              ? widget.quake.regName
                              : widget.quake.regNameRu,
                          style: context.extraBold22?.copyWith(
                            color: state ? null : Colors.white,
                          ),
                        ),
                        SizedBox(height: context.spaceM),
                        Text(
                          (lang == 'uz'
                                  ? widget.quake.content
                                  : widget.quake.contentRu)
                              .trim(),
                          style: context.regular18?.copyWith(
                            color: state ? null : Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: context.spaceM),
                        if (isComment)
                          Column(
                            children: [
                              Text(
                                "leave_comment",
                                style: context.semiBold20?.copyWith(
                                  color: state ? null : Colors.white,
                                ),
                              ).tr(),
                              QuakeComment()
                            ],
                          ),
                        SizedBox(height: 80),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
