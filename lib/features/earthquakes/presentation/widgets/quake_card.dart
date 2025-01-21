part of '_index.dart';

class QuakeCard extends StatefulWidget {
  final QuakeModel quake;
  final bool loading;

  const QuakeCard({
    super.key,
    required this.quake,
    this.loading = false,
  });

  @override
  State<QuakeCard> createState() => _QuakeCardState();
}

class _QuakeCardState extends State<QuakeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.spaceM),
      child: Stack(
        children: [
          AppCard(
              bgColor: widget.loading
                  ? null
                  : widget.quake.sezildimi != 1
                      ? context.success
                      : context.danger,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  SingleQuakeScreen.routeName,
                  arguments: {
                    'quake': widget.quake,
                  },
                );
              },
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: const BoxConstraints(minWidth: 50),
                        child: ShimmerGenerator(
                          visible: widget.loading,
                          circle: true,
                          child: Text(
                            widget.quake.magnitude.toString(),
                            style: context.extraBold32?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerGenerator(
                              visible: widget.loading,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: BlocBuilder<LanguageCubit, String>(
                                        builder: (context, state) {
                                      return Text(
                                        state == 'uz'
                                            ? widget.quake.regName
                                            : widget.quake.regNameRu,
                                        style: context.extraBold18
                                            ?.copyWith(color: Colors.white),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: context.spaceS),
                            ShimmerGenerator(
                              visible: widget.loading,
                              child: Text(
                                '${'depth'.tr()}: ${widget.quake.depth.toString()} ${'km'.tr()}',
                                style: context.semiBold14
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ShimmerGenerator(
                      visible: widget.loading,
                      child: Text(
                        '${widget.quake.vaqt} ${widget.quake.localTime.substring(0, 5)}',
                        style: context.extraBold14
                            ?.copyWith(color: context.greyScale9),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
