import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CustomTextForm extends StatefulWidget {
  final String? nomeCampo;
  final String? dicaCampo;
  final Widget? icone;
  final bool? ativarCampo;
  final int? maxLenght;

  final Widget? suficone;
  final bool? fill;

  final TextEditingController? controller;
  final TextInputType? tipoTeclado;
  final TextInputAction? acaoTeclado;

  final FormFieldValidator<String>? validator;

  final bool esconderTexto;

  final Function(String)? onChanged;

  final int? maxLines;

  final bool circular;

  final bool isFilled;

  final Color? fillColor;

  final Color? textColor;

  final Color? activeTextColor;

  final Color? disableFieldColor;

  final Color? borderColor;

  final Color? labelTextColor;

  final Color? activeLabelTextColor;

  final TextInputFormatter? mask;

  final Color? activeBorderColor;

  CustomTextForm({
    this.dicaCampo,
    this.nomeCampo,
    this.ativarCampo,
    this.controller,
    this.esconderTexto = false,
    this.validator,
    this.maxLenght,
    this.tipoTeclado,
    this.acaoTeclado,
    this.icone,
    this.fill,
    this.suficone,
    this.onChanged,
    this.maxLines = 1,
    this.circular = true,
    this.isFilled = true,
    this.fillColor,
    this.textColor,
    this.disableFieldColor,
    this.borderColor,
    this.mask,
    this.activeTextColor,
    this.activeBorderColor,
    this.labelTextColor,
    this.activeLabelTextColor,
  });

  @override
  _CustomTextFormState createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  final FocusNode _focusNode = new FocusNode();
  bool focued = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
  }

  void _onFocusChange() {
    setState(() {
      focued = _focusNode.hasFocus;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      height: widget.maxLines == 1 ? 6.5.h : null,
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        obscureText: widget.esconderTexto,
        validator: widget.validator,
        enabled: widget.ativarCampo,
        onChanged: widget.onChanged,
        keyboardType: widget.tipoTeclado,
        textInputAction: widget.acaoTeclado,
        maxLength: widget.maxLenght,
        maxLines: widget.maxLines,
        inputFormatters: widget.mask != null ? [widget.mask!] : [],
        style: TextStyle(
          fontSize: 11.5.sp,
          color: focued
              ? (widget.activeTextColor ?? Colors.white)
              : (widget.textColor ?? Colors.white),
          fontFamily: "ubuntu-medium",
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          fillColor: widget.ativarCampo == false
              ? widget.disableFieldColor != null
                  ? widget.disableFieldColor
                  : Colors.grey
              : widget.isFilled == true
                  ? widget.fillColor != null
                      ? widget.fillColor
                      : Colors.grey.withOpacity(0.3)
                  : Colors.transparent,
          filled: widget.isFilled,
          prefixIcon: widget.icone,
          suffixIcon: widget.suficone,
          hintText: widget.dicaCampo,
          enabledBorder: widget.circular == true
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.borderColor != null
                        ? widget.borderColor!
                        : Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
          focusedBorder: widget.circular == true
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: widget.activeBorderColor != null
                        ? widget.activeBorderColor!
                        : AppColors.grey,
                    width: 2,
                  ),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
          errorBorder: widget.circular == true
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).errorColor,
                    width: 2,
                  ),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
          border: widget.circular == true
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
          errorStyle: TextStyle(
            fontSize: 11.5.sp,
            color: Theme.of(context).errorColor,
            fontFamily: "ubuntu-medium",
            fontWeight: FontWeight.bold,
          ),
          focusedErrorBorder: widget.circular == true
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).errorColor,
                  ),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
          labelText: widget.nomeCampo,
          labelStyle: TextStyle(
            fontSize: 12.5.sp,
            color: focued
                ? (widget.activeLabelTextColor ?? Colors.white)
                : (widget.labelTextColor ?? Colors.white),
            fontFamily: "ubuntu-medium",
          ),
          hintStyle: TextStyle(
            fontSize: 11.5.sp,
            color: widget.textColor ?? Colors.white,
            fontFamily: "ubuntu-medium",
          ),
          alignLabelWithHint: widget.maxLines == 1 ? null : true,
        ),
      ),
    );
  }
}
