import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(
            'assets/images/starcode-logo-removebg-preview.png',
            height: 32,
          ),
        ),
        title: Row(
          children: [
            Spacer(),
            IconButton(
              iconSize: 22,
              icon: Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Voce não tem novas notificações.'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),

            SizedBox(width: 14),
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/starcode-logo-removebg-preview.png',
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      backgroundColor: Color.fromARGB(244, 219, 216, 216),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 16),
            _buildCard(
              title: "Contas a receber",
              amount: "R\$ 5.000,00",
              subtitle: "15% a mais que o mês anterior",
              amountColor: Colors.green,
              subtitleColor: Colors.green[100]!,
            ),
            _buildCard(
              title: "Contas a receber",
              amount: "R\$ 1.200,00",
              subtitle: "15% a mais que o mês anterior",
              amountColor: Colors.red,
              subtitleColor: Colors.red[100]!,
            ),
            _buildCard(
              title: "Recebimentos",
              amount: "R\$ 1.200,00",
              subtitle: "Falta receber R\$ 2.500,00",
              amountColor: Colors.black,
              subtitleColor: Colors.red[100]!,
            ),
            _buildCard(
              title: "Pagamentos",
              amount: "R\$ 1.000,00",
              subtitle: "Falta pagar R\$ 200,00",
              amountColor: Colors.black,
              subtitleColor: Colors.red[100]!,
            ),
            _buildCashFlowChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String amount,
    required String subtitle,
    required Color amountColor,
    required Color subtitleColor,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(Icons.open_in_new, size: 16),
              ],
            ),
            SizedBox(height: 8),
            Text(amount, style: TextStyle(fontSize: 24, color: amountColor)),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: subtitleColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(subtitle, style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCashFlowChart() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fluxo de caixa",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 6000,
                  minY: -3000,
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          const months = [
                            'Jan',
                            'Fev',
                            'Mar',
                            'Abr',
                            'Mai',
                            'Jun',
                            'Jul',
                          ];
                          if (value.toInt() >= 0 &&
                              value.toInt() < months.length) {
                            return Text(months[value.toInt()]);
                          }
                          return Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [BarChartRodData(toY: 0, color: Colors.grey)],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [BarChartRodData(toY: 0, color: Colors.grey)],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [BarChartRodData(toY: 0, color: Colors.grey)],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [BarChartRodData(toY: -2000, color: Colors.red)],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(toY: 5000, color: Colors.green),
                      ],
                    ),
                    BarChartGroupData(
                      x: 5,
                      barRods: [BarChartRodData(toY: 0, color: Colors.grey)],
                    ),
                    BarChartGroupData(
                      x: 6,
                      barRods: [BarChartRodData(toY: 0, color: Colors.grey)],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
