import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  void _launchPhone(String phoneNumber) async {
    final Uri url = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'hmseggdistrubutors87@gmail.com',
      query: 'subject=Hello&body=I would like to get in touch with you',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication, // 👈 THIS IS CRUCIAL
      );
    } else {
      debugPrint('❌ Could not launch email client');
    }
  }

  void _launchEmailViaWeb() async {
    final Uri gmailWeb = Uri.parse(
      'https://mail.google.com/mail/?view=cm&fs=1&to=hmseggdistrubutors87@gmail.com&su=Hello&body=I%20would%20like%20to%20get%20in%20touch%20with%20you',
    );

    if (await canLaunchUrl(gmailWeb)) {
      await launchUrl(
        gmailWeb,
        mode: LaunchMode.externalApplication,
      );
    } else {
      debugPrint('❌ Could not launch Gmail web compose');
    }
  }

  Widget buildCard(String title, Map<String, String> contacts) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.location_on),
                    onPressed: () {
                      launch(
                          'https://www.google.com/maps/place/H.M.S+EGG+DISTRIBUTOR/@12.9481843,77.5260843,17z/data=!3m1!4b1!4m6!3m5!1s0x3bae3fa22ac2c4ff:0xc0aede0efacbcb29!8m2!3d12.9481843!4d77.5260843!16s%2Fg%2F11rq14tkdk?entry=ttu&g_ep=EgoyMDI1MDQwNi4wIKXMDSoASAFQAw%3D%3D');
                    },
                  )
                ],
              ),
              const Text("Contact Numbers",
                  style: TextStyle(fontWeight: FontWeight.w500)),
              ...contacts.entries.map((entry) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.key,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0))),
                      IconButton(
                        icon: const Icon(Icons.phone),
                        onPressed: () => _launchPhone(entry.value),
                      )
                    ],
                  )),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: _launchEmailViaWeb,
                icon: const Icon(Icons.email),
                label: const Text("Email Us"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      child: Container(
                          color: const Color.fromARGB(255, 2, 70, 126)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.white),
                  ),
                ],
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Column(
                    children: [
                      const Text(
                        "Contact Us.",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: const Text("Branch 1",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                            ),
                            buildCard("Bengaluru", {
                              "Noor Ahmed": "9900956387",
                              "Tanveer Pasha": "8892650006",
                              "Sagheer Ahmed": "8867786887",
                            }),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: const Text("Branch 2",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ),
                            buildCard("Kolar", {
                              "Noor Ahmed": "9900956387",
                              "Tanveer Pasha": "8892650006",
                              "Sagheer Ahmed": "8867786887",
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
