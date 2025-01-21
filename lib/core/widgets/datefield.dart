part of 'index.dart';

class CommonDateField extends StatefulWidget {
  final String? labelText;
  final String? topLabel;
  final String name;
  final bool autofocus;
  final dynamic validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final double? errMessageHeight;
  final void Function(String? v)? onChanged;
  final bool enabled;
  final bool isPassword;
  final bool isValidationVisible;
  final String? initialValue;
  final String? helperText;
  final String? hintText;
  final TextCapitalization textCapitalization;
  final bool primary;
  final bool required;

  CommonDateField({
    Key? key,
    this.labelText,
    this.required = false,
    this.hintText,
    this.textCapitalization = TextCapitalization.none,
    this.initialValue,
    this.topLabel,
    required this.name,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    this.isValidationVisible = true,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.prefixIcon,
    this.prefix,
    this.errMessageHeight,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onChanged,
    this.enabled = true,
    this.isPassword = false,
    this.helperText,
    this.primary = true,
  }) : super(key: key);

  @override
  State<CommonDateField> createState() => _CommonDateFieldState();
}

class _CommonDateFieldState extends State<CommonDateField> {
  bool isVisible = false;
  FocusNode focusNode = new FocusNode();

  void handleVisibility(bool v) {
    setState(() {
      isVisible = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.topLabel != null)
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              widget.topLabel!,
              style: context.regular20,
            ),
          ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(29, 0, 0, 0).withOpacity(0.05),
                spreadRadius: 0,
                blurRadius: 20,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
            return FormBuilderDateTimePicker(
              inputType: InputType.date,
              textCapitalization: widget.textCapitalization,
              // maxLines: widget.isPassword ? 1 : null,
              minLines: widget.minLines,
              enabled: widget.enabled,
              obscureText: widget.isPassword && !isVisible,
              key: widget.key,
              autovalidateMode:
                  widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
              inputFormatters: widget.inputFormatters,
              textInputAction: widget.textInputAction,
              validator: widget.validator ??
                  FormBuilderValidators.compose([
                    if (widget.required)
                      FormBuilderValidators.required(
                        errorText: "required_field".tr(),
                      ),
                  ]),
              name: widget.name,
              style: context.regular18?.copyWith(
                color: state ? null : Colors.white,
              ),
              decoration: InputDecoration(
                suffixIconColor: state ? null : Colors.white,
                focusColor: context.primary1,
                suffixIcon: Icon(Icons.date_range),
                disabledBorder: enabledBorderStyle.copyWith(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.12), width: 1.0),
                ),
                errorMaxLines: 20,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16.5,
                ),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(182, 255, 255, 255),
                ),
                prefix: widget.prefix,
                filled: true,
                fillColor: state ? Colors.white : AppColors.darkPrimary2,
                floatingLabelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
                enabledBorder: enabledBorderStyle.copyWith(
                  borderSide: BorderSide(
                    color: state
                        ? Color.fromRGBO(0, 0, 0, 0.12)
                        : context.greyScale5,
                    width: 1.0,
                  ),
                ),
                focusedBorder: focusedBorderStyle,
                // focusedErrorBorder: widget.isValidationVisible
                //     ? focusedErrorBorderStyle
                //     : focusedBorderStyle,
                // errorBorder: widget.isValidationVisible
                //     ? focusedErrorBorderStyle
                //     : focusedBorderStyle,
                prefixIcon: widget.prefixIcon,
                labelText: widget.labelText,
                helperText: widget.helperText,
                hintText: widget.hintText?.tr(),
                helperMaxLines: 300,
                hintStyle: context.regular15?.copyWith(
                  color: context.greyScale5,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
