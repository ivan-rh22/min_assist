import 'package:flutter/material.dart';
import 'package:min_assist/models/congregation.dart';
import 'package:min_assist/screens/flash_screens/create_congregation.dart';
import 'settings_page.dart';
import 'package:provider/provider.dart';
import 'package:min_assist/providers/congregation_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  CongregationProvider? _congregationProvider;

  @override
  void initState() {
    super.initState();
    _congregationProvider =
        Provider.of<CongregationProvider>(context, listen: false);
  }

  void _onCongregationCreated(Congregation congregation) {
    setState(() {
      _congregationProvider!.congregation = congregation;
    });
  }

  Future<void> _createCongregation() async {
    final congregation = await showDialog(
      context: context,
      builder: (BuildContext context) => CreateCongregationPage(
        onCongregationCreated: _onCongregationCreated,
        hasExistingCongregation: _congregationProvider!.congregation != null,
      ),
    );
    if (congregation != null) {
      setState(() {
        _congregationProvider!.congregation = congregation;
      });
    }
  }

  void _openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SettingsPage(
                congregationName: _congregationProvider!.congregation?.name ??
                    'Sample Congregation',
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBarTitle = _congregationProvider!.congregation != null
        ? Text(_congregationProvider!.congregation!.name)
        : const Text('Home');
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _openSettings,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_congregationProvider!.congregation == null)
              ElevatedButton(
                onPressed: _createCongregation,
                child: const Text('Create'),
              )
          ],
        ),
      ),
    );
  }
}
