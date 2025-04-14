//
//  FoodViewController.swift
//  sample
//
//  Created by FCI-MAC on 23/03/25.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var ThirdLabel: UILabel!
    @IBOutlet weak var FirstLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var DeliveryImageView: UIImageView!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var FoodLabel: UILabel!

    // Arrays for categories
    let spicyFoods = ["Chicken Biryani", "Spicy Chicken Rice", "Mutton Biryani", "Andhra Chicken Curry", "Prawns Masala", "Chicken 65", "Pepper Chicken", "Chettinad Chicken", "Hyderabadi Dum Biryani", "Spicy Paneer Tikka"]
    let spicyPrices: [Double] = [150, 130, 180, 160, 170, 120, 140, 160, 190, 110]

    let sweetFoods = ["Gulab Jamun", "Rasgulla", "Jalebi", "Kaju Katli", "Badam Halwa", "Mysore Pak", "Payasam", "Laddu", "Boondi", "Peda"]
    let sweetPrices: [Double] = [50, 45, 40, 70, 80, 60, 55, 50, 30, 65]

    let chatFoods = ["Pani Puri", "Bhel Puri", "Samosa Chat", "Dahi Puri", "Aloo Tikki", "Papdi Chat", "Sev Puri", "Masala Puri", "Ragda Patties", "Raj Kachori"]
    let chatPrices: [Double] = [30, 35, 40, 38, 42, 34, 32, 36, 50, 45]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI() {
        // Background with a warm gradient style
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 1.0, green: 0.85, blue: 0.70, alpha: 1.0).cgColor,  // soft orange
            UIColor(red: 1.0, green: 0.65, blue: 0.55, alpha: 1.0).cgColor   // coral red
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        // App Title Styling
        FoodLabel.text = "Taste Trove"
        FoodLabel.textAlignment = .center
        FoodLabel.textColor = UIColor(red: 0.45, green: 0.11, blue: 0.02, alpha: 1.0) // Rich brown
        FoodLabel.font = UIFont(name: "Avenir-Heavy", size: 36)

        // Category Label Styling
        let labels = [FirstLabel, SecondLabel, ThirdLabel]
        let categories = ["Spicy", "Sweets", "Chats"]
        for (index, label) in labels.enumerated() {
            label?.text = categories[index]
            label?.isUserInteractionEnabled = true
            label?.textColor = .white
            label?.textAlignment = .center
            label?.font = UIFont.boldSystemFont(ofSize: 18)
            label?.backgroundColor = UIColor(red: 0.86, green: 0.27, blue: 0.27, alpha: 1.0) // warm red
            label?.layer.cornerRadius = 20
            label?.layer.masksToBounds = true
            label?.layer.shadowColor = UIColor.black.cgColor
            label?.layer.shadowOpacity = 0.2
            label?.layer.shadowOffset = CGSize(width: 2, height: 3)
            label?.layer.shadowRadius = 4
        }

        // Add Tap Gestures
        FirstLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(spicyLabelTapped)))
        SecondLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(sweetLabelTapped)))
        ThirdLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(chatsLabelTapped)))

        
    }

    @objc func spicyLabelTapped() {
        animateTap(FirstLabel)
        navigateToDemoVC(with: spicyFoods, prices: spicyPrices)
    }

    @objc func sweetLabelTapped() {
        animateTap(SecondLabel)
        navigateToDemoVC(with: sweetFoods, prices: sweetPrices)
    }

    @objc func chatsLabelTapped() {
        animateTap(ThirdLabel)
        navigateToDemoVC(with: chatFoods, prices: chatPrices)
    }

    func animateTap(_ label: UILabel?) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                           label?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       }) { _ in
            UIView.animate(withDuration: 0.1) {
                label?.transform = CGAffineTransform.identity
            }
        }
    }

    func navigateToDemoVC(with items: [String] , prices: [Double]) {
        if let demoVC = storyboard?.instantiateViewController(withIdentifier: "DemoUIViewController") as? DemoUIViewController {
            demoVC.foodItems = items
            demoVC.foodPrices = prices
            navigationController?.pushViewController(demoVC, animated: true)
        }
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if let menuVC = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController {
            navigationController?.pushViewController(menuVC, animated: true)
        }
    }
}
