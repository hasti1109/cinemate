import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {

  final String statsName;
  final String statsDetails;

  const StatisticsCard({super.key, required this.statsName, required this.statsDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),

      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      width: 165,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          //name of the stats
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                statsName,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
              const SizedBox(height: 5,),
              Divider(
                height: 0.8,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ],
          ),



          //details of the stats
          Center(
            child: Text(
              statsDetails,
              style: const TextStyle(fontSize: 18,),
            ),
          ),
        ],
      ),
    );
  }
}
