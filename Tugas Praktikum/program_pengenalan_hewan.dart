import 'dart:io';

// Interface Kemampuannya
abstract interface class Berlari {
  void berlari();
}

abstract interface class Berenang {
  void berenang();
}

abstract interface class Menyelam {
  void menyelam();
}

abstract interface class Terbang {
  void terbang();
}

abstract interface class Memanjat {
  void memanjat();
}

// Abstract Class Hewan
abstract class Hewan {
  String nama;
  Hewan(this.nama);
}

// Bermacam macam hewan yang inherit ke class hewan dan mengimplementasikan beberapa interface
class Singa extends Hewan implements Berlari, Berenang {
  Singa() : super("Singa");

  @override
  void berlari() => print("Singa berlari kencang mengejar mangsa!");

  @override
  void berenang() => print("Singa berenang menyeberangi sungai dengan tenang.");
}

class Elang extends Hewan implements Terbang {
  Elang() : super("Elang");

  @override
  void terbang() =>
      print("Elang terbang tinggi di angkasa sambil mengintai mangsa.");
}

class Ikan extends Hewan implements Berenang, Menyelam {
  Ikan() : super("Ikan");

  @override
  void berenang() => print("Ikan berenang lincah mengikuti arus air.");

  @override
  void menyelam() => print("Ikan menyelam ke dasar sungai mencari makan.");
}

class Cheetah extends Hewan implements Berlari, Berenang, Memanjat {
  Cheetah() : super("Cheetah");

  @override
  void berlari() =>
      print("Cheetah berlari dengan kecepatan hingga 120 km/jam!");

  @override
  void berenang() => print("Cheetah berenang meski tidak terlalu menyukainya.");

  @override
  void memanjat() =>
      print("Cheetah memanjat pohon untuk mengintai mangsa dari atas.");
}

class Katak extends Hewan implements Berlari, Berenang, Menyelam {
  Katak() : super("Katak");

  @override
  void berlari() => print("Katak berlari melompat-lompat dengan gesit.");

  @override
  void berenang() =>
      print("Katak berenang menggerakkan kedua kaki belakangnya.");

  @override
  void menyelam() =>
      print("Katak menyelam ke dalam air untuk bersembunyi dari predator.");
}

// Main
void main() {
  List<Hewan> daftarHewan = [Singa(), Elang(), Ikan(), Cheetah(), Katak()];

  print("Aplikasi Pengenalan Karakteristik Hewan \n");

  while (true) {
    print("Pilih hewan:");
    for (int i = 0; i < daftarHewan.length; i++) {
      print("${i + 1}. ${daftarHewan[i].nama}");
    }
    print("0. Keluar\n");

    stdout.write("Masukkan pilihan: ");
    int? pilihanHewan = int.tryParse(stdin.readLineSync() ?? "");

    if (pilihanHewan == null ||
        pilihanHewan < 0 ||
        pilihanHewan > daftarHewan.length) {
      print("Pilihan tidak valid.\n");
      continue;
    }

    if (pilihanHewan == 0) {
      print("Terima kasih sudah menggunakan aplikasi ini!");
      break;
    }

    Hewan hewan = daftarHewan[pilihanHewan - 1];

    // Daftar dan logika pemilihan
    print("\n${hewan.nama} dipilih. Kemampuan yang tersedia:\n");

    Map<int, Function> daftarKemampuan = {};
    int index = 1;

    if (hewan is Berlari) {
      daftarKemampuan[index] = (hewan as Berlari).berlari;
      print("$index. Berlari");
      index++;
    }
    if (hewan is Berenang) {
      daftarKemampuan[index] = (hewan as Berenang).berenang;
      print("$index. Berenang");
      index++;
    }
    if (hewan is Menyelam) {
      daftarKemampuan[index] = (hewan as Menyelam).menyelam;
      print("$index. Menyelam");
      index++;
    }
    if (hewan is Terbang) {
      daftarKemampuan[index] = (hewan as Terbang).terbang;
      print("$index. Terbang");
      index++;
    }
    if (hewan is Memanjat) {
      daftarKemampuan[index] = (hewan as Memanjat).memanjat;
      print("$index. Memanjat");
      index++;
    }
    print("0. Kembali\n");

    stdout.write("Masukkan pilihan kemampuan: ");
    int? pilihanKemampuan = int.tryParse(stdin.readLineSync() ?? "");

    if (pilihanKemampuan == null ||
        pilihanKemampuan < 0 ||
        pilihanKemampuan >= index) {
      print("Pilihan tidak valid.\n");
      continue;
    }

    if (pilihanKemampuan == 0) {
      print("");
      continue;
    }

    print("\n>> ${hewan.nama}:");
    daftarKemampuan[pilihanKemampuan]!();
    print("");
  }
}
