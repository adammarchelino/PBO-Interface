import 'emosi.dart';
import 'manusia.dart';
import 'kucing.dart';

void main() {
  Emosi objek;

  objek = Manusia("Adam", "L");
  objek.marah();
  objek.sedih();
  objek.bahagia();

  objek = Kucing();
  objek.marah();
  objek.sedih();
  objek.bahagia();
}
