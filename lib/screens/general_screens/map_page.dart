import 'package:flutter/material.dart';
import 'package:min_assist/screens/general_screens/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:min_assist/providers/congregation_provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  CongregationProvider? _congregationProvider;

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
  void initState() {
    super.initState();
    _congregationProvider =
        Provider.of<CongregationProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Congregation Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _openSettings,
          )
        ],
      ),
      body: Center(
        child: Text(
          'This is the page for the Congregation Map',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
