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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameTableView.delegate = self
        NameTableView.dataSource = self
        self.NameTableView.register(UINib(nibName: "DemoTableViewCell", bundle: nil), forCellReuseIdentifier: "DemoTableViewCell")


        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one

               let cell = self.NameTableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
   return cell

    }
    
    

   
}
