import ScadeKit
//import Android
//import AndroidApp
//import AndroidContent
//import AndroidOS
import Foundation
import PassKit

    
class MainPageAdapter: SCDLatticePageAdapter, PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        //controller.dismiss(animated: true, completion: nil)
        //dismiss(animated: true, completion: nil)
    }
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        completion(PKPaymentAuthorizationResult(status: .success, errors: nil))
        //dismiss(animated: true, completion: nil)
       // displayDefaultAlert(title: "Success!", message: "The Apple Pay transaction was complete.")
    }

    #if os(iOS)
   	weak var rootView:UIView?
    #endif
  // page adapter initialization
  
  func buyShoeTapped() {
         let shoe = Shoe(name: "ShoeName", price: 1)
        let paymentItem = PKPaymentSummaryItem.init(label: shoe.name, amount: NSDecimalNumber(value: shoe.price))
        
        let paymentNetworks = [PKPaymentNetwork.amex, .discover, .masterCard, .visa]
        
        if PKPaymentAuthorizationViewController.canMakePayments(usingNetworks: paymentNetworks) {
            let request = PKPaymentRequest()
                request.currencyCode = "USD" // 1
                request.countryCode = "US" // 2
                request.merchantIdentifier = "merchant.com.vedant.fusionpayments" // 3
                request.merchantCapabilities = PKMerchantCapability.capability3DS // 4
                request.supportedNetworks = paymentNetworks // 5
                request.paymentSummaryItems = [paymentItem] // 6
            
            guard let paymentVC = PKPaymentAuthorizationViewController(paymentRequest: request) else {
             //   displayDefaultAlert(title: "Error", message: "Unable to present Apple Pay authorization.")
                print("unable to present apple pay authorization: error")
                return
            }
            paymentVC.delegate = self
                UIApplication.shared.delegate?.window??.rootViewController?.present(paymentVC, animated: true, completion: nil)
            
        } else {
           // displayDefaultAlert(title: "Error", message: "Unable to make Apple Pay transaction.")
        	print("error: unable to make apple pay transaction")
        }
        
    }

  
  override func load(_ path: String) {
    super.load(path)
    
    
    
    self.pay_btn.onClick{_ in
    	print("pay btn clicked")
    	self.buyShoeTapped()
    	
    }
    
    
    
    
    
    
    
    
    
    
    
    
    self.share_btn.onClick{ _ in
        let text = "This is some text that I want to share."

    	#if os(iOS)
    	
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.rootView 
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        UIApplication.shared.delegate?.window??.rootViewController?.present(activityViewController, animated: true, completion: nil)
        self.label.text = "iOS"
       #endif 
        
        
        #if os(Android)
			print("INtegrating the share text")
			self.label.text = "Android"
			let inte: Intent = Intent()
			let intent: Intent = Intent(action: Intent.ACTION_SEND, uri: URL(""))
			intent.setType(_type: "text/plain")
			intent.putExtra(name: Intent.EXTRA_SUBJECT, value: "The Subject of the Message")
			intent.putExtra(name: Intent.EXTRA_TEXT, value: text)
			inten
			Application.currentActivity?.startActivity(intent: intent)
			
			
        #endif        
    }
    
   }
}

struct Shoe{
	var name: String
	var price: Int
	
}
