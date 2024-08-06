import 'package:flutter/material.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/l10n/localization/app_localizations.dart';
import 'package:new88_vaynow/utils/device_util.dart';
import 'package:new88_vaynow/utils/styles.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final String hinText;
  final TextInputType? keyboardType;
  const SearchWidget({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.hinText,
    required this.keyboardType,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 * DeviceUtils.getScreenHeight(context),
      padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 0),
      child: TextField(
        controller: searchController,
        keyboardType:  keyboardType,
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: Styles.n15w4.copyWith(color: context.colors.main),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: onSearchChanged,
      ),
    );
  }
}
