import 'package:json_annotation/json_annotation.dart';
import 'package:pass_flutter/src/models/pass_json/barcode/barcode.dart';
import 'package:pass_flutter/src/models/pass_json/location/location.dart';
import 'package:pass_flutter/src/models/pass_json/structure_dictionary/pass_structure_dictionary.dart';

part 'pass_json.g.dart';

@JsonSerializable()
class PassJson {
  // Standart keys

  /// Required. Brief description of the pass, used by the iOS accessibility technologies.
  /// Don’t try to include all of the data on the pass in its description,
  /// just include enough detail to distinguish passes of the same type.
  String description;

  /// Required. Version of the file format. The value must be 1.
  int formatVersion;

  /// Required. Display name of the organization that originated and signed the pass.
  String organizationName;

  /// Required. Pass type identifier, as issued by Apple. The value must correspond with your signing certificate.
  String passTypeIdentifier;

  /// Required. Serial number that uniquely identifies the pass. No two passes with the same pass type identifier may have the same serial number.
  String serialNumber;

  /// Required. Team identifier of the organization that originated and signed the pass, as issued by Apple.
  String teamIdentifier;

  // Web Service Keys

  /// The URL of a web service that conforms to the API described in PassKit Web Service Reference.
  /// The web service must use the HTTPS protocol; the leading https:// is included in the value of this key.
  /// On devices configured for development, there is UI in Settings to allow HTTP web services.
  String webServiceURL;

  /// The authentication token to use with the web service. The token must be 16 characters or longer.
  String authenticationToken;

  // Visual Appearance Keys

  /// Optional. Information specific to the pass’s barcode. For this dictionary’s keys, see Barcode Dictionary Keys.
  /// Note:Deprecated in iOS 9.0 and later; use barcodes instead.
  Barcode barcode;

  /// Optional. Information specific to the pass’s barcode.
  /// The system uses the first valid barcode dictionary in the array.
  /// Additional dictionaries can be added as fallbacks. For this dictionary’s keys,
  /// see Barcode Dictionary Keys.
  /// Note: Available only in iOS 9.0 and later.
  List<Barcode> barcodes;

  /// Optional. Background color of the pass, specified as an CSS-style RGB triple. For example, rgb(23, 187, 82).
  String backgroundColor;

  /// Optional. Foreground color of the pass, specified as a CSS-style RGB triple. For example, rgb(100, 10, 110).
  String foregroundColor;

  /// Optional. Color of the label text, specified as a CSS-style RGB triple. For example, rgb(255, 255, 255).
  /// If omitted, the label color is determined automatically.
  String labelColor;

  /// Optional for event tickets and boarding passes; otherwise not allowed.
  /// Identifier used to group related passes. If a grouping identifier is specified,
  /// passes with the same style, pass type identifier, and grouping identifier are displayed as a group.
  /// Otherwise, passes are grouped automatically.
  /// Use this to group passes that are tightly related, such as the boarding passes for different
  /// connections of the same trip.
  /// Available in iOS 7.0.
  String groupingIdentifier;

  /// Optional. Text displayed next to the logo on the pass.
  String logoText;

  /// Optional. If true, the strip image is displayed without a shine effect.
  /// The default value prior to iOS 7.0 is false.
  /// In iOS 7.0, a shine effect is never applied, and this key is deprecated.
  bool suppressStripShine;

  // Style Keys

  /// Information specific to a store card.
  PassStructureDictionary storeCard;

  /// Information specific to a generic pass.
  PassStructureDictionary generic;

  /// Information specific to an event ticket.
  PassStructureDictionary eventTicket;

  /// Information specific to a coupon.
  PassStructureDictionary coupon;

  /// Information specific to a boarding pass.
  PassStructureDictionary boardingPass;

  // Relevance Keys

  /// Optional. Locations where the pass is relevant. For example, the location of your store.
  List<Location> locations;

  /// Optional. Maximum distance in meters from a relevant latitude and longitude that the pass is relevant.
  /// This number is compared to the pass’s default distance and the smaller value is used.
  /// Available in iOS 7.0.
  int maxDistance;

  /// Recommended for event tickets and boarding passes; otherwise optional.
  /// Date and time when the pass becomes relevant. For example, the start time of a movie.
  /// The value must be a complete date with hours and minutes, and may optionally include seconds.
  String relevantDate;

  // Associated App Keys

  /// Optional. A list of iTunes Store item identifiers for the associated apps.
  /// Only one item in the list is used—the first item identifier for an app compatible with the current device.
  /// If the app is not installed, the link opens the App Store and shows the app.
  /// If the app is already installed, the link launches the app.
  List<int> associatedStoreIdentifiers;

  /// Optional. A URL to be passed to the associated app when launching it.
  /// The app receives this URL in the application:didFinishLaunchingWithOptions: and application:openURL:options:
  /// methods of its app delegate.
  /// If this key is present, the associatedStoreIdentifiers key must also be present.
  String appLaunchURL;

  // Expiration Keys

  /// Optional. Date and time when the pass expires.
  /// The value must be a complete date with hours and minutes, and may optionally include seconds.
  /// Available in iOS 7.0.
  String expirationDate;

  /// Optional. Indicates that the pass is void—for example, a one time use coupon that has been redeemed. The default value is false.
  /// Available in iOS 7.0.
  bool voided;

  PassJson({
    this.formatVersion,
    this.storeCard,
    this.coupon,
    this.generic,
    this.eventTicket,
    this.boardingPass,
    this.passTypeIdentifier,
    this.description,
    this.teamIdentifier,
    this.labelColor,
    this.backgroundColor,
    this.foregroundColor,
    this.organizationName,
    this.webServiceURL,
    this.serialNumber,
    this.authenticationToken,
    this.associatedStoreIdentifiers,
    this.appLaunchURL,
    this.expirationDate,
    this.voided,
    this.groupingIdentifier,
    this.logoText,
    this.suppressStripShine,
    this.barcodes,
    this.barcode,
    this.locations,
  });

  factory PassJson.fromJson(Map<String, dynamic> json) =>
      _$PassJsonFromJson(json);

  Map<String, dynamic> toJson() => _$PassJsonToJson(this);
}
