import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:pipercrux/widgets/content/model/files_list_model.dart';
import 'package:pipercrux/widgets/content/view/user_radiobutton_component.dart';
import 'package:provider/provider.dart';

class FilePickerView extends StatefulWidget {
  FilePickerView({Key key}) : super(key: key);

  @override
  _FilePickerViewState createState() => new _FilePickerViewState();
}

class _FilePickerViewState extends State<FilePickerView> {
  final _filenameController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  String _path;
  String _extension;
  bool _loadingPath = false;

  @override
  void initState() {
    super.initState();
  }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _path = await FilePicker.getFilePath(
          type: FileType.any,
          allowedExtensions: (_extension?.isNotEmpty ?? false)
              ? _extension?.replaceAll(' ', '')?.split(',')
              : null);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _path.split('/').last;
    });
  }

  void _clearCachedFiles() {
    FilePicker.clearTemporaryFiles().then((result) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          backgroundColor: result ? Colors.green : Colors.red,
          content: Text((result
              ? 'Temporary files removed with success.'
              : 'Failed to clean temporary files')),
        ),
      );
    });
  }

  Future<Uint8List> _readFileByte(String filePath) async {
    Uri myUri = Uri.parse(filePath);
    File file = new File.fromUri(myUri);
    Uint8List bytes;
    await file.readAsBytes().then((value) {
      bytes = Uint8List.fromList(value);
      print('reading of bytes is completed');
    }).catchError((onError) {
      print('Exception Error while reading audio from path:' +
          onError.toString());
    });
    return bytes;
  }

  @override
  Widget build(BuildContext context) {
    final filesListModel = Provider.of<FilesListModel>(context);
    const TextStyle optionStyle = TextStyle(fontSize: 30);
    _filenameController.text = _path;

    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: <Widget>[
            Text(
              'Select file',
              style: optionStyle,
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              children: [
                Container(
                  width: 240,
                  child: TextField(
                    maxLines: 9,
                    minLines: 1,
                    controller: _filenameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: const EdgeInsets.all(10.0),
                      hintText: 'Filename',
                      enabled: false,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: RaisedButton(
                    padding: const EdgeInsets.all(13.0),
                    onPressed: _openFileExplorer,
                    color: Colors.black,
                    child: Text('/..',
                        style: TextStyle(fontSize: 15, color: Colors.teal)),
                  ),
                )
              ],
            ),
            Spacer(
              flex: 1,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                try {
                  _readFileByte(_path).then((bytesData) {
                    Uint8List bytes = bytesData;
                    (new Logger()).i("File size: "+bytes.length.toString()+" bytes ");
                    //todo bytes are ready
                  });
                } catch (e) {
                  print(e);
                }
                //filesListModel.changePage();
              },
              label: Text("   next   "),
            ),
          ],
        ),
      ),
    );
  }
}
