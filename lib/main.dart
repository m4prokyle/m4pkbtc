import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const M4PKBTCApp());
}

// The main application widget.
class M4PKBTCApp extends StatelessWidget {
  const M4PKBTCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M4PKBTC',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0C0C0C),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFACC15), // Bitcoin yellow
          background: Color(0xFF0C0C0C),
          surface: Color(0xFF1F2937),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontFamily: 'Inter'),
          bodyMedium: TextStyle(color: Color(0xFFD1D5DB), fontFamily: 'Inter'),
          headlineLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// The home page with the initial Create and Import buttons.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title with a gradient effect (using ShaderMask)
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Color(0xFFFACC15),
                      Color(0xFFE5A60F),
                    ],
                  ).createShader(bounds);
                },
                child: const Text(
                  'M4PKBTC',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Create a new wallet or import an existing one.',
                style: TextStyle(fontSize: 18, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateWalletPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_circle, color: Colors.black),
                  label: const Text(
                    'Create New Wallet',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFACC15),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImportWalletPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.account_balance_wallet,
                      color: Color(0xFFFACC15)),
                  label: const Text(
                    'Import Existing Wallet',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFFACC15),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: const BorderSide(color: Color(0xFFFACC15), width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for creating a new wallet.
class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({super.key});

  @override
  State<CreateWalletPage> createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage> {
  bool _isLoading = false;

  void _handleCreateWallet() async {
    setState(() {
      _isLoading = true;
    });

    // In a real application, you would generate a new seed phrase and keys here.
    // This is a placeholder for a 12-word seed phrase.
    const List<String> seedPhrase = [
      'dull', 'dusk', 'drama', 'dawn', 'day', 'dream',
      'device', 'drive', 'dust', 'dumb', 'double', 'dragon'
    ];

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SeedPhrasePage(seedPhrase: seedPhrase),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFACC15)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create Wallet',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFACC15)),
              ),
              const SizedBox(height: 16),
              const Text(
                'This is where you would securely generate a new seed phrase and private key for your new Bitcoin wallet.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 24),
              const Icon(Icons.security, size: 80, color: Color(0xFFFACC15)),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _handleCreateWallet,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFACC15),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 2,
                  ),
                )
                    : const Text(
                  'Start Generation',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// A new page to display the generated seed phrase.
class SeedPhrasePage extends StatelessWidget {
  final List<String> seedPhrase;

  const SeedPhrasePage({super.key, required this.seedPhrase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFACC15)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Secret Recovery Phrase',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFACC15)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Write down or store this phrase in a safe place. Do not share it with anyone.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1F2937),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: seedPhrase.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF374151),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}. ${seedPhrase[index]}',
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the verification page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeedPhraseVerificationPage(
                          seedPhrase: seedPhrase,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFACC15),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'I Have Saved My Phrase',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// A new page to verify the seed phrase.
class SeedPhraseVerificationPage extends StatefulWidget {
  final List<String> seedPhrase;

  const SeedPhraseVerificationPage({super.key, required this.seedPhrase});

  @override
  State<SeedPhraseVerificationPage> createState() => _SeedPhraseVerificationPageState();
}

class _SeedPhraseVerificationPageState extends State<SeedPhraseVerificationPage> {
  late List<int> _indicesToVerify;
  final List<TextEditingController> _controllers = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _generateIndices();
  }

  void _generateIndices() {
    final random = Random();
    final indices = <int>[];
    while (indices.length < 3) {
      final index = random.nextInt(widget.seedPhrase.length);
      if (!indices.contains(index)) {
        indices.add(index);
      }
    }
    _indicesToVerify = indices;
    for (var i = 0; i < 3; i++) {
      _controllers.add(TextEditingController());
    }
  }

  void _verifySeedPhrase() async {
    setState(() {
      _isLoading = true;
    });

    bool isValid = true;
    for (int i = 0; i < _indicesToVerify.length; i++) {
      final int index = _indicesToVerify[i];
      final String correctWord = widget.seedPhrase[index];
      final String enteredWord = _controllers[i].text.trim();

      if (enteredWord.toLowerCase() != correctWord.toLowerCase()) {
        isValid = false;
        break;
      }
    }

    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      if (isValid) {
        // Successful verification, navigate to the dashboard
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Verification successful! Wallet created.'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
              (Route<dynamic> route) => false, // Remove all previous routes
        );
      } else {
        // Verification failed, show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Verification failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFACC15)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Verify Recovery Phrase',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFACC15)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Please enter the words from your recovery phrase at the specified positions to confirm you have saved it.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 24),
              // Input fields for the verification words
              ..._indicesToVerify.map((index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: _controllers[_indicesToVerify.indexOf(index)],
                    decoration: InputDecoration(
                      labelText: 'Word #${index + 1}',
                      labelStyle: const TextStyle(color: Color(0xFFFACC15)),
                      filled: true,
                      fillColor: const Color(0xFF1F2937),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                        const BorderSide(color: Color(0xFFFACC15), width: 2),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _verifySeedPhrase,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFACC15),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 2,
                    ),
                  )
                      : const Text(
                    'Verify',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// A simple placeholder for the main wallet dashboard.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet',
            style: TextStyle(color: Color(0xFFFACC15), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, // No back button on the dashboard
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to your wallet!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'This is your main dashboard. Your balances and transaction history would be displayed here.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for importing an existing wallet with a seed phrase.
class ImportWalletPage extends StatefulWidget {
  const ImportWalletPage({super.key});

  @override
  State<ImportWalletPage> createState() => _ImportWalletPageState();
}

class _ImportWalletPageState extends State<ImportWalletPage> {
  final TextEditingController _seedPhraseController = TextEditingController();
  bool _isLoading = false;

  void _handleImportWallet() async {
    setState(() {
      _isLoading = true;
    });

    // Placeholder for importing a wallet.
    // In a real app, you would validate the seed phrase and derive keys here.
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Placeholder: Wallet imported!'),
          backgroundColor: Colors.green,
        ),
      );
      setState(() {
        _isLoading = false;
      });
      // Here you would navigate to the main dashboard of the wallet.
    }
  }

  @override
  void dispose() {
    _seedPhraseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFACC15)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Import Wallet',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFACC15)),
              ),
              const SizedBox(height: 16),
              const Text(
                'Enter your 12 or 24-word seed phrase to import an existing wallet.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _seedPhraseController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter your seed phrase here...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  fillColor: const Color(0xFF1F2937),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading || _seedPhraseController.text.isEmpty
                    ? null
                    : _handleImportWallet,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFACC15),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 2,
                  ),
                )
                    : const Text(
                  'Import Wallet',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}