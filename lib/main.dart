import 'package:flutter/material.dart';

void main() {
  runApp(const BitcoinWalletApp());
}

// The main application widget.
class BitcoinWalletApp extends StatelessWidget {
  const BitcoinWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M4PKBTC Wallet',
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

    // Placeholder for creating a new wallet.
    // In a real application, you would generate a new seed phrase and keys here.
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Placeholder: New wallet created!'),
          backgroundColor: Colors.green,
        ),
      );
      setState(() {
        _isLoading = false;
      });
      // Here you would navigate to a screen to show the seed phrase.
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