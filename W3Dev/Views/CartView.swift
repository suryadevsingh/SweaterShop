//
//  CartView.swift
//  W3Dev
//
//  Created by Suryadev Singh on 16/07/23.
//

import SwiftUI
import Razorpay


var razorPay : RazorpayCheckout!
struct CartView: View {
    
//    let razorPayKey = "rzp_test_kNrNoxB4kimbAT"
//    var razorPay : RazorpayCheckout? = nil
    
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ScrollView {
            
            if cartManager.products.count > 0 {
                
                ForEach(cartManager.products, id: \.id){
                    product in ProductRow(product: product)
                }
                
                HStack {
                    Text("Your cart total is")
                    Spacer()
                    Text("$\(cartManager.total).00").bold()
                }.padding()
                
                Button {
//                    openRazorPayCheckOut()
                } label: {
                    Text("Pay Now")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent).tint(.black).padding()

            } else {
                Text("Your cart is empty")
             
            }
            
        }.navigationTitle(Text("My cart")).padding(.top)
    }
    
    
    
//    func openRazorPayCheckOut(){
//        razorPay = RazorpayCheckout.initWithKey("rzp_test_kNrNoxB4kimbAT", andDelegate: self)
//        let options: [String:Any] = [
//                    "amount": "100", //This is in currency subunits. 100 = 100 paise= INR 1.
//                    "currency": "INR",//We support more that 92 international currencies.
//                    "description": "purchase description",
//                    "order_id": "order_DBJOWzybf0sJbb",
//                    "image":"https://media.licdn.com/dms/image/C510BAQHZtsS6CLQRNA/company-logo_200_200/0/1536018902585?e=2147483647&v=beta&t=VFpWh5wtEAL-HUUSFP3-xcfZHfkJJ2wao0YzU_7i0dU",
//                    "name": "W3Dev",
//                    "prefill": [
//                        "contact": "9797979797",
//                        "email": "foo@bar.com"
//                    ],
//                    "theme": [
//                        "color": "#F37254"
//                    ]
//                ]
//        razorPay?.open(options)
//    }

  
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(CartManager())
    }
}




extension CartView {
    
    func presentAlert(withTitle: String,message: String){
        let alert = UIAlertController(title: withTitle, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel,handler: {
            ok in
        }))
//        present(alert,animated:true,completion:nil)
    }
    
    func onPaymentError(_ code: Int32, description str: String, andData response: [AnyHashable : Any]?) {
        print("error: ", code)
        self.presentAlert(withTitle: "Alert", message: str)
    }

    func onPaymentSuccess(_ payment_id: String, andData response: [AnyHashable : Any]?) {
        print("success: ", payment_id)
        self.presentAlert(withTitle: "Success", message: "Payment Succeeded")
    }
    
}

//extension CartView: RazorpayPaymentCompletionProtocolWithData {
//
//    func onPaymentError(_ code: Int32, description str: String, andData response: [AnyHashable : Any]?) {
//        print("error: ", code)
//        self.presentAlert(withTitle: "Alert", message: str)
//    }
//
//    func onPaymentSuccess(_ payment_id: String, andData response: [AnyHashable : Any]?) {
//        print("success: ", payment_id)
//        self.presentAlert(withTitle: "Success", message: "Payment Succeeded")
//    }
//}

//extension CartView : RazorpayPaymentCompletionProtocol {
//
//    func onPaymentError(_ code: Int32, description str: String) {
//        print("error: ", code, str)
//        self.presentAlert(withTitle: "Alert", message: str)
//    }
//
//    func onPaymentSuccess(_ payment_id: String) {
//        print("success: ", payment_id)
//        self.presentAlert(withTitle: "Success", message: "Payment Succeeded")
//    }
//
//    func presentAlert(withTitle title: String?, message: String?){
//        DispatchQueue.main.async {
//            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            let OkAction = UIAlertAction(title: "Okay", style: .default)
//            alertController.addAction(OkAction)
////            self.present(alertController, animated: true, completion: nil)
//        }
//    }
//
//}
