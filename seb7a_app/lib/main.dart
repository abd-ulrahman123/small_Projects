import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seb7a_app/azkar_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Azkar(), child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final prov = Provider.of<Azkar>(context, listen: false);
      prov.getAzkar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'seb7a app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var verticalspace = const SizedBox(
      height: 15,
    );
    Azkar provider = Provider.of<Azkar>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("وَلَذِكْرُ اللَّهِ أَكْبَرُ")),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        //minimum: EdgeInsets.only(right:15),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue.shade200, Colors.blue.shade900],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Zikr_box(
                        colur: Colors.redAccent,
                        zikrName: " الحمد لله",
                        zikrTimes: "${provider.hamd}",
                      ),
                      Zikr_box(
                        colur: Colors.purpleAccent,
                        zikrName: " سبحان الله ",
                        zikrTimes: "${provider.tasbih}",
                      ),
                      Zikr_box(
                        colur: Colors.yellow,
                        zikrName: " أستغفر الله",
                        zikrTimes: "${provider.istghfar}",
                      ),
                      Zikr_box(
                        colur: Colors.green,
                        zikrName: " الله أكبر ",
                        zikrTimes: "${provider.takbir}",
                      ),
                      Zikr_box(
                          colur: const Color.fromARGB(255, 146, 172, 194),
                          zikrName: "المجموع",
                          zikrTimes: "${provider.zikrtimes}")
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue.shade900, Colors.blue.shade200],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Add your colored widgets here
                      Zikr_score(
                          zikrReset: () {
                            provider.resethamd();
                          },
                          scoreColur: Colors.redAccent,
                          zikrAdd: () {
                            provider.addhamd();
                          }),

                      verticalspace,
                      Zikr_score(
                          zikrReset: () {
                            provider.resettasbih();
                          },
                          scoreColur: Colors.purple,
                          zikrAdd: () {
                            provider.addtasbih();
                          }),
                      verticalspace,
                      Zikr_score(
                          zikrReset: () {
                            provider.reseistghf();
                          },
                          scoreColur: Colors.yellow,
                          zikrAdd: () {
                            provider.addistghfar();
                          }),
                      verticalspace,
                      Zikr_score(
                          zikrReset: () {
                            provider.resettakbir();
                          },
                          scoreColur: Colors.green,
                          zikrAdd: () {
                            provider.addtakbir();
                          }),
                      CircleAvatar(
                        backgroundColor:Colors.red ,
                        child: IconButton(
                            onPressed: () {
                              provider.resetall();
                            },
                            icon: Icon(Icons.restore_rounded),color:Colors.deepPurpleAccent ,),
                      ),
                      verticalspace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Zikr_score extends StatelessWidget {
  final Color _scoreColur;
  Function() zikrAdd;
  Function() zikrReset;

  Zikr_score(
      {required Color scoreColur,
      required this.zikrAdd,
      required this.zikrReset})
      : _scoreColur = scoreColur;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: zikrReset, icon: const Icon(Icons.restore_outlined)),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: _scoreColur,
              shape: BoxShape.circle,
            ),
            child: IconButton(onPressed: zikrAdd, icon: const Icon(Icons.add)),
          ),
        ],
      ),
    );
  }
}

class Zikr_box extends StatelessWidget {
  final Color _colur;
  String zikrName;
  String zikrTimes;
  Zikr_box(
      {required Color colur, required this.zikrName, required this.zikrTimes})
      : _colur = colur;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 20,
        ),
        Text(zikrTimes, style: const TextStyle(fontSize: 18)),
        Container(
          height: 50,
          width: size.width / 1.8,
          decoration: BoxDecoration(
            color: _colur,
          ),
          child: Center(
              child: Text(
            zikrName,
            style: const TextStyle(fontSize: 20),
          )),
        ),
      ],
    );
  }
}
