import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<int> faktoriyelHesapla(int sayi) async {
    int sonuc = 1;

    for (var i = 1; i <= sayi; i++) {
      sonuc = sonuc * i;
    }

    return sonuc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<int>(
                future: faktoriyelHesapla(5),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print("Hata sonucu : ${snapshot.error}");
                  }

                  if (snapshot.hasData) {
                    return Text("Sonuç : ${snapshot.data}");
                  } else {
                    return Text("Gösterilecek Veri Yok");
                  }
                })
          ],
        ),
      ),
    );
  }
}
