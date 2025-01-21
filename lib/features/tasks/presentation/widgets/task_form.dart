part of "index.dart";

class TaskForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  const TaskForm({super.key, required this.formKey});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  @override
  void initState() {
    final params = context.read<QuakeParamsCubit>().state;
    Future.delayed(Duration.zero, () async {
      widget.formKey.currentState!.patchValue(params);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formKey,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonTextField(
            name: 'regName',
            hintText: "area_name",
          ),
          SizedBox(height: context.spaceM),
          Row(
            children: [
              Expanded(
                child: CommonDateField(
                  name: 'from_day',
                  hintText: "from_day",
                ),
              ),
              SizedBox(width: context.spaceM),
              Expanded(
                child: CommonDateField(
                  name: 'to_day',
                  hintText: "to_day",
                ),
              ),
            ],
          ),
          SizedBox(height: context.spaceM + 10),
          CustomRangeSlider(
            name: 'magnitude',
            title: "magnitude",
          ),
          SizedBox(height: context.spaceM),
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  name: 'from_depth',
                  keyboardType: TextInputType.number,
                  hintText: "from_depth",
                  suffix: const Text("km").tr(),
                ),
              ),
              SizedBox(width: context.spaceM),
              Expanded(
                child: CommonTextField(
                  name: 'to_depth',
                  keyboardType: TextInputType.number,
                  hintText: "to_depth",
                  suffix: const Text("km").tr(),
                ),
              ),
            ],
          ),
          SizedBox(height: context.spaceM),
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  name: 'from_latitude',
                  keyboardType: TextInputType.number,
                  hintText: "from_latitude",
                  suffix: const Text("°"),
                ),
              ),
              SizedBox(width: context.spaceM),
              Expanded(
                child: CommonTextField(
                  name: 'to_latitude',
                  keyboardType: TextInputType.number,
                  hintText: "to_latitude",
                  suffix: const Text("°"),
                ),
              ),
            ],
          ),
          SizedBox(height: context.spaceM),
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  name: 'from_longtitude',
                  keyboardType: TextInputType.number,
                  hintText: "from_longtitude",
                  suffix: const Text("°"),
                ),
              ),
              SizedBox(width: context.spaceM),
              Expanded(
                child: CommonTextField(
                  name: 'to_longtitude',
                  keyboardType: TextInputType.number,
                  hintText: "to_longtitude",
                  suffix: const Text("°"),
                ),
              ),
            ],
          ),
          SizedBox(height: context.spaceM * 7),
        ],
      ),
    );
  }
}

class CustomRangeSlider extends StatelessWidget {
  final String name;
  final String title;

  const CustomRangeSlider({
    super.key,
    required this.name,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        overlayShape: SliderComponentShape.noOverlay,
        trackShape: CustomTrackShape(),
        rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 15),
      ),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return FormBuilderRangeSlider(
            minValueWidget: (min) => Text(
              min,
              style: context.regular15?.copyWith(
                color: context.greyScale5,
              ),
            ),
            maxValueWidget: (min) => Text(
              min,
              style: context.regular15?.copyWith(
                color: context.greyScale5,
              ),
            ),
            valueWidget: (min) => Text(
              min,
              style: context.regular15?.copyWith(
                color: context.greyScale5,
              ),
            ),
            activeColor: AppColors.primary1,
            inactiveColor: AppColors.greyScale7,
            name: name,
            initialValue: const RangeValues(0, 10),
            min: 0,
            max: 10,
            divisions: 20,
            decoration: InputDecoration(
              filled: true,
              fillColor: state ? Colors.white : AppColors.darkPrimary2,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: AppColors.greyScale7, width: 1.0),
              ),
              label: Text(
                title,
                style: context.regular20?.copyWith(
                  color: context.greyScale5,
                ),
              ).tr(),
            ),
          );
        },
      ),
    );
  }
}
