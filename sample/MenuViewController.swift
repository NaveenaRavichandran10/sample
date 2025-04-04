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
    @IBOutlet weak var QuantitySlider: UISlider!
    @IBOutlet weak var QuantityLabel: UILabel!
    @IBOutlet weak var DataLabel: UILabel!
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var costLabel: UILabel!
    
    var selectedFoodName: String?
    var selectedPrice: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        view.backgroundColor = UIColor(red: 0.93, green: 0.90, blue: 0.98, alpha: 1.0)

        QuantitySlider.value = 1
        QuantityLabel.text = "Quantity: \(Int(QuantitySlider.value))"

        QuantitySlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }

    func setupUI() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1.0)

        FoodnameTextField.borderStyle = .roundedRect
        FoodnameTextField.font = UIFont.systemFont(ofSize: 18)
        
        if let name = selectedFoodName, let price = selectedPrice {
            FoodnameTextField.text = "\(name) - ₹\(String(format: "%.2f", price))"
        }
        DataLabel.text = " "
        DataLabel.textColor = .darkGray
        DataLabel.textAlignment = .center
        DataLabel.font = UIFont.systemFont(ofSize: 16)

        DoneButton.setTitle("Done", for: .normal)
        DoneButton.setTitleColor(.white, for: .normal)
        DoneButton.backgroundColor = .systemGreen
        DoneButton.layer.cornerRadius = 10

        OrderButton.setTitle("Order", for: .normal)
        OrderButton.setTitleColor(.white, for: .normal)
        OrderButton.backgroundColor = .systemBlue
        OrderButton.layer.cornerRadius = 10
    }

    @objc func sliderValueChanged(_ sender: UISlider) {
        let quantity = Int(sender.value)
        QuantityLabel.text = "Quantity: \(quantity)"

        if let name = selectedFoodName {
            DataLabel.text = "Food: \(name), Quantity: \(quantity)"
            DataLabel.textColor = .black
        }
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        let quantity = Int(QuantitySlider.value)

        guard let name = selectedFoodName, let price = selectedPrice else {
            DataLabel.text = "Please select a valid food item"
            DataLabel.textColor = .red
            OfferLabel.text = ""
            costLabel.text = ""
            return
        }

        // Calculate subtotal and apply discount
        let subtotal = price * Double(quantity)
        var discount: Double = 0.0

        if quantity >= 2 && quantity <= 5 {
            discount = 0.20
            OfferLabel.text = "20% offer"
            OfferLabel.textColor = .systemGreen
        } else if quantity >= 6 && quantity <= 10 {
            discount = 0.50
            OfferLabel.text = "50% offer"
            OfferLabel.textColor = .systemOrange
        } else if quantity > 10 {
            discount = 0.70
            OfferLabel.text = "70% offer"
            OfferLabel.textColor = .systemRed
        } else {
            OfferLabel.text = "No offer available"
            OfferLabel.textColor = .darkGray
        }

        let discountAmount = subtotal * discount
        let finalTotal = subtotal - discountAmount

        // Show item and quantity in DataLabel
        DataLabel.text = "Food: \(name), Quantity: \(quantity)"
        DataLabel.textColor = .black

        // Show discounted price in costLabel
        costLabel.text = "Total: ₹\(String(format: "%.2f", finalTotal))"
        costLabel.textColor = .purple
    }


    @IBAction func OrderButtonTapped(_ sender: UIButton) {
        if let paymentVC = storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as? PaymentViewController {
            navigationController?.pushViewController(paymentVC, animated: true)
        }
    }
}
