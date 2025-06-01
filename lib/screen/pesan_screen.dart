import 'package:flutter/material.dart';
import 'package:whazlansaja/data_saya.dart';

class PesanScreen extends StatefulWidget {
  final Map<String, dynamic> dosen;

  const PesanScreen({
    super.key,
    required this.dosen,
  });

  @override
  State<PesanScreen> createState() => _PesanScreenState();
}

class _PesanScreenState extends State<PesanScreen> {
  late List<dynamic> _historiChat;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inisialisasi dengan data awal dari dosen
    _historiChat = List.from(widget.dosen['histori_chat']);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _kirimPesan() {
    final pesan = _messageController.text.trim();
    if (pesan.isEmpty) return;

    setState(() {
      // Tambahkan pesan baru ke histori
      _historiChat.add({
        'alur': 1, // 1 untuk user/pengirim
        'pesan': pesan,
        'waktu': DateTime.now().toString(),
      });

      // Bersihkan input
      _messageController.clear();
    });

    // Di sini bisa tambahkan logika untuk mengirim ke server/database
    // Contoh:
    // await _kirimKeServer(pesan);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 29,
        elevation: 2,
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: AssetImage(widget.dosen['gambar']),
            radius: 16,
          ),
          title: Text(
            widget.dosen['nama'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            _getLastChatTime(_historiChat),
            style: TextStyle(fontSize: 12),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () => _startVideoCall(context),
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () => _makePhoneCall(context),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'info',
                child: Text('Info Dosen'),
              ),
              const PopupMenuItem(
                value: 'hapus',
                child: Text('Hapus Chat'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _historiChat.isEmpty
                ? _buildEmptyChatState()
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 8),
                    itemCount: _historiChat.length,
                    itemBuilder: (context, index) {
                      final chat = _historiChat[index];
                      final isDosen = chat['alur'] == 0;

                      return _buildChatBubble(
                        message: chat['pesan'],
                        isDosen: isDosen,
                        context: context,
                        avatar:
                            isDosen ? widget.dosen['gambar'] : DataSaya.gambar,
                      );
                    },
                  ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  Widget _buildChatBubble({
    required String message,
    required bool isDosen,
    required BuildContext context,
    required String avatar,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisAlignment:
            isDosen ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isDosen)
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 14,
            ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              decoration: BoxDecoration(
                color: isDosen ? Colors.grey[200] : Colors.blue[100],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: Radius.circular(isDosen ? 0 : 12),
                  bottomRight: Radius.circular(isDosen ? 12 : 0),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: isDosen ? Colors.black87 : Colors.black87,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          if (!isDosen)
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 14,
            ),
        ],
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              minLines: 1,
              maxLines: 3,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: const Icon(Icons.emoji_emotions),
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _kirimPesan,
                ),
                hintText: 'Ketikkan pesan...',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (_) => _kirimPesan(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyChatState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat_bubble_outline, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Belum ada percakapan',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Mulai percakapan dengan ${widget.dosen['nama'].split(',')[0]}',
            style: TextStyle(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  String _getLastChatTime(List<dynamic> chats) {
    if (chats.isEmpty) return "Belum ada chat";
    final lastChat = chats.last;
    final waktu = lastChat['waktu'] != null
        ? DateTime.parse(lastChat['waktu'])
        : DateTime.now();
    return "Hari ini, ${waktu.hour}:${waktu.minute.toString().padLeft(2, '0')}";
  }

  void _startVideoCall(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Memulai video call dengan ${widget.dosen['nama']}')),
    );
  }

  void _makePhoneCall(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Menghubungi ${widget.dosen['nama']}')),
    );
  }
}