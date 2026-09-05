import 'package:passkeeper/core/constants/brand_icon_paths.dart';

class BrandIconMatcher {
  BrandIconMatcher._();

  static String? match({String? title, String? website}) {
    if (website != null && website.trim().isNotEmpty) {
      final domain = _extractDomain(website);
      if (domain != null) {
        final domainMatch = _matchText(domain);
        if (domainMatch != null) return domainMatch;
      }
    }

    if (title != null && title.trim().isNotEmpty) {
      return _matchText(title);
    }

    return null;
  }

  static String? _extractDomain(String website) {
    String value = website.trim().toLowerCase();
    value = value.replaceFirst(RegExp(r'^https?://'), '');
    value = value.replaceFirst(RegExp(r'^www\.'), '');

    final slashIndex = value.indexOf('/');
    if (slashIndex != -1) value = value.substring(0, slashIndex);

    final dotIndex = value.indexOf('.');
    if (dotIndex == -1) return value.isEmpty ? null : value;

    return value.substring(0, dotIndex);
  }

  static String _normalize(String input) {
    return input.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
  }

  static String? _matchText(String input) {
    final normalized = _normalize(input);
    if (normalized.isEmpty) return null;

    // Pass 1: exact match (safe for short aliases like "fb", "ig", "x")
    for (final brand in _brands) {
      if (brand.aliases.contains(normalized)) return brand.path;
    }

    // Pass 2: prefix match, longer aliases only
    for (final brand in _brands) {
      for (final alias in brand.aliases) {
        if (alias.length >= 4 && normalized.startsWith(alias)) {
          return brand.path;
        }
      }
    }

    // Pass 3: substring match, longest alias only
    for (final brand in _brands) {
      final longestAlias = brand.aliases.reduce(
        (a, b) => a.length >= b.length ? a : b,
      );
      if (longestAlias.length >= 4 && normalized.contains(longestAlias)) {
        return brand.path;
      }
    }

    return null;
  }

  static final List<_Brand> _brands = const [
    _Brand(BrandIconPaths.facebook, ['facebook', 'fb', 'face', 'meta']),
    _Brand(BrandIconPaths.instagram, ['instagram', 'insta', 'ig', 'gram']),
    _Brand(BrandIconPaths.x, ['twitter', 'x', 'tweet', 'xcom']),
    _Brand(BrandIconPaths.gmail, ['gmail', 'googlemail']),
    _Brand(BrandIconPaths.google, ['google', 'goog']),
    _Brand(BrandIconPaths.youtube, ['youtube', 'yt', 'ytube']),
    _Brand(BrandIconPaths.github, ['github', 'git', 'ghub']),
    _Brand(BrandIconPaths.gitlab, ['gitlab', 'glab']),
    _Brand(BrandIconPaths.linkedin, ['linkedin', 'lnkdin', 'lnkd', 'li']),
    _Brand(BrandIconPaths.apple, [
      'apple',
      'appleid',
      'icloud',
      'ios',
      'iphone',
    ]),
    _Brand(BrandIconPaths.outlook, ['outlook', 'hotmail', 'live', 'msn']),
    _Brand(BrandIconPaths.microsoft, ['microsoft', 'msft', 'ms365', 'office']),
    _Brand(BrandIconPaths.amazon, ['amazon', 'amzn', 'prime']),
    _Brand(BrandIconPaths.prime, ['primevideo', 'primevid']),
    _Brand(BrandIconPaths.aws, ['aws', 'awsconsole', 'amazonwebservices']),
    _Brand(BrandIconPaths.netflix, ['netflix', 'nflx']),
    _Brand(BrandIconPaths.spotify, ['spotify', 'spot']),
    _Brand(BrandIconPaths.paypal, ['paypal', 'pp', 'pypl']),
    _Brand(BrandIconPaths.discord, ['discord', 'disc']),
    _Brand(BrandIconPaths.whatsapp, ['whatsapp', 'wa', 'whats']),
    _Brand(BrandIconPaths.telegram, ['telegram', 'tg', 'tele']),
    _Brand(BrandIconPaths.dropbox, ['dropbox', 'dbx']),
    _Brand(BrandIconPaths.reddit, ['reddit', 'rddt']),
    _Brand(BrandIconPaths.tiktok, ['tiktok', 'tt', 'douyin']),
    _Brand(BrandIconPaths.snapchat, ['snapchat', 'snap', 'sc']),
    _Brand(BrandIconPaths.pinterest, ['pinterest', 'pin', 'pint']),
    _Brand(BrandIconPaths.twitch, ['twitch', 'ttv']),
    _Brand(BrandIconPaths.zoom, ['zoom', 'zoomus']),
    _Brand(BrandIconPaths.yahoo, ['yahoo', 'ymail']),
    _Brand(BrandIconPaths.ebay, ['ebay']),
    _Brand(BrandIconPaths.uber, ['uber', 'ubereats']),
    _Brand(BrandIconPaths.airbnb, ['airbnb', 'abnb']),
    _Brand(BrandIconPaths.wordpress, ['wordpress', 'wp']),
    _Brand(BrandIconPaths.slack, ['slack']),
    _Brand(BrandIconPaths.adobe, ['adobe', 'creativecloud', 'photoshop']),
    _Brand(BrandIconPaths.notion, ['notion', 'ntn']),
    _Brand(BrandIconPaths.figma, ['figma', 'fig']),
    _Brand(BrandIconPaths.shopify, ['shopify', 'shop']),
    _Brand(BrandIconPaths.playstation, [
      'playstation',
      'ps',
      'psn',
      'ps5',
      'ps4',
    ]),
    _Brand(BrandIconPaths.xbox, ['xbox', 'xboxlive']),
    _Brand(BrandIconPaths.nintendo, ['nintendo', 'switch', 'eshop']),
    _Brand(BrandIconPaths.steam, ['steam', 'valve']),
    _Brand(BrandIconPaths.epicGames, ['epicgames', 'epic', 'fortnite']),
    _Brand(BrandIconPaths.riotGames, [
      'riotgames',
      'riot',
      'valorant',
      'valo',
      'leagueoflegends',
      'lol',
    ]),
    _Brand(BrandIconPaths.threads, ['threads']),
    _Brand(BrandIconPaths.soundcloud, ['soundcloud']),
  ];
}

class _Brand {
  const _Brand(this.path, this.aliases);
  final String path;
  final List<String> aliases;
}
