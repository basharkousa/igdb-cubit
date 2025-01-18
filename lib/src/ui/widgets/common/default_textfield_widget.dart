import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:igameapp/src/utils/countrys.dart';
import 'package:igameapp/src/utils/validator.dart';

class DefaultTextField extends StatefulWidget {
   DefaultTextField(
      {super.key, this.fieldKey,
      this.hintText,
      this.labelText,
      this.title,
      this.helperText,
      this.onSaved,
      this.validator,
      this.initialValue,
      this.onFieldSubmitted,
      this.focusNode,
      this.onTapOutside,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.textInputAction,
      this.maxLines = 1,
      this.contentPadding,
      this.enabled,
      this.readOnly,
      this.inputFormatters,
      this.textStyle,
      this.prefixText,
      this.textDirection,
      this.textAlign = TextAlign.start,
      this.onChanged,
      this.onTap,
      this.isObscure = false,
      this.isRequired = true,
      this.textValidType = TextValidType.NONE,
      this.onCountryPickerInit,
      this.onCountryPickerChanged});

  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? title;
  final String? helperText;
  final String? initialValue;
  final String? prefixText;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isObscure;
  final bool? isRequired;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final readOnly;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final List<TextInputFormatter>? inputFormatters;
  late TextValidType textValidType;
  final ValueChanged<CountryCode>? onCountryPickerChanged;
  final ValueChanged<CountryCode?>? onCountryPickerInit;

  @override
  _DefaultTextFieldState createState() => _DefaultTextFieldState(isObscure!,
      onCountryPickerInit: onCountryPickerInit,
      onCountryPickerChanged: onCountryPickerChanged);
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool _obscureText = false;

  final Function(CountryCode)? onCountryPickerChanged;
  final Function(CountryCode)? onCountryPickerInit;

  _DefaultTextFieldState(bool isObscure,
      {this.onCountryPickerInit, this.onCountryPickerChanged}) {
    _obscureText = isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Marquee(
                  child: Text(widget.title ?? 'Title',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        // color: Color.fromRGBO(117, 117, 117, 1),
                        fontSize: 14.sp,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              widget.isRequired!
                  ? Text('*',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1.1764705882352942))
                  : Container(),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          widget.textValidType == TextValidType.PHONE
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      // flex: 75,
                      child: buildTextFormField(),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    buildCountryCodePicker()
                  ],
                )
              :  buildTextFormField()
        ],
      ),
    );
  }

  Widget buildCountryCodePicker() {
    return SizedBox(
      // width: 130.w,
      // height: 52.h,
      child: CountryCodePicker(
        countryList: CountryList.countryList,
        flagWidth: 22.w,
        boxDecoration: BoxDecoration(color: Get.theme.scaffoldBackgroundColor),
        showCountryOnly: true,
        hideSearch: true,
        enabled: false,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        closeIcon: Icon(Icons.close_rounded, color: Get.theme.hintColor),
        dialogTextStyle: TextStyle(
          fontSize: 14.sp,
        ),
        onInit: (value) {
          if (onCountryPickerInit != null) {
            onCountryPickerInit!(value!);
          }
          // controller.changeInitialCountryCode(value);
        },
        builder: (value) => buildCountryCodePickerRow(value),
        showDropDownButton: false,
        showFlagMain: true,
        onChanged: (value) {
          if (onCountryPickerChanged != null) {
            onCountryPickerChanged!(value);
          }
          // controller.changeInitialCountryCode(value);
          // controller.phoneNumberController.clear();
        },

        hideMainText: true,
        textStyle: TextStyle(color: Get.theme.hintColor),
        initialSelection: 'SA',
        flagDecoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.all(Radius.circular(4.r)),
        ),
        dialogSize: Size(80.w, 300.h),
      ),
    );
  }

  Widget buildCountryCodePickerRow(CountryCode? value) {
    if (value != null) {
      return Center(
        child: Container(
          height: 51.8.h,
          padding: EdgeInsetsDirectional.only(start: 10.w, end: 14.w),
          decoration: ShapeDecoration(
              // color: Colors.white,
              shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: Color(0xFFE7E7E7)),
            borderRadius: BorderRadius.circular(16.r),
          )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // buildCountryCodeDivider(),
              SizedBox(width: 3.w),
             //todo when we add more countries
             /* Icon(
                size: 20.h,
                Icons.keyboard_arrow_down_sharp,
                color: Get.isDarkMode ? Colors.grey : Colors.grey,
              ),*/
              SizedBox(width: 3.w),
              buildCountryCodeText(value),
              SizedBox(width: 5.w),
              buildCountryFlag(value),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildCountryCodeText(CountryCode value) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 4.h),
      child: Text(
        "${value.dialCode.toString().substring(1)}+",
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildCountryFlag(CountryCode value) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadiusDirectional.all(Radius.circular(40.r)),
      child: Image.asset(
        value.flagUri.toString(),
        package: 'country_code_picker',
        width: 22.h,
        height: 22.h,
        fit: BoxFit.fill,
      ),
    );
  }

  buildTextFormField() {
    return TextFormField(
      key: widget.fieldKey,
      textInputAction: widget.maxLines! > 1 ?TextInputAction.newline : TextInputAction.done,
      controller: widget.controller,
      obscureText: _obscureText,
      onSaved: widget.onSaved,
      textDirection: widget.textDirection,
      textAlign: widget.textAlign,
      validator: initValidator(widget.textValidType) ??
          widget.validator,
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      onFieldSubmitted: widget.onFieldSubmitted,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines ?? 1,
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      // onEditingComplete: widget.onEditingComplete,
      autofocus:false ,
      onTapOutside: widget.onTapOutside??(pointerDownEvent){
        print("onTapOutside");

      },
      // onEditingComplete: (){
      //   print("edit");
      // },
      onChanged: widget.onChanged ?? (value) {},
      decoration: InputDecoration(
        // labelText: widget.labelText??'label text',

        prefixText: widget.prefixText,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(
                vertical: 0.0, horizontal: 0.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
              width: 1.w, color: Color(0xFFE7E7E7)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
              width: 1.w, color: Color(0xFFE7E7E7)),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              // color: Get.theme.colorScheme.secondary,,
            )
          //  when the TextFormField in focused
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1.w,
              color: Color(0xFFE7E7E7),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1.w,
              color: Color(0xFFF31629),
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 2.w,
              color: Color(0xFFF31629),
            )),
        labelStyle: TextStyle(
          fontSize: 14.sp,
          color: Color(0xff333333),
        ),
        errorStyle: TextStyle(
          color: Color(0xFFF31629),
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,

        ),
        hintStyle: TextStyle(
          fontSize: 15.sp,
          color: const Color(0xffA1A1A1),
          // fontWeight: FontWeight.w500,
        ),
        hintText: widget.hintText ?? widget.title ?? '',
        helperText: widget.helperText,
        // icon: SvgPicture.asset(
        //   Assets.ic_lock,
        //   height: 14,
        //   width: 11,
        // ),
        suffixIcon: widget.isObscure!
            ? Padding(
              padding: EdgeInsetsDirectional.only(
            start: 14.0.w,
            end: 14.0.w,
          ),
              child: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: _obscureText
                  ? Icon(
                Icons.visibility_off_outlined,
                color: Color(0xFF9A9A9A),
              )
                  : Icon(
                Icons.visibility_outlined,
                color: Color(0xFF9A9A9A),
              )),
            )
            : Padding(
          padding: EdgeInsetsDirectional.only(
            start: 14.0.w,
            end: 14.0.w,
          ),
              child: widget.suffixIcon,
            ),
        prefixIcon: widget.maxLines! > 1 ? null :Padding(
          padding: EdgeInsetsDirectional.only(
            start: 14.0.w,
            end: 8.0.w,
          ),
          child: widget.prefixIcon,
        ),
        // prefixIconConstraints: BoxConstraints.loose(Size.infinite),
        // suffixIconConstraints: BoxConstraints.loose(Size.infinite),

        // errorText:""
      ),
      inputFormatters: widget.inputFormatters ?? [],
      style: widget.textStyle,
    );
  }

  String errorText = "";
  initValidator(TextValidType textValidType) {
    switch (textValidType) {
      case TextValidType.GENERAL:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            errorText = "\u26A0 fieldrequired";
            return "\u0021 Required Field!!";
          }
          // if (value != null &&
          //     value.contains(RegExp(r'[!@#%^&*();:_+>=.|,<]+'))) {
          //   errorText = '* Please enter a valid text!!';
          //   return '* Please enter a valid text!!';
          // }
        };
      case TextValidType.DATE:
        return (value) {
          if (Validator.instance.dateValidator(value)) {
            errorText = 'Enter the warranty expiration date';
            return 'Enter the warranty expiration date';
          }
        };

      case TextValidType.EMAIL:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return "\u0021 Required Field!!";
          }
          if (Validator.instance.emailValidator(value)) {
            return "\u0021 This email address is not valid!!";
          }
        };
      case TextValidType.PASSWORD:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return "\u0021 Required Field!!";
          }
          if (Validator.instance.passwordValidator(value)) {
            return "password";
          }
        };
      case TextValidType.PHONE:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            errorText = "\u0021 fieldrequired";
            return "\u0021 Required Field!!";
          }
          bool isValid = GetUtils.isPhoneNumber(value);
          print("validator $value");
          if (!isValid) {
            return 'Please enter the phone number in the correct format!! \u0021';
          }

        };
      case TextValidType.ENGLISH:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return "\u0021 Required Field!!";
          }
          if (value != null &&
              value.contains(RegExp(r'[!@#%^&*();:_+>=.,|<]+'))) {
            return '* Please enter your username correctly!!';
          }
          if (Validator.instance.textLanguageTypeValidator(value)) {
            return 'The field must be in English';
          }
        };

      case TextValidType.NUMBER:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return "\u0021 Required Field!!";
          }
          if (Validator.instance.numbarValidator(value)) {
            return "\u0021 Please enter numbers only";
          }
        };

      case TextValidType.CREATION_YEAR:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return "\u0021 Required Field!!";
          }
          if (Validator.instance.numbarValidator(value)) {
            return "\u0021 Please enter numbers only";
          }
          try{
            if(int.parse(value) > 2024 || int.parse(value) < 1885){
              return "\u0021 Please enter the year correctly";
            }
          }catch(e){
            return "\u0021 Please enter the year correctly";
          }

        };

      case TextValidType.PRICE:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return 'Price is required!!';
          }
          if (Validator.instance.checkPriceValue(int.tryParse(value))) {
            return 'At least 10,000 US';
          }
        };

      case TextValidType.NONE:
        if (widget.validator != null) {
          return widget.validator;
        }
    }
  }
}

enum TextValidType{
  GENERAL,
  EMAIL,
  PASSWORD,
  PHONE,
  NUMBER,
  NONE,
  ENGLISH,
  DATE,
  PRICE,
  CREATION_YEAR
}
