# Deskripsi Program

Program ini merupakan simulasi aplikasi pengenalan karakteristik hewan berbasis teks (CLI) yang dibangun menggunakan bahasa pemrograman Dart. Pengguna dapat memilih seekor hewan dari daftar yang tersedia, kemudian program hanya akan menampilkan kemampuan yang memang dimiliki oleh hewan tersebut. Implementasi ini memanfaatkan konsep **interface**, **abstract class**, dan **operator `is`** sebagai inti dari logika seleksi kemampuan secara dinamis.

---

## Struktur Program

```
main.dart
├── Interface Kemampuan     (Berlari, Berenang, Menyelam, Terbang, Memanjat)
├── Abstract Class Hewan
├── Class Hewan             (Singa, Elang, Ikan, Cheetah, Katak)
└── main()
```

---

## Analisa

### 1. Interface Kemampuan

```dart
abstract interface class Berlari  { void berlari();  }
abstract interface class Berenang { void berenang(); }
abstract interface class Menyelam { void menyelam(); }
abstract interface class Terbang  { void terbang();  }
abstract interface class Memanjat { void memanjat(); }
```

Setiap kemampuan didefinisikan sebagai interface yang berdiri sendiri. Pemisahan ini disengaja agar setiap kemampuan bersifat independen dan dapat dikombinasikan secara bebas ke class manapun yang membutuhkannya. Masing-masing interface hanya berisi satu deklarasi method tanpa implementasi, sesuai dengan prinsip dasar interface sebagai kontrak perilaku. Class yang menggunakannya wajib menyediakan implementasi konkret dari method tersebut.

---

### 2. Abstract Class Hewan

```dart
abstract class Hewan {
  String nama;
  Hewan(this.nama);
}
```

Class `Hewan` berperan sebagai fondasi bersama seluruh hewan dalam program ini. Atribut `nama` bersifat universal karena semua hewan pasti memiliki nama, sehingga ditempatkan di level ini agar tidak perlu didefinisikan ulang di setiap subclass. Class ini dibuat `abstract` karena "hewan" secara umum terlalu abstrak untuk diinstansiasi langsung menjadi objek nyata, sehingga penggunaannya hanya melalui subclass yang lebih spesifik.

---

### 3. Class Hewan

```dart
class Singa   extends Hewan implements Berlari, Berenang        { ... }
class Elang   extends Hewan implements Terbang                  { ... }
class Ikan    extends Hewan implements Berenang, Menyelam       { ... }
class Cheetah extends Hewan implements Berlari, Berenang, Memanjat { ... }
class Katak   extends Hewan implements Berlari, Berenang, Menyelam { ... }
```

Setiap class hewan mewarisi `Hewan` melalui `extends` dan mengimplementasikan interface kemampuan yang relevan melalui `implements`. Kombinasi keduanya dalam satu deklarasi memperlihatkan bagaimana Dart mendukung penggunaan pewarisan dan interface secara bersamaan. Jumlah interface yang diimplementasikan berbeda-beda sesuai kemampuan nyata masing-masing hewan, misalnya `Elang` hanya mengimplementasikan `Terbang`, sedangkan `Cheetah` mengimplementasikan tiga interface sekaligus. Setiap method yang berasal dari interface ditandai dengan annotation `@override` sebagai tanda bahwa kewajiban kontrak telah dipenuhi.

---

### 4. Fungsi `main()`

```dart
List<Hewan> daftarHewan = [Singa(), Elang(), Ikan(), Cheetah(), Katak()];
```

Seluruh objek hewan disimpan dalam satu `List<Hewan>`. Penggunaan tipe `Hewan` sebagai tipe list memungkinkan penyimpanan berbagai objek yang berbeda-beda dalam satu wadah, selama semuanya merupakan turunan dari `Hewan`. Pengguna kemudian diminta memasukkan nomor urut hewan yang ingin dipilih, dan program akan mengambil objek yang sesuai dari list tersebut.

---

### 5. Logika Seleksi Kemampuan

```dart
Map<int, Function> daftarKemampuan = {};
int index = 1;

if (hewan is Berlari)  { daftarKemampuan[index] = (hewan as Berlari).berlari;   print("$index. Berlari");   index++; }
if (hewan is Berenang) { daftarKemampuan[index] = (hewan as Berenang).berenang; print("$index. Berenang"); index++; }
if (hewan is Menyelam) { daftarKemampuan[index] = (hewan as Menyelam).menyelam; print("$index. Menyelam"); index++; }
if (hewan is Terbang)  { daftarKemampuan[index] = (hewan as Terbang).terbang;   print("$index. Terbang");  index++; }
if (hewan is Memanjat) { daftarKemampuan[index] = (hewan as Memanjat).memanjat; print("$index. Memanjat"); index++; }
```

Blok ini merupakan inti dari seluruh program. Operator `is` digunakan untuk memeriksa apakah objek hewan yang dipilih merupakan instance dari masing-masing interface. Jika hasilnya `true`, kemampuan tersebut baru didaftarkan ke menu dan disimpan ke dalam `Map<int, Function>` agar bisa dipanggil nanti berdasarkan nomor pilihan pengguna. Jika `false`, kemampuan tersebut tidak akan muncul sama sekali.

Pendekatan ini menjawab kebutuhan soal secara langsung: kontrol kemampuan muncul secara dinamis menyesuaikan objek yang sedang aktif. Operator `as` digunakan pada saat assignment ke map untuk memberitahu compiler Dart secara eksplisit bahwa objek tersebut boleh diperlakukan sebagai tipe interface yang dimaksud, karena Dart tidak melakukan type promotion secara otomatis pada konteks tersebut.

---

### 6. Eksekusi Kemampuan

```dart
print("\n>> ${hewan.nama}:");
daftarKemampuan[pilihanKemampuan]!();
```

Setelah pengguna memilih nomor kemampuan, program cukup memanggil fungsi yang tersimpan di map berdasarkan key yang dipilih. Dengan cara ini, tidak diperlukan kondisi `if` tambahan untuk mengeksekusi kemampuan karena referensi fungsinya sudah tersimpan sejak tahap pendaftaran.

---

## Tabel Kemampuan Hewan

| Hewan   | Berlari | Berenang | Menyelam | Terbang | Memanjat |
|---------|:-------:|:--------:|:--------:|:-------:|:--------:|
| Singa   | ✓       | ✓        |          |         |          |
| Elang   |         |          |          | ✓       |          |
| Ikan    |         | ✓        | ✓        |         |          |
| Cheetah | ✓       | ✓        |          |         | ✓        |
| Katak   | ✓       | ✓        | ✓        |         |          |

---

## Contoh Output

```
Aplikasi Pengenalan Karakteristik Hewan

Pilih hewan:
1. Singa
2. Elang
3. Ikan
4. Cheetah
5. Katak
0. Keluar

Masukkan pilihan: 4

Cheetah dipilih. Kemampuan yang tersedia:

1. Berlari
2. Berenang
3. Memanjat
0. Kembali

Masukkan pilihan kemampuan: 1

>> Cheetah:
Cheetah berlari dengan kecepatan hingga 120 km/jam!
```
