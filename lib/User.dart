
class UserDetails {
  String displayPhNum;
  String displayAddress;
  String uid;
  String displayName;
  String displayDob;
  String displayPin;
  String displayEmail;

  UserDetails(
      {this.displayPhNum,
        this.displayAddress,
        this.uid,
        this.displayName,
        this.displayDob,
        this.displayPin,
        this.displayEmail});

  UserDetails.fromJson(Map<String, dynamic> json) {
    displayPhNum = json['displayPhNum'];
    displayAddress = json['displayAddress'];
    uid = json['uid'];
    displayName = json['displayName'];
    displayDob = json['displayDob'];
    displayPin = json['displayPin'];
    displayEmail = json['displayEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayPhNum'] = this.displayPhNum;
    data['displayAddress'] = this.displayAddress;
    data['uid'] = this.uid;
    data['displayName'] = this.displayName;
    data['displayDob'] = this.displayDob;
    data['displayPin'] = this.displayPin;
    data['displayEmail'] = this.displayEmail;
    return data;
  }
}