import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Azkar extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int _takbir = 0, _tasbih = 0, _hamd = 0, _istghfar = 0;
  Future<void> getAzkar() async {
    final SharedPreferences prefs = await _prefs;
    _takbir = prefs.getInt("tak")!;
    _istghfar = prefs.getInt("ist")!;
    _hamd = prefs.getInt("hamd")!;
    _tasbih = prefs.getInt("tas")!;
    notifyListeners();
  }

  int get takbir => _takbir;
  int get tasbih => _tasbih;
  int get hamd => _hamd;
  int get istghfar => _istghfar;
  int get zikrtimes => _hamd + _istghfar + _takbir + _tasbih;
  
    Future<void> resetall() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("tak",_takbir= 0);
    _takbir = prefs.getInt("tak")!;
      prefs.setInt("tas",_tasbih= 0);
    _tasbih = prefs.getInt("tas")!;
     prefs.setInt("ist",_istghfar= 0);
    _istghfar = prefs.getInt("ist")!;
     prefs.setInt("hamd", _hamd = 0);
    _hamd = prefs.getInt("hamd")!;
    notifyListeners();
  }
  
  Future<void> addtakbir() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("tak", _takbir + 1);
    _takbir = prefs.getInt("tak")!;
    notifyListeners();
  }

  Future<void> resettakbir() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("tak", _takbir = 0);
    _takbir = prefs.getInt("tak")!;
    notifyListeners();
  }

  Future<void> addtasbih() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("tas", _tasbih + 1);
    _tasbih = prefs.getInt("tas")!;
    notifyListeners();
  }

  Future<void> resettasbih() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("tas", _tasbih = 0);
    _tasbih = prefs.getInt("tas")!;
    notifyListeners();
  }

  Future<void> addhamd() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("hamd", _hamd + 1);
    _hamd = prefs.getInt("hamd")!;
    notifyListeners();
  }

  Future<void> resethamd() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("hamd", _hamd = 0);
    _hamd = prefs.getInt("hamd")!;
    notifyListeners();
  }

  Future<void> addistghfar() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("ist", _istghfar + 1);
    _istghfar = prefs.getInt("ist")!;
    notifyListeners();
  }

  Future<void> reseistghf() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("ist", _istghfar = 0);
    _istghfar = prefs.getInt("ist")!;
    notifyListeners();
  }
}
