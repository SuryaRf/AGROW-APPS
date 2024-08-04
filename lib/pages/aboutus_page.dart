import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Kami'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tentang Agrow",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              "Agrow adalah aplikasi yang mendukung sistem perkebunan berkelanjutan. Aplikasi ini menyediakan fitur-fitur penting seperti tracking pertumbuhan tanaman, konsultasi chatbot berbasis artificial intelligence, dan pendeteksi penyakit pada tanaman berbasis machine learning.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text(
              "Mengurangi Limbah, Menghasilkan Manfaat",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              "Agrow mendukung penggunaan pupuk organik cair yang terbuat dari limbah kulit buah. Kami saat ini sedang berusaha untuk mendistribusikan dan mengembangkan penggunaan limbah kulit buah nanas yang dapat diubah menjadi pupuk organik cair. Tidak hanya itu, kami juga akan berusaha mendistribusikan penggunaan limbah lain sebagai bahan pembuatan pupuk organik. Tujuan kami adalah mengurangi jumlah limbah di Indonesia dan mengubahnya menjadi barang yang berguna.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text(
              "Visi dan Misi",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              "Visi kami adalah menciptakan lingkungan di Indonesia menjadi lebih hijau dan berkelanjutan melalui teknologi dan inovasi. Misi kami adalah menyediakan solusi yang efektif dan efisien bagi para petani dan pecinta tanaman dalam mengelola perkebunan mereka secara berkelanjutan. Serta turut serta dalam pengurangan limbah di Indonesia",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
