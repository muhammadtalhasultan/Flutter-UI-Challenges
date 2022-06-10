import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.isPasswordField,
      required this.icon});
  final String hintText;
  final bool isPasswordField;
  final IconData icon;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFDDDDDD),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: TextFormField(
        style: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        obscureText: hidePassword,
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
          border: InputBorder.none,
          filled: true,
          // fillColor: const Color(0xFFF5F5F5),
          fillColor: Colors.white,
          suffixIcon: widget.isPasswordField
              ? IconButton(
                  icon: Icon(
                    hidePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    if (hidePassword) {
                      hidePassword = false;
                    } else {
                      hidePassword = true;
                    }
                    setState(() {});
                  },
                )
              : IconButton(
                  icon: Icon(
                    widget.icon,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
        ),
      ),
    );
  }
}
