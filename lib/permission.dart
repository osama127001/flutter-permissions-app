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

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}