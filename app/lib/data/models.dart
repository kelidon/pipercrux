class User {
  String id;
  String username;
  String passwordHash;
  String passwordSalt;
  String cypherKey;

  List<File> userFiles;
  List<FilePart> storedParts;

  User(
      {this.id,
      this.username,
      this.cypherKey,
      this.passwordHash,
      this.passwordSalt,
      this.userFiles,
      this.storedParts});

  static User fromMap(Map<String, dynamic> map) {
    return User(
        id: map['uid'],
        username: map['username'],
        passwordHash: map['password_hash'],
        passwordSalt: map['password_salt'],
        cypherKey: map['cypher_key'],
        // TODO: store files and stuff
        userFiles: map['files'] ?? [],
        storedParts: map['parts'] ?? []);
  }

  @override
  String toString() {
    return 'User(uid=$id, username=$username, owned_files=${userFiles?.length}, stored_parts=${storedParts?.length})';
  }

  Map<String, dynamic> toMap() => {
        'username': username,
        'password_hash': passwordHash,
        'cypher_key': cypherKey,
        'password_salt': passwordSalt
      };
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
