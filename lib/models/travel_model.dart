class Travel {
  final String title;
  final String imageAsset;
  final double price;
  final double rating;
  final String description;
  final int pax; 
  final List<String> included; 
  final List<String> excluded; 
  final List<String> terms; 
  final List<Map<String, String>> reviews; // Menggunakan Map untuk menyimpan nama reviewer
  final bool isPrivate; 

  Travel({
    required this.title,
    required this.imageAsset,
    required this.price,
    required this.rating,
    required this.description,
    required this.pax,
    required this.included,
    required this.excluded,
    required this.terms,
    required this.reviews,
    required this.isPrivate, 
  });
}

List<Travel> travelList = [
  Travel(
    title: "Trip to Bali",
    imageAsset: "assets/images/bali.jpeg",
    price: 5000000,
    rating: 4.8,
    pax: 10,
    description: "Nikmati perjalanan eksotis ke Bali. Jelajahi Ubud, Tanah Lot, dan pantai indah seperti Kuta dan Nusa Dua.",
    included: ["Tiket pesawat pulang-pergi", "Hotel bintang 4", "Transportasi lokal", "Tiga kali makan sehari", "Pemandu wisata"],
    excluded: ["Pengeluaran pribadi", "Asuransi perjalanan", "Tip untuk pemandu"],
    terms: ["Minimal 2 peserta", "Pembatalan hingga 7 hari sebelum keberangkatan", "Harga dapat berubah"],
    reviews: [
      {"reviewer": "Budi Santoso", "review": "Perjalanan yang luar biasa! Pemandu wisata sangat ramah."},
      {"reviewer": "Siti Aminah", "review": "Hotel dan makanannya sangat enak!"}
    ],
    isPrivate: false,
  ),
  Travel(
    title: "Trip to Lombok",
    imageAsset: "assets/images/lombok.jpeg",
    price: 4000000,
    rating: 4.6,
    pax: 8,
    description: "Lombok menawarkan keindahan alam yang menakjubkan. Dari Pantai Pink hingga Gili Trawangan, sempurna bagi pecinta snorkeling.",
    included: ["Tiket pesawat pulang-pergi", "Resort di Gili Trawangan", "Sewa perahu ke Gili", "Sarapan & makan malam"],
    excluded: ["Pajak bandara", "Minuman beralkohol", "Biaya aktivitas tambahan"],
    terms: ["Minimal 4 peserta", "Reservasi harus dilakukan 14 hari sebelum keberangkatan"],
    reviews: [
      {"reviewer": "Adi Prasetyo", "review": "Snorkeling di Gili sangat fantastis!"},
      {"reviewer": "Dewi Kusuma", "review": "Pantai Pink sangat indah, benar-benar sepadan!"}
    ],
    isPrivate: true,
  ),
  Travel(
    title: "Trip to Yogyakarta",
    imageAsset: "assets/images/yogyakarta.jpeg",
    price: 3500000,
    rating: 4.7,
    pax: 15,
    description: "Jelajahi warisan budaya Yogyakarta, termasuk Borobudur, Prambanan, dan Jalan Malioboro.",
    included: ["Tiket kereta", "Hotel bintang 3", "Pemandu lokal", "Sarapan harian", "Tiket masuk objek wisata"],
    excluded: ["Belanja pribadi", "Makan siang & makan malam", "Tur tambahan"],
    terms: ["Minimal 3 peserta", "Kebijakan pembatalan fleksibel"],
    reviews: [
      {"reviewer": "Rizky Wijaya", "review": "Borobudur sangat menakjubkan!"},
      {"reviewer": "Hendra Saputra", "review": "Suka dengan makanan tradisional dan budayanya."}
    ],
    isPrivate: false,
  ),
  Travel(
    title: "Trip to Raja Ampat",
    imageAsset: "assets/images/raja_ampat.jpeg",
    price: 10000000,
    rating: 4.9,
    pax: 6,
    description: "Nikmati surga Raja Ampat dengan airnya yang jernih, kehidupan laut yang beragam, dan pulau-pulau tersembunyi.",
    included: ["Tiket pesawat", "Resort mewah", "Tur perahu pribadi", "Peralatan menyelam", "Pemandu profesional"],
    excluded: ["Pengeluaran pribadi", "Minuman beralkohol", "Asuransi kesehatan"],
    terms: ["Minimal 2 peserta", "Pemesanan diperlukan 30 hari sebelumnya"],
    reviews: [
      {"reviewer": "Bayu Nugroho", "review": "Pengalaman menyelam yang tak terlupakan!"},
      {"reviewer": "Indah Sari", "review": "Pulau-pulaunya sangat indah!"}
    ],
    isPrivate: true,
  ),
  Travel(
    title: "Trip to Labuan Bajo",
    imageAsset: "assets/images/labuan_bajo.jpeg",
    price: 3000000,
    rating: 4.7,
    pax: 10,
    description: "Jelajahi keindahan alam Labuan Bajo, termasuk Taman Nasional Komodo dan pulau-pulau eksotisnya.",
    included: ["Tur perahu", "Penginapan hotel", "Sarapan & makan malam", "Peralatan snorkeling", "Pemandu wisata"],
    excluded: ["Pengeluaran pribadi", "Minuman beralkohol", "Tiket masuk taman nasional"],
    terms: ["Minimal 4 peserta", "Pemesanan diperlukan 10 hari sebelumnya"],
    reviews: [
      {"reviewer": "Dian Purnama", "review": "Komodo sangat menakjubkan untuk dilihat!"},
      {"reviewer": "Rina Susanti", "review": "Suka dengan air laut yang jernih dan pulau hopping!"}
    ],
    isPrivate: false,
  ),
];
