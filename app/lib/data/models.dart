class User {
  String uid;
  String username;
  String passwordHash;
  String cypherKey;

  List<File> userFiles;
  List<FilePart> storedParts;

  User({this.uid, this.username, this.cypherKey, this.passwordHash, this.userFiles, this.storedParts});

  static fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      username: map['username'],
      passwordHash: map['password_hash'],
      cypherKey: map['cypher_key'],
      // TODO: store files and stuff
      userFiles: map['files'] ?? [],
      storedParts: map['parts'] ?? []
    );
  }

  @override
  String toString() {
    return 'User(uid=$uid, username=$username, owned_files=${userFiles?.length}, stored_parts=${storedParts?.length})';
  }
}

class StorableData {
  User owner;
  int size;
  String checkSum;

  StorableData(this.owner, this.size, this.checkSum);
}

class File extends StorableData {
  String name;
  List<FilePart> parts;

  File({User owner, int size, String checkSum, this.name, this.parts})
      : super(owner, size, checkSum);
}

class FilePart extends StorableData {
  String name;
  User holder;

  FilePart({User owner, int size, String checkSum, this.holder, this.name})
      : super(owner, size, checkSum);
}
