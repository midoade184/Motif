import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Shop
  {
    'bs1g74xe': {
      'en': 'Shop By Category',
      'ar': '',
    },
    '58zn1lkl': {
      'en': 'View all',
      'ar': '',
    },
    'zr8oqzsg': {
      'en': 'Best Selling',
      'ar': '',
    },
    'uc478lnm': {
      'en': 'View all',
      'ar': '',
    },
    'np21b4sc': {
      'en': 'Shop',
      'ar': '',
    },
  },
  // ProductPage
  {
    'jnatqdg6': {
      'en': ' ',
      'ar': '',
    },
    'svbuwys5': {
      'en': ' ',
      'ar': '',
    },
    'fkr7ae8q': {
      'en': 'Options',
      'ar': '',
    },
    'xbwrptzc': {
      'en': 'Please select an option',
      'ar': '',
    },
    'jd4b0s7b': {
      'en': 'Product Detail',
      'ar': '',
    },
    'uhktjz7y': {
      'en': 'Shipping Information',
      'ar': '',
    },
    'tmipu8gi': {
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'ar': '',
    },
    'ufm3poyc': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'ar': '',
    },
    'p95otk0m': {
      'en': 'Reviews',
      'ar': '',
    },
    'ybj68142': {
      'en': 'view all',
      'ar': '',
    },
    'chbw6ycj': {
      'en': 'Add to Cart',
      'ar': '',
    },
    '1axglhpn': {
      'en': 'Out of Stock',
      'ar': '',
    },
    'u9dsd452': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CartPage
  {
    '50y4iv1r': {
      'en': 'Order Summary',
      'ar': '',
    },
    'ogj5mk6r': {
      'en': 'Subtotal',
      'ar': '',
    },
    'bjbvjpob': {
      'en': 'Discount',
      'ar': '',
    },
    'utumtrnp': {
      'en': 'Total To Pay',
      'ar': '',
    },
    '8o5fi3dd': {
      'en': 'Proceed to Shipping',
      'ar': '',
    },
    'pb9j1vrh': {
      'en': 'Your Cart is Empty',
      'ar': '',
    },
    'fdqrjwrm': {
      'en': 'Go Shopping',
      'ar': '',
    },
    'ui9f5rvz': {
      'en': 'Cart',
      'ar': '',
    },
  },
  // ShippingDetails
  {
    'g2fnte2t': {
      'en': 'Shipping Details',
      'ar': '',
    },
    'vipdnfj5': {
      'en': 'First Name',
      'ar': '',
    },
    'c3btd37r': {
      'en': 'Last Name',
      'ar': '',
    },
    '041hgno7': {
      'en': 'Email',
      'ar': '',
    },
    'j00o8r7m': {
      'en': 'Phone Number',
      'ar': '',
    },
    '7a0dxd8i': {
      'en': '+20 102 365 952',
      'ar': '',
    },
    'nuhztlge': {
      'en': 'Company (Optional)',
      'ar': '',
    },
    'yjqwiej0': {
      'en': 'Street Name',
      'ar': '',
    },
    '07vid9db': {
      'en': 'Building No.',
      'ar': '',
    },
    'g7h59ox6': {
      'en': 'Floor No.',
      'ar': '',
    },
    '7slvrln2': {
      'en': 'Appartment No.',
      'ar': '',
    },
    '27vnxifh': {
      'en': 'Country',
      'ar': '',
    },
    'g6nmuvib': {
      'en': 'City',
      'ar': '',
    },
    '3umpngsf': {
      'en': 'Field is required',
      'ar': '',
    },
    'czwbxiqi': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'v3kstjto': {
      'en': 'Field is required',
      'ar': '',
    },
    'w3550j5y': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '4wmwxq1x': {
      'en': 'Field is required',
      'ar': '',
    },
    'z82ehn2m': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gnshsg75': {
      'en': 'Field is required',
      'ar': '',
    },
    '84ouhngl': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'h7a1gnyr': {
      'en': 'Field is required',
      'ar': '',
    },
    'nqnlfrp7': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ovonap4u': {
      'en': 'Field is required',
      'ar': '',
    },
    'qm1e4prt': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'uwpwb6fu': {
      'en': 'Field is required',
      'ar': '',
    },
    '8h480dw7': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'tnxg6jkt': {
      'en': 'Field is required',
      'ar': '',
    },
    '8durr8zg': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '22oujvks': {
      'en': 'Field is required',
      'ar': '',
    },
    '1c8p293a': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'mp1s79ci': {
      'en': 'Field is required',
      'ar': '',
    },
    '6ovl1dro': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0domwmf5': {
      'en': 'Field is required',
      'ar': '',
    },
    'jsmksifk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gyuq0o0s': {
      'en': 'Proceed to Shipping',
      'ar': '',
    },
    'ipxr5kw1': {
      'en': 'Create Account',
      'ar': '',
    },
  },
  // Checkout
  {
    'r2qdoo1c': {
      'en': 'Estimated Delivery Time',
      'ar': '',
    },
    'u83ntsz3': {
      'en': 'Payment',
      'ar': '',
    },
    'hb1019u0': {
      'en': 'Promos',
      'ar': '',
    },
    '9fjuawf3': {
      'en': 'Add promo',
      'ar': '',
    },
    'ezjsqn7j': {
      'en': 'Promo Code',
      'ar': '',
    },
    'racwm39h': {
      'en': 'Check promo',
      'ar': '',
    },
    'p83dxevg': {
      'en': 'Order Details',
      'ar': '',
    },
    '14w0db21': {
      'en': 'Additional Notes',
      'ar': '',
    },
    'k6nmy0en': {
      'en': 'Additional Notes (Optional)',
      'ar': '',
    },
    '0eqqqzoo': {
      'en': 'Total Price',
      'ar': '',
    },
    'ahcclj0p': {
      'en': 'Confirm Order',
      'ar': '',
    },
    '9hmgcgrj': {
      'en': 'Review & Confirm',
      'ar': '',
    },
    'rqdadrl9': {
      'en': 'Home',
      'ar': '',
    },
  },
  // MyAccount
  {
    'yg2jyudj': {
      'en': 'Account',
      'ar': '',
    },
    'au0pvo5c': {
      'en': 'Edit Profile',
      'ar': '',
    },
    '5ml0yk6e': {
      'en': 'Orders History',
      'ar': '',
    },
    '8u376jal': {
      'en': 'General',
      'ar': '',
    },
    'pqn3cdsd': {
      'en': 'Ligh Mode',
      'ar': '',
    },
    'cwmpjn48': {
      'en': 'Dark Mode',
      'ar': '',
    },
    '0eaua8ob': {
      'en': 'Support',
      'ar': '',
    },
    'uotaed12': {
      'en': 'Log Out',
      'ar': '',
    },
    'w4z0ybpj': {
      'en': 'Profile',
      'ar': '',
    },
    '6kfco8rr': {
      'en': 'My Account',
      'ar': '',
    },
  },
  // EditProfile
  {
    'wxap0vgq': {
      'en': 'First Name',
      'ar': '',
    },
    't3coxogu': {
      'en': 'Last Name',
      'ar': '',
    },
    'yh9hfeds': {
      'en': 'Phone Number',
      'ar': '',
    },
    'd90n09yd': {
      'en': 'Email Address',
      'ar': '',
    },
    'ql02plvx': {
      'en': 'Save Changes',
      'ar': '',
    },
    'lqnozmaz': {
      'en': 'Edit Profike',
      'ar': '',
    },
  },
  // ThankYou
  {
    'e0zezjp6': {
      'en': 'Order Confirmed!',
      'ar': '',
    },
    'ehsfs8c4': {
      'en': 'Your order has been confirmed, it may take 3-7 days for delivery.',
      'ar': '',
    },
    'raomelzc': {
      'en': 'Returning to home in ',
      'ar': '',
    },
    'gpzuzgsp': {
      'en': 'Go Home',
      'ar': '',
    },
  },
  // OrderHistory
  {
    'kqjegdd3': {
      'en': 'Order Preview',
      'ar': '',
    },
    'iuai2cl7': {
      'en': 'View Order',
      'ar': '',
    },
    's5rfggfq': {
      'en': 'Order History',
      'ar': '',
    },
    'tt1xuhmk': {
      'en': 'Home',
      'ar': '',
    },
  },
  // SingleOrder
  {
    'eiygllnt': {
      'en': 'Order Details',
      'ar': '',
    },
    'vlgaeg3t': {
      'en': 'Payment',
      'ar': '',
    },
    '98h7a4ah': {
      'en': 'Pyament',
      'ar': '',
    },
    '2a67kspj': {
      'en': 'Promos',
      'ar': '',
    },
    'qxj9362k': {
      'en': 'Add promo',
      'ar': '',
    },
    'tb9gtpct': {
      'en': 'Promo Code',
      'ar': '',
    },
    '22o1qi0y': {
      'en': 'Additional Notes',
      'ar': '',
    },
    'jis18veb': {
      'en': 'Additional Notes (Optional)',
      'ar': '',
    },
    '1od1erqj': {
      'en': 'Total Price',
      'ar': '',
    },
    'eprcn09y': {
      'en': 'NOTE: ',
      'ar': '',
    },
    '3une11nd': {
      'en': 'If you want to cancel you order',
      'ar': '',
    },
    '3u65zb5q': {
      'en': ' Give us a call',
      'ar': '',
    },
    '2mmpnltk': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Support
  {
    'v8jna61r': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AllProdudcts
  {
    'xy5ecbnv': {
      'en': 'Filter',
      'ar': '',
    },
    'x4e5h1y2': {
      'en': 'Popularity',
      'ar': '',
    },
    'v7opsuhg': {
      'en': 'Average Rating',
      'ar': '',
    },
    'dzcm3cwr': {
      'en': 'Latest',
      'ar': '',
    },
    'rqdbceun': {
      'en': 'Price: Low to High',
      'ar': '',
    },
    '6zokgr1j': {
      'en': 'Price: High to Low',
      'ar': '',
    },
    'k5woc5ji': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Search
  {
    'qpkw2bet': {
      'en': 'Search',
      'ar': '',
    },
    't0h9eaiz': {
      'en': 'Clear',
      'ar': '',
    },
    'b5h9834d': {
      'en': 'Search',
      'ar': '',
    },
  },
  // Reviews
  {
    'xrr0gz6i': {
      'en': 'Reviews',
      'ar': '',
    },
    'avy8stjd': {
      'en': '# of Ratings',
      'ar': '',
    },
    'qgf6c18w': {
      'en': 'Avg. Rating',
      'ar': '',
    },
  },
  // SearchNav
  {
    '071h9oh0': {
      'en': 'Clear',
      'ar': '',
    },
    'ogrzprql': {
      'en': 'Search',
      'ar': '',
    },
  },
  // Login-Register
  {
    'qcdtqzfv': {
      'en': 'Home',
      'ar': '',
    },
  },
  // SearchResult
  {
    '995f5whg': {
      'en': 'Filter',
      'ar': '',
    },
    'irzgr8ep': {
      'en': 'Popularity',
      'ar': '',
    },
    '4n696h1v': {
      'en': 'Average Rating',
      'ar': '',
    },
    'emloqcqv': {
      'en': 'Latest',
      'ar': '',
    },
    'pjtbpc11': {
      'en': 'Price: Low to High',
      'ar': '',
    },
    'ci4pc1o8': {
      'en': 'Price: High to Low',
      'ar': '',
    },
    'febs8uex': {
      'en': 'Search',
      'ar': '',
    },
    'yhodnh7j': {
      'en': 'Search',
      'ar': '',
    },
  },
  // AllCats
  {
    'l8alfv0v': {
      'en': 'Categories',
      'ar': '',
    },
  },
  // SingleCat
  {
    'afg3ckcq': {
      'en': 'Filter',
      'ar': '',
    },
    'v4oa7eae': {
      'en': 'Popularity',
      'ar': '',
    },
    'vclkfvz1': {
      'en': 'Average Rating',
      'ar': '',
    },
    'ie4rspkc': {
      'en': 'Latest',
      'ar': '',
    },
    '4cx7xd68': {
      'en': 'Price: Low to High',
      'ar': '',
    },
    'wnpu5e04': {
      'en': 'Price: High to Low',
      'ar': '',
    },
    'ub4mr6mf': {
      'en': 'Home',
      'ar': '',
    },
  },
  // addReview
  {
    'dykd828o': {
      'en': 'Add Review',
      'ar': '',
    },
    'ijlwauie': {
      'en': 'Enter your note here...',
      'ar': '',
    },
    'drwncx93': {
      'en': 'Please add your review first',
      'ar': '',
    },
    'yqsj0onk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'sub44p55': {
      'en': 'Add Review',
      'ar': '',
    },
  },
  // appBar
  {
    'us84tkgs': {
      'en': 'Search',
      'ar': '',
    },
  },
  // appBarWithBackButton
  {
    '4n3qva3p': {
      'en': 'Search',
      'ar': '',
    },
  },
  // authComponent
  {
    '3dv713i4': {
      'en': 'Sign In',
      'ar': '',
    },
    'yp6wpq6s': {
      'en': 'Email Address',
      'ar': '',
    },
    'ez4j18m6': {
      'en': 'Password',
      'ar': '',
    },
    'ogsbbgc7': {
      'en': 'Fogot password? ',
      'ar': '',
    },
    '0q7874n5': {
      'en': 'Recover',
      'ar': '',
    },
    'cg98s0au': {
      'en': 'Login',
      'ar': '',
    },
    'wqsp3ltv': {
      'en': 'Field is required',
      'ar': '',
    },
    'v4i04wrt': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'z97ebkyz': {
      'en': 'Field is required',
      'ar': '',
    },
    'pl5a1uqw': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ci44cj8a': {
      'en': 'Or use a social account to login',
      'ar': '',
    },
    '3336mvwn': {
      'en': 'Sign Up',
      'ar': '',
    },
    '0hbt4ari': {
      'en': 'First Name',
      'ar': '',
    },
    '6n993du9': {
      'en': 'Last Name',
      'ar': '',
    },
    'mpecypso': {
      'en': 'Email',
      'ar': '',
    },
    'slqat5zc': {
      'en': 'Password',
      'ar': '',
    },
    'iqk5ngb7': {
      'en': 'Field is required',
      'ar': '',
    },
    '8zy48cn6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'e2qmdo48': {
      'en': 'Field is required',
      'ar': '',
    },
    'f7dl0ioc': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'rfd8ji52': {
      'en': 'Field is required',
      'ar': '',
    },
    'h2q66dow': {
      'en': '',
      'ar': '',
    },
    'ko5ipfjz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'c5r8airc': {
      'en': 'Field is required',
      'ar': '',
    },
    'c8jeln3b': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    's6m4l5lg': {
      'en': 'Create Account',
      'ar': '',
    },
    '8fr1l9k6': {
      'en': 'Sign up using a social account',
      'ar': '',
    },
  },
  // productCard
  {
    '528iezib': {
      'en': ' ',
      'ar': '',
    },
    'v6bwtmxr': {
      'en': ' ',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
