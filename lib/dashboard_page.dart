import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.star, color: Colors.orange),
            Spacer(),
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/starcode-logo-removebg-preview.png',
              ), // Substitua com imagem real
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DropdownButton<String>(
              value: "Mensal",
              items:
                  ["Mensal", "Semanal", "Anual"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
              onChanged: (_) {},
            ),
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
}
