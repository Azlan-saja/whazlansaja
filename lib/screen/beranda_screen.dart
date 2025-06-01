import 'package:flutter/material.dart';
import 'package:whazlansaja/screen/pesan_screen.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  // Data dosen dari JSON
  final List<Map<String, dynamic>> dosenList = const [
    {
      "id": 1,
      "nama": "Azlan, S.Kom., M.Kom.",
      "gambar": "assets/gambar_dosen/Azlan, S.Kom., M.Kom.jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Selamat pagi, ada yang bisa saya bantu?"},
        {
          "alur": 1,
          "pesan": "Selamat pagi pak, saya ingin bertanya soal tugas."
        },
        {"alur": 1, "pesan": "Apakah tugasnya dikumpulkan besok?"},
        {"alur": 0, "pesan": "Tidak nak, batas akhir adalah lusa."}
      ]
    },
    {
      "id": 2,
      "nama": "Badrul Anwar, S.E., S.Kom., M.Kom.",
      "gambar": "assets/gambar_dosen/Badrul Anwar, S.E., S.Kom., M.Kom..jpg",
      "histori_chat": []
    },
    {
      "id": 3,
      "nama": "Dr. Dicky Nofriansyah, S.Kom., M.Kom.",
      "gambar": "assets/gambar_dosen/Dr. Dicky Nofriansyah, S.Kom., M.Kom..jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Sudah dapat kelompoknya?"},
        {"alur": 1, "pesan": "Sudah pak, kami satu kelompok dengan Rini."}
      ]
    },
    {
      "id": 4,
      "nama": "Dr. Rudi Gunawan, S.E., M.Si.",
      "gambar": "assets/gambar_dosen/Dr. Rudi Gunawan, S.E., M.Si..jpg",
      "histori_chat": [
        {
          "alur": 1,
          "pesan":
              "Pagi pak, sudah saya siapkan apa yang kita diskusi kemaren pak."
        },
        {"alur": 0, "pesan": "Oke. Besok langsung presentasi ya."},
        {"alur": 1, "pesan": "iya pak."}
      ]
    },
    {
      "id": 5,
      "nama": "Dra. Sri Kusnasari, M.Hum.",
      "gambar": "assets/gambar_dosen/Dra. Sri Kusnasari, M.Hum.jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Materi minggu ini sudah saya upload."},
        {"alur": 1, "pesan": "Baik bu, terima kasih informasinya."}
      ]
    },
    {
      "id": 6,
      "nama": "Drs. Sobirin, S.H., M.Si.",
      "gambar": "assets/gambar_dosen/Drs. Sobirin, S.H., M.Si..jpg",
      "histori_chat": []
    },
    {
      "id": 7,
      "nama": "Hendra Jaya, S.Kom., M.Kom.",
      "gambar": "assets/gambar_dosen/Hendra Jaya, S.Kom., M.Kom..jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Apakah sudah install Flutter?"},
        {"alur": 1, "pesan": "Sudah pak, sedang coba-coba sekarang."}
      ]
    },
    {
      "id": 8,
      "nama": "Hendryan Winata, S.Kom., M.Kom.",
      "gambar": "assets/gambar_dosen/Hendryan Winata, S.Kom., M.Kom.jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Tugas desain UI dikumpulkan minggu ini."},
        {"alur": 1, "pesan": "Oke pak, kami sedang proses."}
      ]
    },
    {
      "id": 9,
      "nama": "Iskandar Zulkarnain, S.T., M.Kom.",
      "gambar": "assets/gambar_dosen/Iskandar Zulkarnain, S.T., M.Kom..jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Bagaimana hasil praktikum kemarin?"},
        {"alur": 1, "pesan": "Berhasil pak, semua fitur jalan."}
      ]
    },
    {
      "id": 10,
      "nama": "Ismawardi Santoso, S.Pd., MS.",
      "gambar": "assets/gambar_dosen/Ismawardi Santoso, S.Pd., MS.jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Silakan buka referensi dari e-book."},
        {"alur": 1, "pesan": "Baik pak, akan saya baca malam ini."}
      ]
    },
    {
      "id": 11,
      "nama": "Muhammad Dahria, S.Kom., M.Kom.",
      "gambar": "assets/gambar_dosen/Muhammad Dahria, S.E., S.Kom., M.Kom..jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Ada pertanyaan soal project final?"},
        {"alur": 1, "pesan": "Iya pak, boleh saya konsultasi besok?"}
      ]
    },
    {
      "id": 12,
      "nama": "Muhammad Syahril, S.Kom., M.Kom.",
      "gambar": "assets/gambar_dosen/Muhammad Syahril, SE., M.Kom..jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Jangan lupa baca modul 4."},
        {"alur": 1, "pesan": "Oke pak, terima kasih."}
      ]
    },
    {
      "id": 13,
      "nama": "Mukhlis Ramadhan, S.Kom.",
      "gambar": "assets/gambar_dosen/Mukhlis Ramadhan, S.E., M.Kom..jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Sudah coba fitur Livewire?"},
        {"alur": 1, "pesan": "Baru mulai pak, lumayan seru."}
      ]
    },
    {
      "id": 14,
      "nama": "Rini Kustini, S.S., MS.",
      "gambar": "assets/gambar_dosen/Rini Kustini, S.S., MS..jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Bacaan minggu depan sudah saya kirim."},
        {"alur": 1, "pesan": "Terima kasih bu, sudah saya terima."}
      ]
    },
    {
      "id": 15,
      "nama": "Saiful Nur Arif, S.E., S.Kom., M.Kom.",
      "gambar": "assets/gambar_dosen/Saiful Nur Arif, S.E., S.Kom., M.Kom..jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Kapan bisa diskusi tugas akhir?"},
        {"alur": 1, "pesan": "Saya siap hari Kamis pak."}
      ]
    },
    {
      "id": 16,
      "nama": "Zulkifli Lubis, S.E., MM.",
      "gambar": "assets/gambar_dosen/Zulkifli Lubis, S.E., MM..jpg",
      "histori_chat": [
        {"alur": 0, "pesan": "Sudah isi kuis kehadiran?"},
        {"alur": 1, "pesan": "Sudah pak, barusan saya submit."}
      ]
    }
    // Data lainnya...
    // (Saya singkatkan di sini, tapi Anda bisa copy semua data JSON Anda ke sini)
  ];

  // Fungsi untuk mendapatkan pesan terakhir
  String _getLastMessage(List<dynamic> historichat) {
    if (historichat.isEmpty) return "Belum ada chat";
    final lastMsg = historichat.last["pesan"] as String;
    return lastMsg.length > 30 ? "${lastMsg.substring(0, 30)}..." : lastMsg;
  }

  String _getLastTime(List<dynamic> historichat) {
    if (historichat.isEmpty) return "";
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          'WhAzlansaja',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_enhance)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 12, right: 12),
            child: SearchAnchor.bar(
              barElevation: const WidgetStatePropertyAll(2),
              barHintText: 'Cari dosen dan mulai chat',
              suggestionsBuilder: (context, controller) {
                return List.generate(dosenList.length, (index) {
                  final dosen = dosenList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(dosen['gambar']),
                    ),
                    title: Text(dosen['nama'].split(',')[0]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PesanScreen(dosen: dosen),
                        ),
                      );
                    },
                  );
                });
              },
            ),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: dosenList.length,
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemBuilder: (context, index) {
          final dosen = dosenList[index];
          final historichat = dosen["histori_chat"] as List<dynamic>;
          final hasUnread = historichat.isNotEmpty;

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PesanScreen(dosen: dosen),
                  settings: RouteSettings(
                    arguments: dosen, // Pass data as route arguments
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(dosen['gambar']),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dosen['nama'].split(',')[0],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _getLastMessage(historichat),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _getLastTime(historichat),
                        style: TextStyle(
                          color: hasUnread ? Colors.green : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      if (hasUnread)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        child: const Icon(Icons.add_comment),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.sync),
            label: 'Pembaruan',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups),
            label: 'Komunitas',
          ),
          NavigationDestination(
            icon: Icon(Icons.call),
            label: 'Panggilan',
          ),
        ],
      ),
    );
  }
}