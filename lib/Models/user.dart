class User{
  // String id;
  String userName;
  String userHistory;
  String userPhoto;


  User({
    required this.userName,
    required this.userHistory,
    required this.userPhoto
  });


  factory User.fromJson(Map<String, dynamic> json){
  return User(userName: json[''],
      userHistory: json[''],
      userPhoto: json['']);
  }

  Map<String, dynamic> toMap(){
    return{

    };
  }


}