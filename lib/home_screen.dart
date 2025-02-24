import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:open_filex/open_filex.dart';
import 'dart:typed_data';
import 'package:permission_handler/permission_handler.dart';

class PDFDownloadScreen extends StatefulWidget {
  const PDFDownloadScreen({super.key});

  @override
  State<PDFDownloadScreen> createState() => _PDFDownloadScreenState();
}

class _PDFDownloadScreenState extends State<PDFDownloadScreen> {

  final String companyName = 'Qonto';
  final String pPayment = 'PREUVE DE PAIEMENT';
  final String pPaymentE = 'Proof of payment';
  final String transferDate = 'Le virement suivant a ete execute le 08/01/2025';
  final String transferDateE = 'he following transfer has been completed on 08/01/2025';
  final String emitterName = 'Emetteur';
  final String emiterNameE = '/Emitter\s name';
  final String ets = 'ETS';
  final String emittersAccount = 'Compte de l\'emetteur';
  final String emittersAccountE = '/Emitter\s account';
  final String emittersAccountNumber = 'FR7616958000012389172080819';
  final String emittersBank = 'Banque\'de l\'emetteur';
  final String emitterBankE = '/Emitter\'s bank';
  final String emitterBankName = 'QNTOFRP1XXX';
  final String benefiery = 'Beneficieare';
  final String beneficiaryE = '/Beneficiary\s name';
  final String beneficiaryName = 'Muhammad Najar Hossein';
  final String benAccount = 'Compte du beneficiare';
  final String benAccountE = '/Beneficiary\'s account';
  final String benAccountNumber = 'DE23370501981936451838';
  final String benBank = 'Banque du beneficiare';
  final String benBankE = '/Emitter\'s bank';
  final String benBankName = 'DE23370501981936451838';
  final String montant = 'Montant';
  final String montantE = '/Amount';
  final String amount = '10000.00 EUR';
  final String reference = 'Reference';
  final String referenceE = '/Reference';
  final String referencer = 'Facture';
  final String bottomText = 'QONTO - OLINDA SAS, au capital de 298.160,71 €. SIREN 819 489 626 - 18 rue de Navarin, 75009 Paris';

  Future<void> requestPermissions() async {
    if (Platform.isAndroid) {
      await Permission.storage.request();
    }
  }

  Future<void> generatePDF() async {
    try {
      print("Generating PDF...");

      await requestPermissions();

      final pdf = pw.Document();

      final ByteData bytes = await rootBundle.load('assets/images/images.jpeg');
      final Uint8List imageBytes = bytes.buffer.asUint8List();
      final pw.ImageProvider image = pw.MemoryImage(imageBytes);

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) =>
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 10),
                  pw.Text(companyName, style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 80),
                  pw.Row(
                      children: [
                        pw.Text(pPayment, style: pw.TextStyle(
                            fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(width: 10),
                        pw.Text(pPaymentE, style: pw.TextStyle(
                            fontSize: 18, color: PdfColors.grey, fontStyle: pw.FontStyle.italic)),

                      ]
                  ),
                  pw.SizedBox(height: 30),

                  pw.Text(transferDate, textAlign: pw.TextAlign.start,style: pw.TextStyle(
                      fontSize: 18,)),
                  pw.SizedBox(height: 10),

                  pw.Text(transferDateE, style: pw.TextStyle(
                      fontSize: 18, color: PdfColors.grey, fontStyle: pw.FontStyle.italic)),
                  pw.SizedBox(height: 60),

                  pw.Row(
                      children: [
                        pw.Text(emitterName, style: pw.TextStyle(
                            fontSize: 12)),
                        pw.Text(emiterNameE, style: pw.TextStyle(
                            fontSize: 10, color: PdfColors.grey, fontStyle: pw.FontStyle.italic)),
                        pw.SizedBox(width: 170),
                        pw.Text(ets, style: pw.TextStyle(
                            fontSize: 12)),
                      ]
                  ),
                  pw.SizedBox(height: 20),

                  pw.Row(
                      children: [
                        pw.Text(emittersAccount, style: pw.TextStyle(
                            fontSize: 12)),

                        pw.Text(emittersAccountE, style: pw.TextStyle(
                            fontSize: 10, color: PdfColors.grey, fontStyle: pw.FontStyle.italic)),
                        pw.SizedBox(width: 95),
                        pw.Text(emittersAccountNumber, style: pw.TextStyle(
                            fontSize: 12)),
                      ]
                  ),
                  pw.SizedBox(height: 20),

                  pw.Row(
                      children: [
                        pw.Text(emittersBank, style: pw.TextStyle(
                            fontSize: 12)),

                        pw.Text(emiterNameE, style: pw.TextStyle(
                            fontSize: 10, color: PdfColors.grey, fontStyle: pw.FontStyle.italic)),
                        pw.SizedBox(width: 105),
                        pw.Text(emitterBankName, style: pw.TextStyle(
                            fontSize: 12)),
                      ]
                  ),
                  pw.SizedBox(height: 20),

                  pw.Row(
                      children: [
                        pw.Text(benefiery, style: pw.TextStyle(
                            fontSize: 12)),

                        pw.Text(beneficiaryE, style: pw.TextStyle(
                            fontSize: 10, color: PdfColors.grey, fontStyle: pw.FontStyle.italic)),
                        pw.SizedBox(width: 135),
                        pw.Text(beneficiaryName, style: pw.TextStyle(
                            fontSize: 12)),
                      ]
                  ),
                  pw.SizedBox(height: 20),

                  pw.Row(
                      children: [
                        pw.Text(benAccount, style: pw.TextStyle(
                            fontSize: 12)),

                        pw.Text(benAccountE, style: pw.TextStyle(
                            fontSize: 10, color: PdfColors.grey, fontStyle: pw.FontStyle.italic)),
                        pw.SizedBox(width: 70),
                        pw.Text(benAccountNumber, style: pw.TextStyle(
                            fontSize: 12)),
                      ]
                  ),
                  pw.SizedBox(height: 20),

                  pw.Row(
                      children: [
                        pw.Text(benBank, style: pw.TextStyle(
                            fontSize: 12)),

                        pw.Text(benBankE, style: pw.TextStyle(
                            fontSize: 10, color: PdfColors.grey, fontStyle: pw.FontStyle.italic)),
                        pw.SizedBox(width: 102),
                        pw.Text(benBankName, style: pw.TextStyle(
                            fontSize: 12)),
                      ]
                  ),
                  pw.SizedBox(height: 20),

                  pw.Row(
                      children: [
                        pw.Text(montant, style: pw.TextStyle(
                            fontSize: 12, fontWeight: pw.FontWeight.bold)),

                        pw.Text(montantE, style: pw.TextStyle(
                            fontSize: 10, color: PdfColors.grey, fontStyle: pw.FontStyle.italic)),
                        pw.SizedBox(width: 205),
                        pw.Text(amount, style: pw.TextStyle(
                            fontSize: 12,)),
                      ]
                  ),
                  pw.SizedBox(height: 20),
                  pw.Row(
                      children: [
                        pw.Text(reference, style: pw.TextStyle(
                            fontSize: 12, fontWeight: pw.FontWeight.bold)),

                        pw.Text(referenceE, style: pw.TextStyle(
                            fontSize: 10, color: PdfColors.grey, fontStyle: pw.FontStyle.italic)),
                        pw.SizedBox(width: 185),
                        pw.Text(referencer, style: pw.TextStyle(
                            fontSize: 12,)),
                      ]
                  ),
                  pw.Spacer(),
                  pw.Text(bottomText, textAlign: pw.TextAlign.center)

                ],
              ),
        ),
      );

      print("PDF created successfully!");

      // Get the directory for saving the PDF
      final output = await getApplicationDocumentsDirectory(); // Works for both Android & iOS
      final filePath = "${output.path}/certificate.pdf";
      final file = File(filePath);

      await file.writeAsBytes(await pdf.save());
      print("PDF saved at: $filePath");

      // Open the file automatically
      OpenFilex.open(filePath);
    } catch (e) {
      print("Error generating PDF: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Qonto',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 80,),
              Row(
                children: [
                  Text(
                    'PREUVE DE PAIEMENT',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'PROOF OF PAYMENT',
                    style: TextStyle(fontSize: 13, color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Le virement suivant a ete execute le 08/01/2025',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Text(
                'The following transfer has been completed on 08/01/2025',
                style: TextStyle(color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 60,),

              Row(
                children: [
                  Text(
                    'Emetteur',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '/Emitter\'s name',
                    style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                  Spacer(
                  ),
                  Text(
                    'ETS',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),

              Row(
                children: [
                  Text(
                    'Compte de l\'emetteur',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(width: 8,),
                  Text(
                    '/Emitter\'s account',
                    style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'FR7616958000012389172080819',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Row(
                children: [
                  Text(
                    'Banque\'de l\'emetteur',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '/Emitter\'s bank',
                    style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                  Spacer(),
                  Text(
                    'QNTOFRP1XXX',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15,),

              Row(
                children: [
                  Text(
                    'Beneficieare',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    '/Beneficiary\'s name',
                    style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                  Spacer(),
                  Text(
                    'Muhammad Najar Hossein',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15,),

              Row(
                children: [
                  Text(
                    'Compte du beneficiare',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '/Beneficiary\'s account',
                    style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'DE23370501981936451838',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Row(
                children: [
                  Text(
                    'Banque du beneficiare',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '/Beneficiary\'s bank',
                    style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                  Spacer(),
                  Text(
                    'COLSDE33XXX',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15,),

              Row(
                children: [
                  Text(
                    'Montant',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '/Amount',
                    style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                  Spacer(),
                  Text(
                    '10000.00 EUR',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),

              Row(
                children: [
                  Text(
                    'Reference',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '/Reference',
                    style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                  Spacer(),
                  Text(
                    'Facture',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: generatePDF, child: Text('Download PDF')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
