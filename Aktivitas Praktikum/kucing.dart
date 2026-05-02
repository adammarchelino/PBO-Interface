import 'hewan.dart';
import 'emosi.dart';

class Kucing extends Hewan implements Emosi {
  String? ras;
  String? warnaBulu;

  @override
  void berkembangBiak() {
    print("Kucing berkembang biak dengan melahirkan anak kucing yang imuet");
  }

  @override
  void bergerak() {
    print("Kucing bergerak dengan keempat kakinya");
  }

  void berburu() {
    print("Kucing punya insting hewani untuk berburu");
  }

  @override
  void marah() {
    print("Kucing yang marah akan bersuara aneh, dan bulunya berdiri");
  }

  @override
  void sedih() {
    print("Kucing yang sedih akan malas makan dan tidur terus");
  }

  @override
  void bahagia() {
    print("Kucing yang bahagia akan mengendus dan mendekati kita");
  }
}
