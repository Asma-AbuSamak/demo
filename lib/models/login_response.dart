class LoginResponse {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  double? expiresIn;
  User? user;

  LoginResponse({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      tokenType: json['token_type'],
      expiresIn: (json['expires_in'] as num?)?.toDouble(),
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
      'user': user?.toJson(),
    };
  }
}

class User {
  String? email;
  String? loginName;
  String? userName;
  String? title;
  String? resourceId;
  Resource? resource;
  String? groupsId;
  String? ipAddress;
  String? agent;
  List<dynamic>? groupIdsList;
  List<dynamic>? claims;
  List<dynamic>? claimGroups;
  String? delegatedBy;
  String? name;
  int? id;
  String? created;
  String? modified;
  dynamic authorId;
  dynamic author;
  dynamic editorId;
  dynamic editor;

  User({
    this.email,
    this.loginName,
    this.userName,
    this.title,
    this.resourceId,
    this.resource,
    this.groupsId,
    this.ipAddress,
    this.agent,
    this.groupIdsList,
    this.claims,
    this.claimGroups,
    this.delegatedBy,
    this.name,
    this.id,
    this.created,
    this.modified,
    this.authorId,
    this.author,
    this.editorId,
    this.editor,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['Email'],
      loginName: json['LoginName'],
      userName: json['UserName'],
      title: json['Title'],
      resourceId: json['ResourceId'],
      resource: json['Resource'] != null ? Resource.fromJson(json['Resource']) : null,
      groupsId: json['GroupsId'],
      ipAddress: json['IPAddress'],
      agent: json['Agent'],
      groupIdsList: json['GroupIdsList'],
      claims: json['Claims'],
      claimGroups: json['ClaimGroups'],
      delegatedBy: json['DelegatedBy'],
      name: json['Name'],
      id: json['Id'],
      created: json['Created'],
      modified: json['Modified'],
      authorId: json['AuthorId'],
      author: json['Author'],
      editorId: json['EditorId'],
      editor: json['Editor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Email': email,
      'LoginName': loginName,
      'UserName': userName,
      'Title': title,
      'ResourceId': resourceId,
      'Resource': resource?.toJson(),
      'GroupsId': groupsId,
      'IPAddress': ipAddress,
      'Agent': agent,
      'GroupIdsList': groupIdsList,
      'Claims': claims,
      'ClaimGroups': claimGroups,
      'DelegatedBy': delegatedBy,
      'Name': name,
      'Id': id,
      'Created': created,
      'Modified': modified,
      'AuthorId': authorId,
      'Author': author,
      'EditorId': editorId,
      'Editor': editor,
    };
  }
}

class Resource {
  dynamic rbs;
  String? id;
  bool? canLevel;
  dynamic code;
  int? costAccrual;
  dynamic costCenter;
  int? defaultBookingType;
  String? email;
  dynamic externalId;
  dynamic group;
  String? initials;
  bool? isActive;
  bool? isBudget;
  bool? isCheckedOut;
  bool? isGeneric;
  bool? isTeam;
  String? name;
  int? resourceIdentifier;
  int? resourceType;
  dynamic postionAr;
  dynamic postionEn;
  String? created;
  String? modified;
  dynamic authorId;
  dynamic author;
  dynamic editorId;
  dynamic editor;

  Resource({
    this.rbs,
    this.id,
    this.canLevel,
    this.code,
    this.costAccrual,
    this.costCenter,
    this.defaultBookingType,
    this.email,
    this.externalId,
    this.group,
    this.initials,
    this.isActive,
    this.isBudget,
    this.isCheckedOut,
    this.isGeneric,
    this.isTeam,
    this.name,
    this.resourceIdentifier,
    this.resourceType,
    this.postionAr,
    this.postionEn,
    this.created,
    this.modified,
    this.authorId,
    this.author,
    this.editorId,
    this.editor,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      rbs: json['RBS'],
      id: json['Id'],
      canLevel: json['CanLevel'],
      code: json['Code'],
      costAccrual: json['CostAccrual'],
      costCenter: json['CostCenter'],
      defaultBookingType: json['DefaultBookingType'],
      email: json['Email'],
      externalId: json['ExternalId'],
      group: json['Group'],
      initials: json['Initials'],
      isActive: json['IsActive'],
      isBudget: json['IsBudget'],
      isCheckedOut: json['IsCheckedOut'],
      isGeneric: json['IsGeneric'],
      isTeam: json['IsTeam'],
      name: json['Name'],
      resourceIdentifier: json['ResourceIdentifier'],
      resourceType: json['ResourceType'],
      postionAr: json['PostionAr'],
      postionEn: json['PostionEn'],
      created: json['Created'],
      modified: json['Modified'],
      authorId: json['AuthorId'],
      author: json['Author'],
      editorId: json['EditorId'],
      editor: json['Editor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'RBS': rbs,
      'Id': id,
      'CanLevel': canLevel,
      'Code': code,
      'CostAccrual': costAccrual,
      'CostCenter': costCenter,
      'DefaultBookingType': defaultBookingType,
      'Email': email,
      'ExternalId': externalId,
      'Group': group,
      'Initials': initials,
      'IsActive': isActive,
      'IsBudget': isBudget,
      'IsCheckedOut': isCheckedOut,
      'IsGeneric': isGeneric,
      'IsTeam': isTeam,
      'Name': name,
      'ResourceIdentifier': resourceIdentifier,
      'ResourceType': resourceType,
      'PostionAr': postionAr,
      'PostionEn': postionEn,
      'Created': created,
      'Modified': modified,
      'AuthorId': authorId,
      'Author': author,
      'EditorId': editorId,
      'Editor': editor,
    };
  }
}
