import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionWidget extends StatefulWidget {
  const PermissionWidget(this._permission);
  final Permission _permission;

  @override
  _PermissionWidgetState createState() => _PermissionWidgetState(_permission);
}

class _PermissionWidgetState extends State<PermissionWidget> {
  _PermissionWidgetState(this._permission);
  final Permission _permission;
  PermissionStatus _permissionStatus = PermissionStatus.undetermined;

  // calls the initState() of parent class
  @override
  void initState() {
    super.initState();
    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  Color getPermissionColor() {
    switch (_permissionStatus) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile();
  }

  void checkServiceStatus(BuildContext context, Permission permission) async {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text((await permission.status).toString()),
      ),
    );
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();
    setState(() {
      print(status);
      _permissionStatus = status;
    });
  }


}
