import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Getting data from API",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
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