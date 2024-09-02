import 'package:uuid/uuid.dart';
import 'dto/trip_dto.dart';

abstract class TripLocalDataSource {
  Future<List<TripDto>> getAllTrips();
}

class DefaultTripLocalDataSource implements TripLocalDataSource {
  final Uuid uuid;
  DefaultTripLocalDataSource(this.uuid);
  @override
  Future<List<TripDto>> getAllTrips() {
    return Future.delayed(
        const Duration(milliseconds: 1500),
        () => [
              TripDto(
                  id: uuid.v1(),
                  name:
                      "3D/2N Favourite Surabaya Mt Bromo Spectaculer Tour Via Batu Malang",
                  image:
                      "https://www.jabatowisata.com/index/jabato/files/bromo_and_friends_by_puthanindya-d465mmz.jpg",
                  location: "Bromo, Malang",
                  totalReview: 100,
                  review: 4.8,
                  date: "26 Sept - 29 Sept",
                  description:
                      "Melihat keindahan panorama Gunung Bromo disaat matahari terbit tentu akan membuat liburan anda begitu berkesan dan menyenangkan. Selain itu, anda pula akan diajak untuk mengunjungi Batu Highland, Museum angkut, movie start studio, & batu floating market.",
                  includedAmenities: [
                    "2 Malam akomodasi hotel",
                    "Daily breakfast",
                    "Transportasi, Tour dan makan sesuai program",
                    "Local guide",
                    "Air mineral (1 bottle/pax/day)",
                    "Donasi, Biaya parkir",
                    "Bromo Tours include 4WD Jeep to Mt. Penanjakan & Horseback riding to Mt. Bromo",
                  ],
                  excludedAmenities: [
                    "Tiket pesawat dan airport tax",
                    "Tip untuk guide, sopir, dan porter",
                    "Pengeluaran pribadi",
                    "Asuransi perjalanan",
                    "Biaya atau jasa lainnya yang tidak tercantum diatas",
                    "Weekend Saturday Surcharge at Pohon Inn or Kusuma Agro Wisata Batu Hotel IDR 280.000/room/night",
                  ],
                  itinerary: {
                    "Hari 1":
                        "Jembatan Suramadu • Tugu Pahlawan Surabaya • The House Sampoerna • Monumen Kapal Selam • Mesjid Cheng Ho • Mirota Art Shop • Bromo • Hotel",
                    "Hari 2":
                        "Sunrise Gunung Penanjakan • Naik Kuda Gunung Bromo • Pasir berbisik & padang sabana • Batu Highland • Museum Angkut • Floating Market • Hotel",
                    "Hari 3":
                        "Malang Ijen Boulevard • Toko Oen • Lunch Inggil Malang • Pulang"
                  },
                  termsCondition: [
                    "Berlaku untuk orang Indonesia dan pemegang KIMS / KITAS",
                    "Harga dapat berubah sewaktu-waktu dengan atau tanpa pemberitahuan sebelumnya",
                    "Jeep capacity max 6 pax/jeep, the pony horse ride will be accompanied each by a horse trainer during your journey to Mt Bromo",
                  ],
                  priceBeforeDiscount: 3200102,
                  price: 2524110),
              TripDto(
                  id: uuid.v1(),
                  name: "3D2N Ijen + Green Bay & Red Island",
                  image:
                      "https://www.jabatowisata.com/index/jabato/thumbnails/thumbnail-m-fix-w-870-h-350-mainimageijennew.jpg",
                  location: "Kota Banyuwangi",
                  totalReview: 123,
                  review: 4.9,
                  date: "01 Oct - 03 Oct",
                  description:
                      "Berkunjung ke Kota Banyuwangi akan terasa kurang apabila tidak berkunjung ke Pantai Rajegwesi dan Green Bay, menikmati setiap sudut keindahan pantainya serta airnya yang jernih. Pada liburan kali ini Anda juga akan diajak untuk menyaksikan salah satu fenomena alam yang sangat cantik yaitu Blue Fire serta panorama yang indah di sekitar Kawah Ijen.",
                  includedAmenities: [
                    "2 Malam akomodasi ",
                    "Transportasi, tour dan makan sesuai program",
                    "Driver Guide",
                    "Tiket masuk obyek wisata, parkir, tol",
                    "Air mineral + Snack",
                  ],
                  excludedAmenities: [
                    "Tiket pesawat dan airport tax",
                    "Tip untuk Guide, Sopir dan Porter ( Tipping untuk driver guide IDR 30.000/pax/day )",
                    "Pengeluaran pribadi",
                    "Asuransi perjalanan",
                    "Biaya atau jasa lainnya yang tidak tercantum di atas",
                  ],
                  itinerary: {
                    "Hari 1":
                        "Penjemputan Surabaya • Perjalanan ke Banyuwangi • Check-In Hotel Ketapang Indah",
                    "Hari 2":
                        "Breakfast • Teluk Ijo • Trekking atau Perahu ke Pantai Rajegwesi • GreenBay • Lunch di Pulau Merah • Balik Hotel",
                    "Hari 3":
                        "Pos Paltuding Jam 02.00 • Mendaki ke Kawah Ijen • Melihat Blue Fire • Pulang • Persiapan Balik ke Surabaya"
                  },
                  termsCondition: [
                    "Berlaku untuk orang Indonesia dan pemegang KIMS / KITAS",
                    "Harga dapat berubah sewaktu-waktu dengan atau tanpa pemberitahuan sebelumnya",
                    "Harga anak berlaku untuk anak usia dibawah 12th",
                    "Harga diatas hanya untuk weekday + low season",
                    "Uang muka 50% dari harga tour, akan hangus jika pembatalan dari tamu. Pelunasan 7 hari sebelum keberangkatan",
                    "Weekend / Long weekend surchage (sabtu/minggu) IDR 150.000/pax",
                    "High season surcharge (libur nasional,lebaran,tahun baru) IDR 270.000/pax",
                  ],
                  priceBeforeDiscount: 0.0,
                  price: 4250000),
              TripDto(
                  id: uuid.v1(),
                  name:
                      "4H/3N Favorit Raja Ampat dengan Friwen - Yembesar - Batu Lima - Pulau Wayag & Meos Kon",
                  image:
                      "https://www.jabatowisata.com/index/jabato/thumbnails/thumbnail-m-fix-w-870-h-350-raja-ampat-indonesia-4-cool-wallpaper-hd.jpg",
                  location: "Sorong",
                  totalReview: 10,
                  review: 5.0,
                  date: "02 Jul - 05 Jul",
                  description:
                      "Kepulauan Raja Ampat merupakan fenomena yang benar-benar alami dengan keanekaragaman hayati yang sangat besar. Lanskap laut yang menakjubkan membuat fotografi bawah air harus menjadi prioritas utama Anda selama menginap. Koloni karang yang sangat besar di kawasan tersebut serta suhu permukaan laut yang relatif tinggi.",
                  includedAmenities: [
                    "3 Malam akomodasi Hotel",
                    "Transportasi, Tour, dan Makan sesuai program",
                    "Tour Guide bisa ber-bahasa inggris"
                  ],
                  excludedAmenities: [
                    "Tiket pesawat dan airport tax",
                    "Tip untuk Guide, Sopir dan Porter ( Tipping untuk driver guide IDR 30.000/pax/day )",
                    "Pengeluaran pribadi",
                    "Asuransi perjalanan",
                    "Biaya atau jasa lainnya yang tidak tercantum di atas",
                  ],
                  itinerary: {
                    "Hari 1":
                        "Penjemputan di airport Domine Eduard Osok • Tur singkat di dekat kota • Makan Siang • Perjalanan ke pulau Waisai • Check-In • Makan Malam",
                    "Hari 2":
                        "Makan Pagi • Perjalanan ke pulau Wayag • Berenang dan Menyelam di pulau Wayag • Makan Siang • Trekking ke gunung karts • Menginap di tenda dan makan malam di pulau Wayag",
                    "Hari 3":
                        "Makan Pagi • Perjalanan ke Waisai • Tur di sekitar kota • Berangkat ke Sorong • Check-in Hotel • Makan Malam",
                    "Hari 4":
                        "Makan Pagi • Pengantaran dan adjust pembelian pesawat berdasar tujuan oleh kami • end"
                  },
                  termsCondition: [
                    "Berlaku untuk orang Indonesia dan pemegang KIMS / KITAS",
                    "Harga dapat berubah sewaktu-waktu dengan atau tanpa pemberitahuan sebelumnya",
                    "Harga tambahan senilai IDR 550.000,-/pax untuk selain orang Indonesia",
                    "Aktivitas di atas sangat bergantung pada cuaca, kondisi gelombang, dan kondisi di antara pulau"
                  ],
                  priceBeforeDiscount: 10,
                  price: 8500240),
            ]);
  }
}
