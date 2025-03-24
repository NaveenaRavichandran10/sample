//
//  MenuViewController.swift
//  sample
//
//  Created by FCI-MAC on 23/03/25.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var FoodnameTextField: UITextField!
    @IBOutlet weak var OrderButton: UIButton!
    @IBOutlet weak var OfferLabel: UILabel!
    
    @IBOutlet weak var DataLabel: UILabel!
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var QuantityTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        


        // Do any additional setup after loading the view.
    }
    func setupUI(){
    

        view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1.0) // Light grayish-blue
            
          // Text Fields
          FoodnameTextField.placeholder = "Enter Food Name"
          FoodnameTextField.borderStyle = .roundedRect
          FoodnameTextField.font = UIFont.systemFont(ofSize: 18)
          
          QuantityTextField.placeholder = "Enter Quantity"
          QuantityTextField.borderStyle = .roundedRect
          QuantityTextField.font = UIFont.systemFont(ofSize: 18)

          //  Label
          DataLabel.text = "Food and Quantity will appear here"
          DataLabel.textColor = .darkGray
          DataLabel.textAlignment = .center
          DataLabel.font = UIFont.systemFont(ofSize: 16)
        
        //offer
       // OfferLabel.text = "Offer will appear here"
        //OfferLabel.textColor = .blue
        //OfferLabel.textAlignment = .center
       // OfferLabel.font = UIFont.systemFont(ofSize: 16)

          // Done Button
          DoneButton.setTitle("Done", for: .normal)
          DoneButton.setTitleColor(.white, for: .normal)
          DoneButton.backgroundColor = .systemGreen
          DoneButton.layer.cornerRadius = 10
        
          //  Order Button
          OrderButton.setTitle("Order", for: .normal)
          OrderButton.setTitleColor(.white, for: .normal)
          OrderButton.backgroundColor = .systemBlue
          OrderButton.layer.cornerRadius = 10
         
      }
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        // Get the text from the text fields
        let foodName = FoodnameTextField.text ?? ""
        let quantityText = QuantityTextField.text ?? ""

        // Validate and display the data
        if let quantity = Int(quantityText.trimmingCharacters(in: .whitespacesAndNewlines)), !foodName.isEmpty {
               
               // Display Food and Quantity
               DataLabel.text = "Food: \(foodName), Quantity: \(quantity)"
               DataLabel.textColor = .black
               
               // Offer logic
               if quantity >= 2 && quantity <= 5 {
                   OfferLabel.text = "20% offer"
                   OfferLabel.textColor = .systemGreen
               } else if quantity >= 6 && quantity <= 10 {
                   OfferLabel.text = "50% offer"
                   OfferLabel.textColor = .systemOrange
               } else if quantity > 10 {
                   OfferLabel.text = "70% offer"
                   OfferLabel.textColor = .systemRed
               } //else {
                  // OfferLabel.text = "No offer available"
                   //OfferLabel.textColor = .darkGray
               
               
           } else {
               // Handle invalid or empty quantity
               DataLabel.text = "Please enter a valid food name and quantity"
               DataLabel.textColor = .red
               OfferLabel.text = ""
           }
       }

    }

    
    


