class User {
  String uid;
  String email;
  String password;
  String cypherKey;

  List<File> userFiles;
  List<FilePart> storedParts;

  User({this.uid, this.email, this.cypherKey, this.password, this.userFiles, this.storedParts});
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

  File({User owner, int size, String checkSum, this.name, this.parts}) : super(owner, size, checkSum);
}

class FilePart extends StorableData {
  String name;
  User holder;

  FilePart({User owner, int size, String checkSum, this.holder, this.name})
      : super(owner, size, checkSum);
}
