// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get locale_desc => 'Ελληνικά';

  @override
  String get locale_system => 'Σύστημα';

  @override
  String get btn_boot => 'Ανάβω';

  @override
  String get btn_arrest => 'Κλείνω';

  @override
  String get btn_auth => 'Επανεπαλήθευση';

  @override
  String get btn_dev_settings => 'Επιλογές προγραμματιστή';

  @override
  String get btn_switch_on => 'Ενεργό';

  @override
  String get btn_switch_off => 'Ανενεργό';

  @override
  String get status_subtext_winver_10 => 'Εντοπίστηκαν Windows 10';

  @override
  String get status_subtext_winver_older =>
      'Εντοπίστηκε παλαιότερη έκδοση των Windows';

  @override
  String get status_unsupported => 'Το WSA δεν είναι εγκατεστημένο';

  @override
  String status_unsupported_desc(String windowsVersion) {
    return '$windowsVersion και το WSA δεν βρέθηκε. Αυτή η εφαρμογή εξαρτάται από το WSA, το οποίο υποστηρίζεται επίσημα μόνο στα Windows 11';
  }

  @override
  String get status_unauthorized => 'Μη εξουσιοδοτημένο';

  @override
  String get status_unauthorized_desc =>
      'Η εξουσιοδότηση εντοπισμού σφαλμάτων απορρίφθηκε ή ανακλήθηκε. Πιέστε το πρώτο κουμπί, επιλέξτε \'να επιτρέπεται πάντα\' και στη συνέχεια κάντε κλικ στο \'να επιτραπεί\'. Αν δεν εμφανιστεί αναδυόμενο παράθυρο, ανοίξτε τις επιλογές προγραμματιστή, απενεργοποιήστε και ενεργοποιήστε ξανά τον \'εντοπισμό σφαλμάτων USB\'';

  @override
  String get status_missing => 'Το WSA δεν είναι εγκατεστημένο';

  @override
  String get status_missing_desc =>
      'Το WSA δεν βρέθηκε. Αυτή η εφαρμογή εξαρτάται από το WSA, εγκαταστήστε το Υποσύστημα Windows για Android (ή το Amazon Appstore) από το Microsoft Store';

  @override
  String get status_unknown => 'Σύνδεση';

  @override
  String get status_unknown_desc =>
      'Αναμονή για δημιουργία σύνδεσης με το WSA...';

  @override
  String get status_starting => 'Εκκίνηση';

  @override
  String get status_starting_desc =>
      'Το WSA εκκινείται, παρακαλώ περιμένετε...';

  @override
  String get status_arresting => 'Τερματισμός';

  @override
  String get status_arresting_desc =>
      'Το WSA τερματίζεται, παρακαλώ περιμένετε...';

  @override
  String get status_arrested => 'Διακόπηκε';

  @override
  String get status_arrested_desc => 'Το WSA είναι απενεργοποιημένο';

  @override
  String get status_offline => 'Εκτός σύνδεσης';

  @override
  String get status_offline_desc =>
      'Αποτυχία δημιουργίας σύνδεσης με το WSA: η λειτουργία προγραμματιστή και ο εντοπισμός σφαλμάτων USB είναι απενεργοποιημένα ή έχει οριστεί εσφαλμένη θύρα';

  @override
  String get status_disconnected => 'Αποσυνδέθηκε';

  @override
  String get status_disconnected_desc =>
      'Αποτυχία δημιουργίας σύνδεσης με το WSA για άγνωστους λόγους';

  @override
  String get status_connected => 'Συνδέθηκε';

  @override
  String get status_connected_desc =>
      'Επιτυχής σύνδεση με το WSA, όλα λειτουργούν κανονικά';

  @override
  String get screen_title => 'Διαχειριστής εγκατάστασης πακέτων Android';

  @override
  String get screen_settings => 'Ρυθμίσεις';

  @override
  String get wsa_manage => 'Διαχείριση Android';

  @override
  String get wsa_manage_app => 'Διαχείριση εφαρμογών';

  @override
  String get wsa_manage_settings => 'Διαχείριση ρυθμίσεων';

  @override
  String get settings_port => 'Θύρα WSA';

  @override
  String get settings_ip => 'Διεύθυνση IP του WSA';

  @override
  String get settings_autostart =>
      'Αυτόματη εκκίνηση του WSA πριν την εγκατάσταση';

  @override
  String settings_timeout(String seconds) {
    return 'Χρονικό όριο ($seconds δευτερόλεπτα)';
  }

  @override
  String get settings_language => 'Γλώσσα';

  @override
  String get settings_option_generic_system => 'Σύστημα';

  @override
  String get settings_option_generic_disabled => 'Απενεργοποιημένο';

  @override
  String get theme_mode => 'Λειτουργία θέματος';

  @override
  String get theme_mode_dark => 'Σκούρο';

  @override
  String get theme_mode_light => 'Φωτεινό';

  @override
  String get theme_mica => 'Διαφάνεια παραθύρου';

  @override
  String get theme_mica_full => 'Πλήρης';

  @override
  String get theme_mica_partial => 'Μερική';

  @override
  String get theme_icon_adaptive => 'Σχήμα προσαρμοστικών εικονιδίων';

  @override
  String get theme_icon_adaptive_squircle => 'Σκουίρκλ';

  @override
  String get theme_icon_adaptive_circle => 'Κύκλος';

  @override
  String get theme_icon_adaptive_rounded_square => 'Στρογγυλεμένο τετράγωνο';

  @override
  String get installer_message => 'Θέλετε να εγκαταστήσετε αυτήν την εφαρμογή;';

  @override
  String installer_info_version(String appVersion) {
    return 'Έκδοση: $appVersion';
  }

  @override
  String installer_info_version_change(
    String appVersionOld,
    String appVersionNew,
  ) {
    return 'Έκδοση: $appVersionOld => $appVersionNew';
  }

  @override
  String installer_info_package(String appPackage) {
    return 'Πακέτο: $appPackage';
  }

  @override
  String installer_info_minosver(String minAndroidVer, int minSdkVer) {
    return 'Ελάχιστες απαιτήσεις Λ.Σ.: Android $minAndroidVer (API $minSdkVer)';
  }

  @override
  String installer_installing(String appTitle) {
    return 'Εγκατάσταση της εφαρμογής $appTitle...';
  }

  @override
  String installer_installed(String appTitle) {
    return 'Η εφαρμογή $appTitle εγκαταστάθηκε επιτυχώς';
  }

  @override
  String installer_fail(String appTitle) {
    return 'Η εφαρμογή $appTitle δεν εγκαταστάθηκε';
  }

  @override
  String get installer_error_nomsg =>
      'Η εγκατάσταση απέτυχε, αλλά δεν παρουσιάστηκε κάποιο σφάλμα';

  @override
  String get installer_error_timeout =>
      'Η εγκατάσταση υπερέβη το χρονικό όριο, ο πελάτης σταμάτησε να περιμένει, αλλά μπορεί να συνεχίζεται στο παρασκήνιο...';

  @override
  String installer_warning_dirty(String tempDir) {
    return 'Απαιτείται μη αυτόματος καθαρισμός αρχείων στον κατάλογο «$tempDir»';
  }

  @override
  String get installer_btn_starting => 'Εκκίνηση...';

  @override
  String get installer_btn_loading => 'Φόρτωση...';

  @override
  String get installer_btn_cancel => 'Ακύρωση';

  @override
  String get installer_btn_install => 'Εγκατάσταση';

  @override
  String get installer_btn_reinstall => 'Επανεγκατάσταση';

  @override
  String get installer_btn_update => 'Ενημέρωση';

  @override
  String get installer_btn_downgrade => 'Υποβάθμιση (μη ασφαλές)';

  @override
  String get installer_btn_dismiss => 'Τέλος';

  @override
  String get installer_btn_open => 'Άνοιγμα εφαρμογής';

  @override
  String get installer_btn_checkbox_shortcut =>
      'Δημιουργία συντόμευσης στην επιφάνεια εργασίας';

  @override
  String get installer_select_hints =>
      'Παρακαλώ επιλέξτε μια συσκευή προορισμού για την εγκατάσταση...';

  @override
  String get wired_device_none_title =>
      'Δεν υπάρχουν συνδεδεμένες ενσύρματες συσκευές';

  @override
  String get wired_device_none_content =>
      'Συνδέστε μια συσκευή Android μέσω USB και βεβαιωθείτε ότι ο εντοπισμός σφαλμάτων USB είναι ενεργοποιημένος.';

  @override
  String get wired_device_one_title => 'Συνδέθηκε ενσύρματη συσκευή';

  @override
  String wired_device_one_content(String deviceName, String deviceId) {
    return 'Όνομα συσκευής: $deviceName\nID συσκευής: $deviceId';
  }

  @override
  String get wired_device_multiple_title =>
      'Συνδέθηκαν πολλαπλές ενσύρματες συσκευές';

  @override
  String wired_device_multiple_content(String deviceList) {
    return 'Υπάρχουν πολλές συνδεδεμένες συσκευές. Επιλέξτε τη συσκευή προορισμού κατά την εγκατάσταση:\n$deviceList';
  }

  @override
  String get android_permission_none => 'Δεν απαιτούνται δικαιώματα';

  @override
  String get android_permission_admin => 'Διαχείριση συσκευής ως διαχειριστής';

  @override
  String get android_permission_admin_brick =>
      'Απενεργοποίηση ή επαναφορά συσκευής';

  @override
  String get android_permission_admin_lock => 'Απομακρυσμένο κλείδωμα συσκευής';

  @override
  String get android_permission_storage => 'Αρχεία και πολυμέσα';

  @override
  String get android_permission_microphone => 'Μικρόφωνο';

  @override
  String get android_permission_camera => 'Κάμερα';

  @override
  String get android_permission_location => 'Τοποθεσία';

  @override
  String get android_permission_phone => 'Τηλέφωνο';

  @override
  String get android_permission_call_log => 'Αρχείο κλήσεων';

  @override
  String get android_permission_sms => 'Μηνύματα';

  @override
  String get android_permission_contacts => 'Επαφές';

  @override
  String get android_permission_calendar => 'Ημερολόγιο';

  @override
  String get android_permission_activity_recognition =>
      'Σωματική δραστηριότητα';

  @override
  String get android_permission_sensors => 'Αισθητήρες συσκευής';

  @override
  String get android_permission_sensors_body => 'Αισθητήρες σώματος';

  @override
  String get android_permission_nearby_devices =>
      'Εντοπισμός κοντινών συσκευών';

  @override
  String get android_permission_read_packages => 'Λήψη εγκατεστημένων πακέτων';
}
