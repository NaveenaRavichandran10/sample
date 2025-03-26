//
//  PaymentViewController.swift
//  sample
//
//  Created by FCI-MAC on 25/03/25.
//

import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var PaymentmethodLabel: UILabel!
    @IBOutlet weak var VisauncheckButton: UIButton!
    @IBOutlet weak var PhonepeuncheckButton: UIButton!
    @IBOutlet weak var CashondeliveryuncheckButton: UIButton!
    @IBOutlet weak var PaytmuncheckButton: UIButton!
    @IBOutlet weak var PaytmLabel: UILabel!
    @IBOutlet weak var CashondeliveryLabel: UILabel!
    @IBOutlet weak var PhonepeLabel: UILabel!
    @IBOutlet weak var VisaLabel: UILabel!
    @IBOutlet weak var PayButton: UIButton!
    
    var paymentButtons: [UIButton] = []
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Set label texts
           VisaLabel.text = "Visa"
           PhonepeLabel.text = "PhonePe"
           CashondeliveryLabel.text = "Cash on Delivery"
           PaytmLabel.text = "Paytm"
           PaymentmethodLabel.text = "Select Payment Method"
           PayButton.setTitle("Pay", for: .normal)

           // Store buttons in the array
           paymentButtons = [VisauncheckButton, PhonepeuncheckButton, CashondeliveryuncheckButton, PaytmuncheckButton]
           
           // Initialize buttons to unchecked state
           setupButtons()
       }
       
       func setupButtons() {
           // Set all buttons to unchecked initially
           for button in paymentButtons {
               button.setImage(UIImage(systemName: "circle"), for: .normal)
           }
       }
       
       // Visa button action
       @IBAction func visaButtonTapped(_ sender: UIButton) {
           selectPaymentMethod(selectedButton: VisauncheckButton)
       }
       
       // PhonePe button action
       @IBAction func phonepeButtonTapped(_ sender: UIButton) {
           selectPaymentMethod(selectedButton: PhonepeuncheckButton)
       }
       
       // Cash on Delivery button action
       @IBAction func cashOnDeliveryButtonTapped(_ sender: UIButton) {
           selectPaymentMethod(selectedButton: CashondeliveryuncheckButton)
       }
       
       // Paytm button action
       @IBAction func paytmButtonTapped(_ sender: UIButton) {
           selectPaymentMethod(selectedButton: PaytmuncheckButton)
       }
       
       // Function to handle the selection logic
       func selectPaymentMethod(selectedButton: UIButton) {
           for button in paymentButtons {
               // Set the selected button as checked, others as unchecked
               let isSelected = (button == selectedButton)
               button.setImage(UIImage(systemName: isSelected ? "checkmark.circle.fill" : "circle"), for: .normal)
           }
       }
    
   }
