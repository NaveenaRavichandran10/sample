//
//  DemoUIViewController.swift
//  sample
//
//  Created by FCI-MAC on 01/04/25.
//

import UIKit

class DemoUIViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet var BgView: UIView!
    @IBOutlet weak var NameTableView: UITableView!
    
    var foodItems: [String] = []
    var foodPrices: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.93, green: 0.90, blue: 0.98, alpha: 1.0)
        
        // Table view setup
        NameTableView.delegate = self
        NameTableView.dataSource = self
        NameTableView.register(UINib(nibName: "DemoTableViewCell", bundle: nil), forCellReuseIdentifier: "DemoTableViewCell")
        NameTableView.showsVerticalScrollIndicator = true
        NameTableView.isScrollEnabled = true

        
        // Background styling
        BgView.backgroundColor = UIColor.systemGray6 // professional soft gray tone
    }
    
    // MARK: - TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return foodItems.count
       }
    

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
           cell.NameLabel.text = "\(foodItems[indexPath.row]) - ₹\(String(format: "%.2f", foodPrices[indexPath.row]))"

           cell.NameLabel.textColor = .blue
           return cell
       }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedName = foodItems[indexPath.row]
        let selectedPrice = foodPrices[indexPath.row]

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let menuVC = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController {
            menuVC.selectedFoodName = selectedName
            menuVC.selectedPrice = selectedPrice
            navigationController?.pushViewController(menuVC, animated: true)
        }

    }

   }
