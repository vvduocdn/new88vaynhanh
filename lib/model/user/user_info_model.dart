/* 
// Example UsageModeal
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class UserInfoModel {
    String? id;
    String? roomId;
    String? userName;
    String? displayName;
    String? avatar;
    String? cover;
    int? sex;
    String? sexName;
    DateTime? birthday;
    bool? isFollowing;
    String? bio;
    int? totalFollow;
    bool? isStreaming;
    int? followers;
    int? level;
    List<SocialNetwork?>? socialNetworks;
    int? userType;
    String? userTypeName;
    int? diamond;
    String? phoneNumber;
    bool? isWelcome;
    int? followings;
    String? refCode;
    String? myNetworkId;

    UserInfoModel({this.id, this.roomId, this.userName, this.displayName, this.avatar, this.cover, this.sex, this.sexName, this.birthday, this.isFollowing, this.bio, this.totalFollow, this.isStreaming, this.followers, this.level, this.socialNetworks, this.userType, this.userTypeName, this.diamond, this.phoneNumber, this.isWelcome, this.followings, this.refCode, this.myNetworkId}); 

    UserInfoModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        roomId = json['roomId'];
        userName = json['userName'];
        displayName = json['displayName'];
        avatar = json['avatar'];
        cover = json['cover'];
        sex = json['sex'];
        sexName = json['sexName'];
        birthday = json['birthday'];
        isFollowing = json['isFollowing'];
        bio = json['bio'];
        totalFollow = json['totalFollow'];
        isStreaming = json['isStreaming'];
        followers = json['followers'];
        level = json['level'];
        if (json['socialNetworks'] != null) {
         socialNetworks = <SocialNetwork>[];
         json['socialNetworks'].forEach((v) {
         socialNetworks!.add(SocialNetwork.fromJson(v));
        });
      }
        userType = json['userType'];
        userTypeName = json['userTypeName'];
        diamond = json['diamond'];
        phoneNumber = json['phoneNumber'];
        isWelcome = json['isWelcome'];
        followings = json['followings'];
        refCode = json['refCode'];
        myNetworkId = json['myNetworkId'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = id;
        data['roomId'] = roomId;
        data['userName'] = userName;
        data['displayName'] = displayName;
        data['avatar'] = avatar;
        data['cover'] = cover;
        data['sex'] = sex;
        data['sexName'] = sexName;
        data['birthday'] = birthday;
        data['isFollowing'] = isFollowing;
        data['bio'] = bio;
        data['totalFollow'] = totalFollow;
        data['isStreaming'] = isStreaming;
        data['followers'] = followers;
        data['level'] = level;
        data['socialNetworks'] =socialNetworks?.map((v) => v?.toJson()).toList();
        data['userType'] = userType;
        data['userTypeName'] = userTypeName;
        data['diamond'] = diamond;
        data['phoneNumber'] = phoneNumber;
        data['isWelcome'] = isWelcome;
        data['followings'] = followings;
        data['refCode'] = refCode;
        data['myNetworkId'] = myNetworkId;
        return data;
    }
}

class SocialNetwork {
    int? type;
    String? link;
    String? socialNetworkName;

    SocialNetwork({this.type, this.link, this.socialNetworkName}); 

    SocialNetwork.fromJson(Map<String, dynamic> json) {
        type = json['type'];
        link = json['link'];
        socialNetworkName = json['socialNetworkName'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['type'] = type;
        data['link'] = link;
        data['socialNetworkName'] = socialNetworkName;
        return data;
    }
}

