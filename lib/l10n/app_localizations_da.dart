// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get locale_desc => 'Dansk';

  @override
  String get locale_system => 'System';

  @override
  String get btn_boot => 'Tænde';

  @override
  String get btn_arrest => 'Slukke';

  @override
  String get btn_auth => 'Genautoriser';

  @override
  String get btn_dev_settings => 'Udviklerindstillinger';

  @override
  String get btn_switch_on => 'Til';

  @override
  String get btn_switch_off => 'Fra';

  @override
  String get status_subtext_winver_10 => 'Windows 10 registreret';

  @override
  String get status_subtext_winver_older =>
      'Ældre version af Windows registreret';

  @override
  String get status_unsupported => 'WSA ikke installeret';

  @override
  String status_unsupported_desc(String windowsVersion) {
    return '$windowsVersion og WSA blev ikke fundet. Denne applikation afhænger af WSA, som kun understøttes officielt på Windows 11';
  }

  @override
  String get status_unauthorized => 'Ikke autoriseret';

  @override
  String get status_unauthorized_desc =>
      'Fejlfindingsautorisationen er blevet afvist eller tilbagekaldt; tryk på den første knap, vælg \'tillad altid\' og klik derefter på \'tillad\'; hvis der ikke vises et pop op-vindue, skal du åbne udviklerindstillingerne samt slå \'USB-fejlfinding\' fra og til igen';

  @override
  String get status_missing => 'WSA ikke installeret';

  @override
  String get status_missing_desc =>
      'WSA blev ikke fundet. Denne applikation afhænger af WSA; installer Windows-subsystem til Android (eller Amazon Appstore) fra Microsoft Store';

  @override
  String get status_unknown => 'Opretter forbindelse';

  @override
  String get status_unknown_desc =>
      'Venter på, at forbindelsen til WSA etableres...';

  @override
  String get status_starting => 'Starter';

  @override
  String get status_starting_desc => 'WSA starter, vent venligst...';

  @override
  String get status_arresting => 'Stopper';

  @override
  String get status_arresting_desc => 'WSA slukker, vent venligst...';

  @override
  String get status_arrested => 'Stoppet';

  @override
  String get status_arrested_desc => 'WSA er slukket';

  @override
  String get status_offline => 'Offline';

  @override
  String get status_offline_desc =>
      'Der kunne ikke oprettes forbindelse til WSA: Udviklertilstand og USB-fejlfinding er slået fra, eller der er angivet en forkert port';

  @override
  String get status_disconnected => 'Afbrudt';

  @override
  String get status_disconnected_desc =>
      'Der kunne ikke oprettes forbindelse til WSA af ukendte årsager';

  @override
  String get status_connected => 'Forbundet';

  @override
  String get status_connected_desc =>
      'Forbundet til WSA med succes, og alt er i orden';

  @override
  String get screen_title => 'Android-pakkeinstallationshåndtering';

  @override
  String get screen_settings => 'Indstillinger';

  @override
  String get wsa_manage => 'Android-styring';

  @override
  String get wsa_manage_app => 'Administrer applikationer';

  @override
  String get wsa_manage_settings => 'Administrer indstillinger';

  @override
  String get settings_port => 'WSA-port';

  @override
  String get settings_ip => 'WSA IP-adresse';

  @override
  String get settings_autostart => 'Automatisk start af WSA før installation';

  @override
  String settings_timeout(String seconds) {
    return 'Tidsudløb ($seconds sekunder)';
  }

  @override
  String get settings_language => 'Sprog';

  @override
  String get settings_option_generic_system => 'System';

  @override
  String get settings_option_generic_disabled => 'Deaktiveret';

  @override
  String get theme_mode => 'Tematilstand';

  @override
  String get theme_mode_dark => 'Mørk';

  @override
  String get theme_mode_light => 'Lys';

  @override
  String get theme_mica => 'Vinduesgennemsigtighed';

  @override
  String get theme_mica_full => 'Fuld';

  @override
  String get theme_mica_partial => 'Delvis';

  @override
  String get theme_icon_adaptive => 'Adaptiv ikonform';

  @override
  String get theme_icon_adaptive_squircle => 'Supercirkel';

  @override
  String get theme_icon_adaptive_circle => 'Cirkel';

  @override
  String get theme_icon_adaptive_rounded_square => 'Afrundet firkant';

  @override
  String get installer_message => 'Vil du installere denne applikation?';

  @override
  String installer_info_version(String appVersion) {
    return 'Version: $appVersion';
  }

  @override
  String installer_info_version_change(
    String appVersionOld,
    String appVersionNew,
  ) {
    return 'Version: $appVersionOld => $appVersionNew';
  }

  @override
  String installer_info_package(String appPackage) {
    return 'Pakke: $appPackage';
  }

  @override
  String installer_info_minosver(String minAndroidVer, int minSdkVer) {
    return 'Minimumskrav til OS: Android $minAndroidVer (API $minSdkVer)';
  }

  @override
  String installer_installing(String appTitle) {
    return 'Installerer applikationen $appTitle...';
  }

  @override
  String installer_installed(String appTitle) {
    return 'Applikationen $appTitle blev installeret';
  }

  @override
  String installer_fail(String appTitle) {
    return 'Applikationen $appTitle blev ikke installeret';
  }

  @override
  String get installer_error_nomsg =>
      'Installationen mislykkedes, men der opstod ingen fejl';

  @override
  String get installer_error_timeout =>
      'Installationen timede ud; klienten er holdt op med at vente, men den kan stadig køre i baggrunden...';

  @override
  String installer_warning_dirty(String tempDir) {
    return 'Manuel oprydning af filer i mappen ”$tempDir” er nødvendig';
  }

  @override
  String get installer_btn_starting => 'Starter...';

  @override
  String get installer_btn_loading => 'Indlæser...';

  @override
  String get installer_btn_cancel => 'Annuller';

  @override
  String get installer_btn_install => 'Installer';

  @override
  String get installer_btn_reinstall => 'Geninstaller';

  @override
  String get installer_btn_update => 'Opdater';

  @override
  String get installer_btn_downgrade => 'Nedgrader (usikkert)';

  @override
  String get installer_btn_dismiss => 'Afslut';

  @override
  String get installer_btn_open => 'Åbn appen';

  @override
  String get installer_btn_checkbox_shortcut => 'Opret skrivebordsgenvej';

  @override
  String get installer_select_hints =>
      'Vælg venligst en målenhed til installationen...';

  @override
  String get wired_device_none_title => 'Ingen kablede enheder tilsluttet';

  @override
  String get wired_device_none_content =>
      'Tilslut en Android-enhed via USB, og sørg for, at USB-fejlfinding er aktiveret.';

  @override
  String get wired_device_one_title => 'Kablet enhed tilsluttet';

  @override
  String wired_device_one_content(String deviceName, String deviceId) {
    return 'Enhedsnavn: $deviceName\nEnheds-ID: $deviceId';
  }

  @override
  String get wired_device_multiple_title => 'Flere kablede enheder tilsluttet';

  @override
  String wired_device_multiple_content(String deviceList) {
    return 'Der er flere enheder tilsluttet. Vælg målenheden under installationen:\n$deviceList';
  }

  @override
  String get android_permission_none => 'Ingen tilladelser krævet';

  @override
  String get android_permission_admin => 'Administrer enhed som administrator';

  @override
  String get android_permission_admin_brick =>
      'Deaktiver eller nulstil enheden';

  @override
  String get android_permission_admin_lock => 'Lås enheden eksternt';

  @override
  String get android_permission_storage => 'Filer og medier';

  @override
  String get android_permission_microphone => 'Mikrofon';

  @override
  String get android_permission_camera => 'Kamera';

  @override
  String get android_permission_location => 'Placering';

  @override
  String get android_permission_phone => 'Telefon';

  @override
  String get android_permission_call_log => 'Opkaldslister';

  @override
  String get android_permission_sms => 'Beskeder';

  @override
  String get android_permission_contacts => 'Kontakter';

  @override
  String get android_permission_calendar => 'Kalender';

  @override
  String get android_permission_activity_recognition => 'Fysisk aktivitet';

  @override
  String get android_permission_sensors => 'Enhedssensorer';

  @override
  String get android_permission_sensors_body => 'Kropssensorer';

  @override
  String get android_permission_nearby_devices =>
      'Søg efter enheder i nærheden';

  @override
  String get android_permission_read_packages => 'Hent installerede pakker';
}
