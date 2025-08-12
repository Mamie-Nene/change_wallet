
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/src/data/local/pdf_api.dart';
import '/src/domain/local/Invoice_Info /Customer.dart';
import '/src/domain/local/Invoice_Info /Invoice.dart';
import '/src/domain/local/Invoice_Info /Supplier.dart';
import '../../widgets/pdf_invoice_widget.dart';
import '/src/utils/consts/app_specifications/allDirectories.dart';

class DetailTransaction extends StatefulWidget {
  const DetailTransaction({Key? key}) : super(key: key);

  @override
  State<DetailTransaction> createState() => _DetailTransactionState();
}

class _DetailTransactionState extends State<DetailTransaction> {

  String refTransaction ="EWALLET567890987654";

  Future<void> _downloadInvoice( BuildContext context) async {
    //Future<void> _downloadInvoice(CurrentUser user,PanierFromGateway resultTransaction, BuildContext context) async {
    final date = DateTime.now();
    // final dueDate = date.add(Duration(days: 7));

    final invoice = Invoice(
      supplier: const Supplier(
        name: 'UCP Gainde2000',
        address: 'Point E, Dakar, Sénégal',
        paymentInfo: 'https://www.orbuspay.com',
      ),
      customer:  const Customer(
        name: "MMBA",
        address: "Adresse non spécifiée",
        //address: user.firstName==""?"Adresse non spécifiée":user.firstName,
      ),
      info: InvoiceInfo(
        date: date,
        description: 'Facture générée après paiement des services du LPG',
        number: 'EWALLET.${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}-${DateTime.now().millisecond}',
        moyenPaiement:"Client encompte",
        //moyenPaiement: resultTransaction.paiementMode!,
      ),
      items: [
        InvoiceItem(
          service: "Orbus Infinity",
          date:DateTime.now(),
          //date:DateTime.parse(resultTransaction.datePaiement!),
          refFacture: "090420240987",
          // refFacture: resultTransaction.referencePanier,
          montant:20000 ,
          // montant:double.parse(resultTransaction.montantFacture) ,
        ),
      ],


    );
    // for generated our invoice(pdf document) we have to put an invoice in our generated methode
    // our invoice will hold all the data of our pdf document
    final pdfFile = await PdfInvoiceWidget.generate(invoice);
    //so the generated pdf file are nedded to be storen inside of our file systems file
    //we need to open our file after it has created
    PdfApi.openFile(pdfFile);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.mainAppColor,// Colors.grey.shade200,
      body: Column(
            children: [
              Padding(
                //padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                padding: const EdgeInsets.fromLTRB(24.0, 50.0, 24.0, 16.0),

                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Détails de la transaction',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _transactionHeader(typeTransaction: true),
                             Divider(),
                              _informationCard(context),
                              _referenceCard(),
                              Divider(),
                              _issueCard(context),
                              _annulationCard(context),
                              _recuCard(context)
                            ],
                          )
                      )
                  )
              ),

            ],
          ),
    );
  }


  Widget _transactionHeader({required bool typeTransaction}) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text("100.000 F CFA",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "Georgia"
                  ),
                ),

                SizedBox(height:  AppDimensions.sizeboxHeight10,),

                const Text("De +221 771234567",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily:  "serif"
                    )
                ),

                SizedBox(height:  AppDimensions.sizeboxHeight5,),

                const Text("Vers +221 771234567",
                    style: TextStyle(
                      height: 1.3,
                      color: Colors.black,
                      fontSize: 13,
                    )),
                const SizedBox(height: 7,),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text("Transfert",style: TextStyle(color: Colors.green,fontSize: 10),),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Row(
              children: [
                Image.asset("asset/images/wave.webp",scale: 9,),
                Icon(Icons.circle),
                Image.asset("asset/images/Yas.png",scale: 9),
              ],
            ),
          ),
        ],
      );
  }

  Widget _informationCard(BuildContext context){
    List<String> nomChamps=["Date et Heure", "Statut","Montant", "Frais","Opérateur emetteur","Opérateur recepteur"];
    List<String> values=["23/04/2024 16:27", "Effectuée","100000","10","Wave","Yas",];


    return Container(
      height: MediaQuery.of(context).size.height/4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: ListView.separated(
                itemCount: nomChamps.length,
                itemBuilder: (BuildContext context, int index){
                  return  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(nomChamps[index],style: TextStyle(color:Colors.black38,fontFamily: "serif",fontSize: 18)) ,//Colors.black38
                      Text(values[index],style: TextStyle(fontFamily: index==3?null:"Gill Sans",color: index==3?Colors.green.shade300:null,fontSize: 16))
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index){return SizedBox(height:  AppDimensions.sizeboxHeight15,);}
            ),
    );
  }

  Widget _referenceCard(){
    return Container(
     decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [//grey
              const Text("Référence Opération",style: TextStyle(color: Colors.black38,fontFamily: "serif",fontSize: 19)) ,

              SizedBox(height:  AppDimensions.sizeboxHeight10,),

              Text(refTransaction,style: TextStyle(fontFamily: "Gill Sans",fontSize: 19,fontWeight: FontWeight.w300))
            ],
          ),

          IconButton(
              onPressed: (){Clipboard.setData(ClipboardData(text:refTransaction ));},
              icon: Icon(Icons.copy,color: AppColors.mainAppColor,))

        ],
      ),
    );
  }

  Widget _annulationCard(t){
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child:
          Row(
            children: [
              Icon(Icons.delete,color: Colors.red) ,
              TextButton(
                  onPressed:(){},
                  child: Text("Annuler la transaction",
                      style: TextStyle(color: Colors.red)
                  )
              ),
        ],
      ),
    );
  }
  Widget _issueCard(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child:
          Row(
            children: [
              Icon(Icons.warning,color: Colors.grey) ,
              TextButton(
                  onPressed:(){},
                  child: Text("Signaler un problème",
                      style: TextStyle(color: Colors.grey)
                  )
              ),
        ],
      ),
    );
  }
  Widget _recuCard(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child:
          Row(
            children: [
              Icon(Icons.download_rounded,color: Colors.green) ,
              TextButton(
                  onPressed:(){_downloadInvoice(context);},
                  child: Text("Téléchargement du reçu",
                      style: TextStyle(color: Colors.green)
                  )
              ),
        ],
      ),
    );
  }

}