enum Flavor { production, staging }

class AppConfig {
  String baseUrl = 'https://app.staging.beautisry.com/';
  String bundleId = 'identity.beautisry.staging';
  Flavor flavor = Flavor.staging;
  String appleAppId = '6673881416';

  static AppConfig shared = AppConfig.create();

  factory AppConfig.create({
    String baseUrl = 'https://app.staging.beautisry.com/',
    String bundleId = 'com.staging.beautisry.merchant',
    Flavor flavor = Flavor.staging,
    String appleAppId = '6670791763',
  }) {
    return shared = AppConfig(
      baseUrl: baseUrl,
      bundleId: bundleId,
      flavor: flavor,
      appleAppId: appleAppId,
    );
  }

  AppConfig({
    required this.baseUrl,
    required this.bundleId,
    required this.flavor,
    required this.appleAppId,
  });
}
