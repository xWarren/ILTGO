import 'package:flutter/material.dart';
import '../colors/textcolor.dart';
import 'n_r_license.dart';
import 'new_license_data.dart';

class NewLicense extends StatefulWidget {
  const NewLicense({Key? key}) : super(key: key);

  @override
  State<NewLicense> createState() => _NewLicenseState();
}

class _NewLicenseState extends State<NewLicense> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorText.maintextColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: ColorText.accent,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: licenses.length,
            itemBuilder: (context, int index) => Container(
              margin: const EdgeInsets.all(20),
              height: 80,
              child: Stack(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NRLicense(licenses[index])));
                      },
                      child: Card(
                        color: ColorText.accent,
                        child: ListTile(
                          title: Text(licenses[index].title),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
