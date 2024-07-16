import 'package:flutter/material.dart';

import '../../data/models/api_response.dart';

class NetworkRequestTile extends StatelessWidget {
  const NetworkRequestTile({required this.apiResponse, super.key, this.onTap});

  final ApiResponse apiResponse;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      onTap: onTap,
      leading: Text(
        apiResponse.statusCode.toString(),
        style: textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: apiResponse.statusCode == 200 ? Colors.green : Colors.red,
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            apiResponse.method ?? '',
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              apiResponse.path ?? '',
              style: textTheme.bodyLarge,
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(apiResponse.baseUrl ?? ''),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                apiResponse.requestTime?.toString() ?? '',
                style: textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
              const SizedBox(width: 8),
              Text(
                apiResponse.responseTime!.difference(apiResponse.requestTime!).inMilliseconds.toString() + 'ms',
                style: textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
