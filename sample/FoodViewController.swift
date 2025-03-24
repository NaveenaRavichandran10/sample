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
    @IBOutlet weak var SearchTextField: UITextField!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var FoodLabel: UILabel!
    let foodOptions: [String: [String]] = [
            "Spicy": ["Less Spicy", "Moderate", "More Spicy"],
            "Sweets": ["Less Sweet", "Moderate Sweet", "Extra Sweet"],
            "Chats": ["Mild", "Medium", "Spicy"]
        ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1.0) // Light grayish-blue
        
        let labelArray = ["Spicy", "Sweets", "Chats"]
        
        FirstLabel.text = labelArray[0]
        SecondLabel.text = labelArray[1]
        ThirdLabel.text = labelArray[2]
        
        
        // Do any additional setup after loading the view.
        
        FoodLabel.text = "WoHoo Foodzz"
        FoodLabel.textAlignment = .center
        FoodLabel.textColor = UIColor.purple
        FoodLabel.font = UIFont.boldSystemFont(ofSize: 40)
        
        
        // button
        
        NextButton.setTitle("Next", for: .normal)
        NextButton.setTitleColor(.white, for: .normal)
        NextButton.backgroundColor = .blue
        NextButton.layer.cornerRadius = 10
        NextButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        //textfield
        SearchTextField.placeholder = "search here"
        SearchTextField.borderStyle = .roundedRect
        SearchTextField.font = UIFont.systemFont(ofSize: 18)
        
        //FirstLabel
        FirstLabel.textColor = UIColor.black
        FirstLabel.font = UIFont.italicSystemFont(ofSize: 20)
        //secondLabel
        SecondLabel.textColor = UIColor.black
        SecondLabel.font = UIFont.italicSystemFont(ofSize: 20)
        //thirdLabel
        ThirdLabel.textColor = UIColor.black
        ThirdLabel.font = UIFont.italicSystemFont(ofSize: 20)
        
        
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if let menuVC = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController {
            navigationController?.pushViewController(menuVC, animated: true)
        }
    }
}
    

        
    

