import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bg.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bg'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('it'),
    Locale('pt'),
  ];

  /// English
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get user_language;

  /// Language Flag Code
  ///
  /// In en, this message translates to:
  /// **'us'**
  String get languageFlagCode;

  /// Filters and order
  ///
  /// In en, this message translates to:
  /// **'Filters and order'**
  String get filtersAndOrder;

  /// Order by sum
  ///
  /// In en, this message translates to:
  /// **'Order by sum'**
  String get orderBySum;

  /// Low to high
  ///
  /// In en, this message translates to:
  /// **'Low to high'**
  String get lowToHigh;

  /// High to low
  ///
  /// In en, this message translates to:
  /// **'High to low'**
  String get highToLow;

  /// Order by date
  ///
  /// In en, this message translates to:
  /// **'Order by date'**
  String get orderByDate;

  /// Recent first
  ///
  /// In en, this message translates to:
  /// **'Recent first'**
  String get recentFirst;

  /// Old first
  ///
  /// In en, this message translates to:
  /// **'Old first'**
  String get oldFirst;

  /// Order by category
  ///
  /// In en, this message translates to:
  /// **'Order by category'**
  String get orderByCategory;

  /// Order by name
  ///
  /// In en, this message translates to:
  /// **'Order by name'**
  String get orderByName;

  /// Settings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Show data
  ///
  /// In en, this message translates to:
  /// **'Show data'**
  String get showData;

  /// Clear data
  ///
  /// In en, this message translates to:
  /// **'Clear data'**
  String get clearData;

  /// Language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Title
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// Sum
  ///
  /// In en, this message translates to:
  /// **'Sum'**
  String get sum;

  /// Date
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// Category
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// Food
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get food;

  /// Groceries
  ///
  /// In en, this message translates to:
  /// **'Groceries'**
  String get groceries;

  /// Transportation
  ///
  /// In en, this message translates to:
  /// **'Transportation'**
  String get transportation;

  /// Leisure
  ///
  /// In en, this message translates to:
  /// **'Leisure'**
  String get leisure;

  /// Studies
  ///
  /// In en, this message translates to:
  /// **'Studies'**
  String get studies;

  /// Bills
  ///
  /// In en, this message translates to:
  /// **'Bills'**
  String get bills;

  /// Others
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get others;

  /// Select date
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get selectDate;

  /// Cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Save
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No expenses added
  ///
  /// In en, this message translates to:
  /// **'No expenses added'**
  String get noExpensesAdded;

  /// Theme
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Dark
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// Light
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// Currency
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// Color
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// Blue
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get blue;

  /// Green
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get green;

  /// Pink
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get pink;

  /// Gold
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get gold;

  /// Orange
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get orange;

  /// Purple
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get purple;

  /// welcomeTo
  ///
  /// In en, this message translates to:
  /// **'Welcome to {name}'**
  String welcomeTo(String name);

  /// App description
  ///
  /// In en, this message translates to:
  /// **'An app to manage your expenses'**
  String get appDescription;

  /// Title is empty
  ///
  /// In en, this message translates to:
  /// **'Title is empty'**
  String get titleIsEmpty;

  /// Sum is empty
  ///
  /// In en, this message translates to:
  /// **'Sum is empty'**
  String get sumIsEmpty;

  /// Sum is not a number
  ///
  /// In en, this message translates to:
  /// **'Sum is not a number'**
  String get sumIsNotANumber;

  /// Sum is negative
  ///
  /// In en, this message translates to:
  /// **'Sum is negative'**
  String get sumIsNegative;

  /// Error
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Expense deleted
  ///
  /// In en, this message translates to:
  /// **'Expense deleted'**
  String get expenseDeleted;

  /// New expense
  ///
  /// In en, this message translates to:
  /// **'New expense'**
  String get newExpense;

  /// Edit expense
  ///
  /// In en, this message translates to:
  /// **'Edit expense'**
  String get editExpense;

  /// Undo
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// Date is not selected
  ///
  /// In en, this message translates to:
  /// **'Date is not selected'**
  String get dateNotSelected;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'bg',
    'de',
    'en',
    'es',
    'it',
    'pt',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bg':
      return AppLocalizationsBg();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'it':
      return AppLocalizationsIt();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
