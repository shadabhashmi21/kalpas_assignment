import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, this.loadingMessage}) : super(key: key);

  final String? loadingMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            loadingMessage ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ],
      ),
    );
  }
}

class Error extends StatelessWidget {
  final String error;

  final VoidCallback onRetryPressed;

  const Error({Key? key, required this.error, required this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 6),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
            ),
            child: const Text("Retry", style: TextStyle(color: Colors.black)),
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String? title;
  final String? summary;
  final String? published;
  final bool isLiked;
  final Function(bool) onLiked;

  const NewsCard(
      {Key? key,
      this.title,
      this.summary,
      this.published,
      required this.isLiked,
      required this.onLiked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              LikeButton(
                size: 50,
                isLiked: isLiked,
                onTap: (value) async => onLiked(!value),
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title ?? "",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(summary ?? "",
                          style: const TextStyle(color: Colors.black54)),
                    ),
                    Text(published ?? "",
                        style: const TextStyle(color: Colors.black38)),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
