import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlashLightView(),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flashlight App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
            onPressed: () {
              _turnOnFlash(context);
            }, child: Text("Flashlight Turn ON"),),
            ElevatedButton(onPressed: () {
              _turnOffFlash(context);
            }, child: Text("Flashlight Turn OFF")),
          ],
        ),
      ),
    );
  }

  Future<void> _turnOnFlash(BuildContext context) async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      _showErrorMes('Could not enable Flashlight', context);
    }
  }

  Future<void> _turnOffFlash(BuildContext context) async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      _showErrorMes('Could not enable Flashlight', context);
    }
  }
  void _showErrorMes(String mes, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(mes)));
  }
}
*/
class FlashLightView extends StatefulWidget {
  //const FlashLightView({super.key});
  const FlashLightView({Key? key}) : super(key: key);

  @override
  State<FlashLightView> createState() => _FlashLightViewState();
}

class _FlashLightViewState extends State<FlashLightView> {
  bool isLightOn = false; //For light turn ON/OFF

 
  _bulbonImage(){
    if(isLightOn )
     return Image.asset("assets/bulb_on.jpg");

    else
     return Image.asset("assets/bulb_off.jpg");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashlight'),
      ),
      body: Container(
        child: Center(
          child: Container(
            height: 900,
            width: double.infinity,
            child: Column(
              children: [
                _bulbonImage(),
                ElevatedButton(
                    onPressed: () {
                      
                      setState(() {
                        isLightOn = !isLightOn;
                        if (isLightOn) {
                          TorchLight.enableTorch(); // Enable Flashlight
                        } else {
                          TorchLight.disableTorch(); // Disable Flashlight
                        }
                      });
                    },
                    child: const Text('ON/OFF')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

