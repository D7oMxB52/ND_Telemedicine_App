class ProfileObject {
  int userId;
  int profileId;
  double height;
  double weight;
  String healthStatus;


  ProfileObject(
    this.userId,
    this.profileId,
    this.height,
    this.weight,
    this.healthStatus
      );

  factory ProfileObject.fromJson(dynamic json) {
    return ProfileObject(
        json['userId'],
        json['profileId'],
        json['height'],
        json['weight'],
        json['healthStatus']
    );
  }

// @override
// String toString() {
//   return '{ ${this.name}, ${this.age} }';
// }
}