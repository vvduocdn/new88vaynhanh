import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('de'), Locale('en'), Locale('vi')];

  /// No description provided for @r0.
  ///
  /// In en, this message translates to:
  /// **'Confirm exit'**
  String get r0;

  /// No description provided for @r1.
  ///
  /// In en, this message translates to:
  /// **'Hello,'**
  String get r1;

  /// No description provided for @r2.
  ///
  /// In en, this message translates to:
  /// **'Start ordering now'**
  String get r2;

  /// No description provided for @r3.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get r3;

  /// No description provided for @r4.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to leave the restaurant? Thank you for using our service.'**
  String get r4;

  /// No description provided for @r5.
  ///
  /// In en, this message translates to:
  /// **'Stay'**
  String get r5;

  /// No description provided for @r6.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get r6;

  /// No description provided for @r7.
  ///
  /// In en, this message translates to:
  /// **'CUISINE'**
  String get r7;

  /// No description provided for @r8.
  ///
  /// In en, this message translates to:
  /// **'RECOMMENDED FOR YOU'**
  String get r8;

  /// No description provided for @r9.
  ///
  /// In en, this message translates to:
  /// **'LOGO\nRESTAURANT'**
  String get r9;

  /// No description provided for @r10.
  ///
  /// In en, this message translates to:
  /// **'Delicious food, great experience'**
  String get r10;

  /// No description provided for @r11.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get r11;

  /// No description provided for @r12.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get r12;

  /// No description provided for @r13.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get r13;

  /// No description provided for @r14.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get r14;

  /// No description provided for @r15.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get r15;

  /// No description provided for @r16.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get r16;

  /// No description provided for @r17.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get r17;

  /// No description provided for @r18.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get r18;

  /// No description provided for @r19.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get r19;

  /// No description provided for @r20.
  ///
  /// In en, this message translates to:
  /// **'Choose size'**
  String get r20;

  /// No description provided for @r21.
  ///
  /// In en, this message translates to:
  /// **'No options'**
  String get r21;

  /// No description provided for @r22.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get r22;

  /// No description provided for @r23.
  ///
  /// In en, this message translates to:
  /// **'Let the restaurant know your request'**
  String get r23;

  /// No description provided for @r24.
  ///
  /// In en, this message translates to:
  /// **'Pickup'**
  String get r24;

  /// No description provided for @r25.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get r25;

  /// No description provided for @r26.
  ///
  /// In en, this message translates to:
  /// **'Cart is empty'**
  String get r26;

  /// No description provided for @r27.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get r27;

  /// No description provided for @r28.
  ///
  /// In en, this message translates to:
  /// **'Search for food or restaurant'**
  String get r28;

  /// No description provided for @r29.
  ///
  /// In en, this message translates to:
  /// **'Confirm order'**
  String get r29;

  /// No description provided for @r30.
  ///
  /// In en, this message translates to:
  /// **'Applicable fees'**
  String get r30;

  /// No description provided for @r31.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get r31;

  /// No description provided for @r32.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get r32;

  /// No description provided for @r33.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get r33;

  /// No description provided for @r34.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get r34;

  /// No description provided for @r35.
  ///
  /// In en, this message translates to:
  /// **'View order details'**
  String get r35;

  /// No description provided for @r36.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get r36;

  /// No description provided for @r37.
  ///
  /// In en, this message translates to:
  /// **'Viewed'**
  String get r37;

  /// No description provided for @r38.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get r38;

  /// No description provided for @r39.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get r39;

  /// No description provided for @r40.
  ///
  /// In en, this message translates to:
  /// **'Call restaurant'**
  String get r40;

  /// No description provided for @r41.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get r41;

  /// No description provided for @r42.
  ///
  /// In en, this message translates to:
  /// **'Order time'**
  String get r42;

  /// No description provided for @r43.
  ///
  /// In en, this message translates to:
  /// **'Order code'**
  String get r43;

  /// No description provided for @r44.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get r44;

  /// No description provided for @r45.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get r45;

  /// No description provided for @r46.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get r46;

  /// No description provided for @r47.
  ///
  /// In en, this message translates to:
  /// **'Delivery to'**
  String get r47;

  /// No description provided for @r48.
  ///
  /// In en, this message translates to:
  /// **'Order status'**
  String get r48;

  /// No description provided for @r49.
  ///
  /// In en, this message translates to:
  /// **'Order details'**
  String get r49;

  /// No description provided for @r50.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get r50;

  /// No description provided for @r51.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get r51;

  /// No description provided for @r52.
  ///
  /// In en, this message translates to:
  /// **'Old password'**
  String get r52;

  /// No description provided for @r53.
  ///
  /// In en, this message translates to:
  /// **'Please enter your old password now'**
  String get r53;

  /// No description provided for @r54.
  ///
  /// In en, this message translates to:
  /// **'No spaces allowed'**
  String get r54;

  /// No description provided for @r55.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get r55;

  /// No description provided for @r56.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get r56;

  /// No description provided for @r57.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password now'**
  String get r57;

  /// No description provided for @r58.
  ///
  /// In en, this message translates to:
  /// **'Re-enter new password'**
  String get r58;

  /// No description provided for @r59.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get r59;

  /// No description provided for @r60.
  ///
  /// In en, this message translates to:
  /// **'Password changed\nsuccessfully'**
  String get r60;

  /// No description provided for @r61.
  ///
  /// In en, this message translates to:
  /// **'Your password has been successfully changed'**
  String get r61;

  /// No description provided for @r62.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get r62;

  /// No description provided for @r63.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get r63;

  /// No description provided for @r64.
  ///
  /// In en, this message translates to:
  /// **'See you again!'**
  String get r64;

  /// No description provided for @r65.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get r65;

  /// No description provided for @r66.
  ///
  /// In en, this message translates to:
  /// **'item'**
  String get r66;

  /// No description provided for @r67.
  ///
  /// In en, this message translates to:
  /// **'Order code copied successfully'**
  String get r67;

  /// No description provided for @r68.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get r68;

  /// No description provided for @r69.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get r69;

  /// No description provided for @r70.
  ///
  /// In en, this message translates to:
  /// **'Notification management'**
  String get r70;

  /// No description provided for @r71.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get r71;

  /// No description provided for @r72.
  ///
  /// In en, this message translates to:
  /// **'No results found:'**
  String get r72;

  /// No description provided for @r73.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get r73;

  /// No description provided for @r74.
  ///
  /// In en, this message translates to:
  /// **'Promotions'**
  String get r74;

  /// No description provided for @r75.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get r75;

  /// No description provided for @r76.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get r76;

  /// No description provided for @r77.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get r77;

  /// No description provided for @r78.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get r78;

  /// No description provided for @r79.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get r79;

  /// No description provided for @r80.
  ///
  /// In en, this message translates to:
  /// **'Please enter your address'**
  String get r80;

  /// No description provided for @r81.
  ///
  /// In en, this message translates to:
  /// **'Please enter your city'**
  String get r81;

  /// No description provided for @r82.
  ///
  /// In en, this message translates to:
  /// **'Please enter your hometown'**
  String get r82;

  /// No description provided for @r83.
  ///
  /// In en, this message translates to:
  /// **'Please enter your postal code'**
  String get r83;

  /// No description provided for @r84.
  ///
  /// In en, this message translates to:
  /// **'Please enter your specific address'**
  String get r84;

  /// No description provided for @r85.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get r85;

  /// No description provided for @r86.
  ///
  /// In en, this message translates to:
  /// **'New address'**
  String get r86;

  /// No description provided for @r87.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get r87;

  /// No description provided for @r88.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get r88;

  /// No description provided for @r89.
  ///
  /// In en, this message translates to:
  /// **'Opening hours'**
  String get r89;

  /// No description provided for @r90.
  ///
  /// In en, this message translates to:
  /// **'Promotions'**
  String get r90;

  /// No description provided for @r91.
  ///
  /// In en, this message translates to:
  /// **'Monthly deals'**
  String get r91;

  /// No description provided for @r92.
  ///
  /// In en, this message translates to:
  /// **'High-class deals'**
  String get r92;

  /// No description provided for @r93.
  ///
  /// In en, this message translates to:
  /// **'undefined'**
  String get r93;

  /// No description provided for @r94.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get r94;

  /// No description provided for @r95.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get r95;

  /// No description provided for @r96.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email now'**
  String get r96;

  /// No description provided for @r97.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get r97;

  /// No description provided for @r98.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password now'**
  String get r98;

  /// No description provided for @r99.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get r99;

  /// No description provided for @r100.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get r100;

  /// No description provided for @r101.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get r101;

  /// No description provided for @r102.
  ///
  /// In en, this message translates to:
  /// **' Sign up now'**
  String get r102;

  /// No description provided for @r103.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get r103;

  /// No description provided for @r104.
  ///
  /// In en, this message translates to:
  /// **'Please sign up for an account to continue'**
  String get r104;

  /// No description provided for @r105.
  ///
  /// In en, this message translates to:
  /// **'Invalid email!'**
  String get r105;

  /// No description provided for @r106.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get r106;

  /// No description provided for @r107.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name now'**
  String get r107;

  /// No description provided for @r108.
  ///
  /// In en, this message translates to:
  /// **'Name must be more than 6 characters'**
  String get r108;

  /// No description provided for @r109.
  ///
  /// In en, this message translates to:
  /// **'Enter phone'**
  String get r109;

  /// No description provided for @r110.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone now'**
  String get r110;

  /// No description provided for @r111.
  ///
  /// In en, this message translates to:
  /// **'Phone must be more than 10 characters'**
  String get r111;

  /// No description provided for @r112.
  ///
  /// In en, this message translates to:
  /// **'Re-enter password'**
  String get r112;

  /// No description provided for @r113.
  ///
  /// In en, this message translates to:
  /// **'Log in now'**
  String get r113;

  /// No description provided for @r114.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get r114;

  /// No description provided for @r115.
  ///
  /// In en, this message translates to:
  /// **'Order successful'**
  String get r115;

  /// No description provided for @r116.
  ///
  /// In en, this message translates to:
  /// **'Your order has been successfully placed. We will prepare it right away!'**
  String get r116;

  /// No description provided for @r117.
  ///
  /// In en, this message translates to:
  /// **'Follow order'**
  String get r117;

  /// No description provided for @r118.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get r118;

  /// No description provided for @r119.
  ///
  /// In en, this message translates to:
  /// **'Choose up to'**
  String get r119;

  /// No description provided for @r120.
  ///
  /// In en, this message translates to:
  /// **'Empty cart. Please add items to continue'**
  String get r120;

  /// No description provided for @r121.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all information'**
  String get r121;

  /// No description provided for @r122.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get r122;

  /// No description provided for @r123.
  ///
  /// In en, this message translates to:
  /// **'Estimated delivery'**
  String get r123;

  /// No description provided for @r124.
  ///
  /// In en, this message translates to:
  /// **'Delivery address notes'**
  String get r124;

  /// No description provided for @r125.
  ///
  /// In en, this message translates to:
  /// **'No phone number'**
  String get r125;

  /// No description provided for @r126.
  ///
  /// In en, this message translates to:
  /// **'Enter code'**
  String get r126;

  /// No description provided for @r127.
  ///
  /// In en, this message translates to:
  /// **'Promo code'**
  String get r127;

  /// No description provided for @r128.
  ///
  /// In en, this message translates to:
  /// **'My promotions'**
  String get r128;

  /// No description provided for @r129.
  ///
  /// In en, this message translates to:
  /// **'There are 5 promotions'**
  String get r129;

  /// No description provided for @r130.
  ///
  /// In en, this message translates to:
  /// **'Login successful'**
  String get r130;

  /// No description provided for @r131.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get r131;

  /// No description provided for @r132.
  ///
  /// In en, this message translates to:
  /// **'Cannot perform this operation.\nPlease check your internet!!'**
  String get r132;

  /// No description provided for @r133.
  ///
  /// In en, this message translates to:
  /// **'Registration successful'**
  String get r133;

  /// No description provided for @r134.
  ///
  /// In en, this message translates to:
  /// **'Registration failed'**
  String get r134;

  /// No description provided for @r135.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again'**
  String get r135;

  /// No description provided for @r136.
  ///
  /// In en, this message translates to:
  /// **'Product added to cart successfully'**
  String get r136;

  /// No description provided for @r137.
  ///
  /// In en, this message translates to:
  /// **'Product deleted successfully'**
  String get r137;

  /// No description provided for @r138.
  ///
  /// In en, this message translates to:
  /// **'Product deletion failed'**
  String get r138;

  /// No description provided for @r139.
  ///
  /// In en, this message translates to:
  /// **'Deleting all products failed'**
  String get r139;

  /// No description provided for @r140.
  ///
  /// In en, this message translates to:
  /// **'All products deleted successfully'**
  String get r140;

  /// No description provided for @r141.
  ///
  /// In en, this message translates to:
  /// **'Cart is empty'**
  String get r141;

  /// No description provided for @r142.
  ///
  /// In en, this message translates to:
  /// **'Adding product to cart failed'**
  String get r142;

  /// No description provided for @r143.
  ///
  /// In en, this message translates to:
  /// **'Shipping address deleted successfully'**
  String get r143;

  /// No description provided for @r144.
  ///
  /// In en, this message translates to:
  /// **'Shipping address deletion failed'**
  String get r144;

  /// No description provided for @r145.
  ///
  /// In en, this message translates to:
  /// **'Delivery time'**
  String get r145;

  /// No description provided for @r146.
  ///
  /// In en, this message translates to:
  /// **'Choose delivery time'**
  String get r146;

  /// No description provided for @r147.
  ///
  /// In en, this message translates to:
  /// **'Add address'**
  String get r147;

  /// No description provided for @r148.
  ///
  /// In en, this message translates to:
  /// **'Shipping address added successfully'**
  String get r148;

  /// No description provided for @r149.
  ///
  /// In en, this message translates to:
  /// **'Adding shipping address failed'**
  String get r149;

  /// No description provided for @r150.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get r150;

  /// No description provided for @r151.
  ///
  /// In en, this message translates to:
  /// **'Update address'**
  String get r151;

  /// No description provided for @r152.
  ///
  /// In en, this message translates to:
  /// **'Restaurant address'**
  String get r152;

  /// No description provided for @r153.
  ///
  /// In en, this message translates to:
  /// **'Recipient information'**
  String get r153;

  /// No description provided for @r154.
  ///
  /// In en, this message translates to:
  /// **'Delivery address'**
  String get r154;

  /// No description provided for @r155.
  ///
  /// In en, this message translates to:
  /// **'Order address updated successfully'**
  String get r155;

  /// No description provided for @r156.
  ///
  /// In en, this message translates to:
  /// **'Product updated in cart successfully'**
  String get r156;

  /// No description provided for @r157.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get r157;

  /// No description provided for @r158.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this product?'**
  String get r158;

  /// No description provided for @r159.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this delivery address?'**
  String get r159;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError('AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
