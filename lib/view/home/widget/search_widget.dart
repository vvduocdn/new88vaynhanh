import 'package:flutter/material.dart';
import 'package:vaynow_flutter/component/theme.dart';
import 'package:vaynow_flutter/l10n/localization/app_localizations.dart';
import 'package:vaynow_flutter/utils/device_util.dart';
import 'package:vaynow_flutter/utils/styles.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode focusNode;
  final Function(String) onSearchChanged;

  const SearchWidget({
    super.key,
    required this.searchController,
    required this.focusNode,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 * DeviceUtils.getScreenHeight(context),
      padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 0),
      child: TextField(
        controller: searchController,
        focusNode: focusNode,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Vui lòng nhập số điện thoại',
          hintStyle: Styles.n15w4.copyWith(color: context.colors.main),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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
