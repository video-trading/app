import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hant'];

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HantText = '',
  }) =>
      [enText, zh_HantText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.toString());

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
  // OnBoarding
  {
    'bg4841n3': {
      'en': 'Welcome to Video2Trade',
      'zh_Hant': '歡迎來到品視交易平台',
    },
    'qk6yyuid': {
      'en': 'Trade, View, Share',
      'zh_Hant': '交易，欣賞，分享',
    },
  },
  // SignInPage
  {
    'vxyw3hwq': {
      'en': 'Welcome Back!',
      'zh_Hant': '歡迎回來',
    },
    'tqjtys7s': {
      'en': 'Use the form below to access your account.',
      'zh_Hant': '用下面的表單訪問你的帳戶',
    },
    '8f5p8rf9': {
      'en': 'Email Address',
      'zh_Hant': '郵箱',
    },
    'tkx5z789': {
      'en': 'Enter your email here...',
      'zh_Hant': '在此輸入郵箱地址',
    },
    'loxpl2ub': {
      'en': 'Password',
      'zh_Hant': '密碼',
    },
    '0ozkqm2x': {
      'en': 'Enter your password here...',
      'zh_Hant': '在此輸入密碼',
    },
    '4z88z0cg': {
      'en': 'Forgot Password?',
      'zh_Hant': '忘記密碼？',
    },
    'xwpprrgv': {
      'en': 'Login',
      'zh_Hant': '登陸',
    },
    'sdhemw0f': {
      'en': 'Use a social platform to continue',
      'zh_Hant': '用社交平台登錄',
    },
    'phx4zls5': {
      'en': 'Don\'t have an account?',
      'zh_Hant': '創建帳戶？',
    },
    '6h4tm5vx': {
      'en': 'Create Account',
      'zh_Hant': '創建帳戶',
    },
    '5e7hpkni': {
      'en': 'Home',
      'zh_Hant': '主頁',
    },
  },
  // SignUpPage
  {
    '49x9bs9g': {
      'en': 'Get Started',
      'zh_Hant': '開始新的旅程',
    },
    'ktqal428': {
      'en': 'Use the form below to get started.',
      'zh_Hant': '用下面的表單開始',
    },
    '2yji9974': {
      'en': 'Email Address',
      'zh_Hant': '郵箱地址',
    },
    'd0y4pcup': {
      'en': 'Enter your email here...',
      'zh_Hant': '在此輸入郵箱',
    },
    'ye9g20db': {
      'en': 'Password',
      'zh_Hant': '密碼',
    },
    'n128ja56': {
      'en': 'Enter your password here...',
      'zh_Hant': '在此輸入密碼',
    },
    'sahkg8bi': {
      'en': 'Confirm Password',
      'zh_Hant': '確認密碼',
    },
    '8wmbjc4q': {
      'en': 'Enter your password here...',
      'zh_Hant': '在此輸入密碼',
    },
    'me9xcmvo': {
      'en': 'Create Account',
      'zh_Hant': '創建帳戶',
    },
    'y4rl39om': {
      'en': 'Use a social platform to continue',
      'zh_Hant': '用社交平台登錄',
    },
    'oqhgi00f': {
      'en': 'Already have an account?',
      'zh_Hant': '已經有了帳戶？',
    },
    '0e73v0sf': {
      'en': 'Log In',
      'zh_Hant': '登陸',
    },
    't3brl3yk': {
      'en': 'Home',
      'zh_Hant': '主頁',
    },
  },
  // HomePage
  {
    'lm1dkdek': {
      'en': 'Adjust Filters',
      'zh_Hant': '調整過濾器',
    },
    '9nr62lay': {
      'en': 'Home',
      'zh_Hant': '主頁',
    },
    'ezsclhvp': {
      'en': 'Home',
      'zh_Hant': '主頁',
    },
  },
  // SettingsPage
  {
    '3fpilfqk': {
      'en': 'Account Settings',
      'zh_Hant': '帳戶設定',
    },
    'tw0byibc': {
      'en': 'Transaction History',
      'zh_Hant': '交易紀錄',
    },
    'npapd73v': {
      'en': 'Settings',
      'zh_Hant': '設置',
    },
    'z8f2dc5m': {
      'en': 'My Videos',
      'zh_Hant': '我的視頻',
    },
    'cnhicu8p': {
      'en': 'Change Password',
      'zh_Hant': '更改密碼',
    },
    'zbz7cb7f': {
      'en': 'Log Out',
      'zh_Hant': '登出',
    },
    'gpsr5iu6': {
      'en': 'My Profile',
      'zh_Hant': '我的資料',
    },
    '12qnuj3a': {
      'en': 'Settings',
      'zh_Hant': '設定',
    },
  },
  // VideoPage
  {
    'xid9vx36': {
      'en': 'Dislike',
      'zh_Hant': '不喜歡',
    },
    'vkgr8afb': {
      'en': 'Comments',
      'zh_Hant': '',
    },
    'fnkhgdpw': {
      'en': 'view all comments',
      'zh_Hant': '',
    },
    'bjcwjg7d': {
      'en': 'Transactions',
      'zh_Hant': '',
    },
    '8mgw2e3m': {
      'en': 'view all transactions',
      'zh_Hant': '',
    },
  },
  // PaymentPage
  {
    'wnge98me': {
      'en': 'Owner',
      'zh_Hant': '所有者',
    },
    'tb8uvmli': {
      'en': 'Total Amount',
      'zh_Hant': '總額',
    },
    'm9mqcnjp': {
      'en':
          'You may see a temporary hold on your payment method in the amount of your Taskers hourly rate of \$15. You can cancel at any time. Tasks cancelled less than 24 hours before start time may be billed a cancellation fee of one our. Tasks have a one-hour minimum.',
      'zh_Hant': '',
    },
    'wy71fepg': {
      'en': 'Confirm',
      'zh_Hant': '確認',
    },
    '931vrnsn': {
      'en': 'Review & Confirm',
      'zh_Hant': '審查與確認',
    },
    'c6id8w72': {
      'en': 'Home',
      'zh_Hant': '主頁',
    },
  },
  // PaymentConfirmPage
  {
    'uvvxde7a': {
      'en': 'Payment Confirmed!',
      'zh_Hant': '交易確認',
    },
    'nd2kut2b': {
      'en':
          'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
      'zh_Hant': '大概會有1-2小時的確認時間，在此之後，你的交易紀錄才會出現在你的歷史交易紀錄中',
    },
    '8mnmcl5h': {
      'en': 'Go Home',
      'zh_Hant': '回到主頁',
    },
  },
  // ProfilePage
  {
    'fyil8w3n': {
      'en': 'Change Photo',
      'zh_Hant': '更換頭像',
    },
    'batw9ffo': {
      'en': 'Your Name',
      'zh_Hant': '你的名字',
    },
    '2mgladjj': {
      'en': 'Wallet Address',
      'zh_Hant': '錢包地址',
    },
    '5o27tfga': {
      'en': 'Wallet Address',
      'zh_Hant': '錢包地址',
    },
    'ys84ervg': {
      'en': 'Save Changes',
      'zh_Hant': '保存',
    },
    '7sgi7x9s': {
      'en': 'Profile',
      'zh_Hant': '個人信息',
    },
  },
  // MyVideoPage
  {
    'snk73c3w': {
      'en': 'My videos',
      'zh_Hant': '我的視頻',
    },
    'ymhpxjsi': {
      'en': 'Home',
      'zh_Hant': '主頁',
    },
  },
  // TransactionsPage
  {
    'urn2tixm': {
      'en': 'Transactions',
      'zh_Hant': '交易紀錄',
    },
    'vf1fmexs': {
      'en': 'Home',
      'zh_Hant': '主頁',
    },
  },
  // UploadPage
  {
    '5juwkgjd': {
      'en': 'Upload your video',
      'zh_Hant': '上傳視頻',
    },
    '1rklx486': {
      'en': 'Upload Info',
      'zh_Hant': '上傳信息',
    },
    '6abh7eik': {
      'en': 'Title',
      'zh_Hant': '標題',
    },
    'bwzwagqk': {
      'en': 'Description',
      'zh_Hant': '簡介',
    },
    'ftab0f6c': {
      'en': 'Price',
      'zh_Hant': '價格',
    },
    'o9uss4pt': {
      'en': 'Price',
      'zh_Hant': '價格',
    },
    '48xjtr1b': {
      'en': 'Upload Info',
      'zh_Hant': '上傳信息',
    },
    'e77qyxqq': {
      'en': 'Cover',
      'zh_Hant': '封面',
    },
    '5bxxqxvt': {
      'en': 'Upload',
      'zh_Hant': '上傳',
    },
    'b43y3pkf': {
      'en': 'Video',
      'zh_Hant': '視頻',
    },
    '3iisr31q': {
      'en': 'Upload',
      'zh_Hant': '上傳',
    },
    '5uw7c6p5': {
      'en': 'Save',
      'zh_Hant': '保存',
    },
    'zbcy26d7': {
      'en': 'Home',
      'zh_Hant': '主頁',
    },
  },
  // TransactionDetailPage
  {
    '6hp6x6nd': {
      'en': 'Title',
      'zh_Hant': '標題',
    },
    '8qiewm1e': {
      'en': 'Amount',
      'zh_Hant': '金額',
    },
    'oclsld3y': {
      'en': 'Status',
      'zh_Hant': '狀態',
    },
    'd1r0llj2': {
      'en': 'Created At',
      'zh_Hant': '創建時間',
    },
    'vos793n9': {
      'en': 'From',
      'zh_Hant': '從',
    },
    'xuolc46p': {
      'en': 'To',
      'zh_Hant': '到',
    },
    '85r30e4n': {
      'en': 'Transaction Detail',
      'zh_Hant': '交易詳情',
    },
    '7siwo5in': {
      'en': 'Home',
      'zh_Hant': '主頁',
    },
  },
  // VideoTradingHistoryPage
  {
    'bgv7n32c': {
      'en': 'Purchased',
      'zh_Hant': '',
    },
    '09s78u2s': {
      'en': 'Video Trading  History',
      'zh_Hant': '',
    },
    'xtqsd4d1': {
      'en': 'Home',
      'zh_Hant': '',
    },
  },
  // CommentBottomSheet
  {
    '1wug9q4b': {
      'en': 'Comments',
      'zh_Hant': '',
    },
  },
  // Miscellaneous
  {
    'hfffblxx': {
      'en': '',
      'zh_Hant': '',
    },
    'dv6bxi6g': {
      'en': '',
      'zh_Hant': '',
    },
    'b4yjxz4h': {
      'en': '',
      'zh_Hant': '',
    },
    '5hfuzeuv': {
      'en': '',
      'zh_Hant': '',
    },
    'qmh6s0cd': {
      'en': '',
      'zh_Hant': '',
    },
    '290em2lw': {
      'en': '',
      'zh_Hant': '',
    },
    'jmd5fa2x': {
      'en': '',
      'zh_Hant': '',
    },
    'zrj7ad7a': {
      'en': '',
      'zh_Hant': '',
    },
    'vnje9jc9': {
      'en': '',
      'zh_Hant': '',
    },
    'dbqvr4um': {
      'en': '',
      'zh_Hant': '',
    },
    '3ens39gt': {
      'en': '',
      'zh_Hant': '',
    },
    'bbub0eaa': {
      'en': '',
      'zh_Hant': '',
    },
    'dfquo00l': {
      'en': '',
      'zh_Hant': '',
    },
    '7831tmn0': {
      'en': '',
      'zh_Hant': '',
    },
    '8uein7so': {
      'en': '',
      'zh_Hant': '',
    },
    'xx8qhpg8': {
      'en': '',
      'zh_Hant': '',
    },
    'iqffrjr5': {
      'en': '',
      'zh_Hant': '',
    },
    'gd3oe1jy': {
      'en': '',
      'zh_Hant': '',
    },
    'ehry7thp': {
      'en': '',
      'zh_Hant': '',
    },
    'yhlz2eai': {
      'en': '',
      'zh_Hant': '',
    },
    '9kdz3atz': {
      'en': '',
      'zh_Hant': '',
    },
    '5h7u5a3u': {
      'en': '',
      'zh_Hant': '',
    },
    '0a90uiau': {
      'en': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));
