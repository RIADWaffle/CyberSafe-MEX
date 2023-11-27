import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardWidget extends StatelessWidget {
  final String author;
  final String title;
  final String description;
  final String imageUrl;
  final String url;

  const CardWidget({
    Key? key,
    required this.author,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  }) : super(key: key);

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: _launchURL,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Author: $author',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '$url',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
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
