import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PlantMonitoringPage extends StatefulWidget {
  final DocumentSnapshot plantDoc;

  const PlantMonitoringPage({super.key, required this.plantDoc});

  @override
  _PlantMonitoringPageState createState() => _PlantMonitoringPageState();
}

class _PlantMonitoringPageState extends State<PlantMonitoringPage> {
  final TextEditingController _heightController = TextEditingController();
  bool _watered = false;
  String _selectedInterval = 'Daily';
  final List<bool> _wateredDays = List<bool>.filled(7, false);
  final List<String> _dates = List.generate(7, (index) {
    DateTime date = DateTime.now().add(Duration(days: index));
    return DateFormat('MM/dd').format(date);
  });

  Future<void> _addCheckIn() async {
    await FirebaseFirestore.instance
        .collection('plants')
        .doc(widget.plantDoc.id)
        .collection('check_ins')
        .add({
      'date': Timestamp.now(),
      'watered': _watered,
      'height': _heightController.text.isNotEmpty
          ? double.parse(_heightController.text)
          : null,
    });
    _heightController.clear();
    setState(() {
      _watered = false;
      // Update the watered days list
      for (int i = 0; i < _wateredDays.length; i++) {
        _wateredDays[i] = false;
      }
      _wateredDays[0] = true; // Set today as watered
    });
  }

  List<FlSpot> _createSpots(List<QueryDocumentSnapshot> docs) {
    List<FlSpot> spots = [];
    for (var i = 0; i < docs.length; i++) {
      var height = docs[i]['height'];
      if (height != null) {
        spots.add(FlSpot(i.toDouble(), height.toDouble()));
      }
    }
    return spots;
  }

  List<QueryDocumentSnapshot> _filterDocsByInterval(
      List<QueryDocumentSnapshot> docs, String interval) {
    if (interval == 'Weekly') {
      return docs.where((doc) {
        DateTime date = (doc['date'] as Timestamp).toDate();
        return date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
      }).toList();
    } else if (interval == 'Monthly') {
      return docs.where((doc) {
        DateTime date = (doc['date'] as Timestamp).toDate();
        return date.isAfter(DateTime.now().subtract(const Duration(days: 30)));
      }).toList();
    }
    return docs;
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Perkembangan Tanaman", style: TextStyle(fontSize: 20)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 5.0, top: 5.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _heightController,
                decoration: const InputDecoration(
                  labelText: "Masukan Tinggi Tanaman Hari Ini",
                ),
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 7; i++)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9),
                          child: Icon(
                            Icons.water_drop,
                            color: _wateredDays[i] ? Colors.blue : Colors.grey,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9),
                          child: Text(
                            _dates[i],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: _addCheckIn,
                  child: Text(
                    "Check-In",
                    style: GoogleFonts.poppins().copyWith(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              const Text("Pertumbuhan Tanaman",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                style: GoogleFonts.poppins().copyWith(
                  color: Colors.green,
                ),
                value: _selectedInterval,
                items: <String>['Daily', 'Weekly', 'Monthly']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedInterval = newValue!;
                  });
                },
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('plants')
                      .doc(widget.plantDoc.id)
                      .collection('check_ins')
                      .orderBy('date')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    var docs = snapshot.data!.docs;
                    if (docs.isEmpty) {
                      return const Center(child: Text("No data available"));
                    }
                    var filteredDocs =
                        _filterDocsByInterval(docs, _selectedInterval);

                    List<FlSpot> spots = _createSpots(filteredDocs);
                    List<String> dates = filteredDocs.map((doc) {
                      DateTime date = (doc['date'] as Timestamp).toDate();
                      return "${date.month}/${date.day}";
                    }).toList();

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              spots: spots,
                              isCurved: true,
                              barWidth: 4,
                              belowBarData: BarAreaData(show: false),
                              color: Colors.green,
                            ),
                          ],
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return SideTitleWidget(
                                    axisSide: meta.axisSide,
                                    child: Text(
                                        dates[value.toInt() % dates.length]),
                                  );
                                },
                              ),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          gridData: const FlGridData(
                            show: true,
                            drawHorizontalLine: true,
                            drawVerticalLine: true,
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: const Border(
                              left: BorderSide(color: Colors.black),
                              bottom: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
