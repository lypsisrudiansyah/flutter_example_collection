import 'package:flutter/material.dart';

class BottomSheetOnDissmissConfirmAndHeightMoreThanHalfCanBeScrollable extends StatefulWidget {
  const BottomSheetOnDissmissConfirmAndHeightMoreThanHalfCanBeScrollable({super.key});

  @override
  _BottomSheetOnDissmissConfirmAndHeightMoreThanHalfCanBeScrollableState createState() =>
      _BottomSheetOnDissmissConfirmAndHeightMoreThanHalfCanBeScrollableState();
}

class _BottomSheetOnDissmissConfirmAndHeightMoreThanHalfCanBeScrollableState
    extends State<BottomSheetOnDissmissConfirmAndHeightMoreThanHalfCanBeScrollable> {
  bool _isBottomSheetVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenge Rudi'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showBottomSheet();
          },
          child: const Text('Show BottomSheet'),
        ),
      ),
    );
  }

  void _showBottomSheet() async {
    _isBottomSheetVisible = true;

    showModalBottomSheet(
      // * This one for setting that bottom sheet height is can be more than half of screen
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        // * This can be dynamic height content inside bottom sheet, but had issue for scrollable widget(cannot) - so i tak another way using ListView
        /*  return Wrap(
          children: <Widget>[
            Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                      width: 200,
                      height: 200,
                    ),
                    Image.network(
                      'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                      width: 200,
                      height: 200,
                    ),
                    Image.network(
                      'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                      width: 200,
                      height: 200,
                    ),
                    Image.network(
                      'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                      width: 200,
                      height: 200,
                    ),
                    Image.network(
                      'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                      width: 200,
                      height: 200,
                    ),
                    Image.network(
                      'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              ),
            )
          ],
        ); */
        // * Can be scrollable the content using ListView, for dynamic or large list better shrinkWrap set to false, but shrinkWrap set to true for small list(known size)
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: ListView(
            padding: const EdgeInsets.all(10),
            shrinkWrap: false,
            children: <Widget>[
              Image.network(
                'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                width: 200,
                height: 200,
              ),
              Image.network(
                'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                width: 200,
                height: 200,
              ),
              Image.network(
                'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                width: 200,
                height: 200,
              ),
              Image.network(
                'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                width: 200,
                height: 200,
              ),
              Image.network(
                'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                width: 200,
                height: 200,
              ),
              Image.network(
                'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                width: 200,
                height: 200,
              ),
              Image.network(
                'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                width: 200,
                height: 200,
              ),
              Image.network(
                'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                width: 200,
                height: 200,
              ),
              Image.network(
                'https://media1.tenor.com/m/_X0IOt7CcUwAAAAC/hinata-smile.gif',
                width: 200,
                height: 200,
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      if (_isBottomSheetVisible) {
        _showDialog();
      }
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Do you want to close the BottomSheet?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showBottomSheet();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
