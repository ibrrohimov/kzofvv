part of 'index.dart';

class CommonTextField extends StatefulWidget {
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
  final Widget? suffixIcon;
  final Widget? suffix;
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
  final TextEditingController? controller;

  CommonTextField({
    Key? key,
    this.labelText,
    this.suffix,
    this.controller,
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
    this.suffixIcon,
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
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
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
            return FormBuilderTextField(
              controller: widget.controller,
              textCapitalization: widget.textCapitalization,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              initialValue: widget.initialValue,
              enabled: widget.enabled,
              obscureText: widget.isPassword && !isVisible,
              onChanged: widget.onChanged,
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
              keyboardType: widget.keyboardType,
              style: context.regular18?.copyWith(
                color: state ? null : Colors.white,
              ),
              decoration: InputDecoration(
                suffixIconColor: state ? null : Colors.white,
                disabledBorder: enabledBorderStyle.copyWith(
                  borderSide: BorderSide(
                    color: state ? Color.fromRGBO(0, 0, 0, 0.12) : Colors.red,
                    width: 1.0,
                  ),
                ),
                errorMaxLines: 20,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16.5,
                ),
                border: OutlineInputBorder(),
                prefix: widget.prefix,
                filled: true,
                fillColor: state ? Colors.white : AppColors.darkPrimary2,
                floatingLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  // fontSize: 15,
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
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                suffix: widget.suffix,
                suffixStyle: context.extraBold14?.copyWith(
                  color: state ? null : Colors.white,
                ),
                labelText: widget.labelText,
                focusedErrorBorder: focusedErrorBorderStyle,
                errorStyle: TextStyle(
                  color: context.danger,
                ),
                errorBorder: focusedErrorBorderStyle,
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

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}
