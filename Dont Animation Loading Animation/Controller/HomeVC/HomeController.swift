//
//  HomeController.swift
//  Dont Animation Loading Animation
//
//  Created by Atik Hasan on 5/20/25.
//


import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    var animationNameArray : [String] = ["Dot Loading Animation"," Pulse - Ripple Animation","Rotating Arc Spinner","Tail Effect Animation"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.tableView.separatorStyle = .none
    }
    
    func gotoAnotherVC(indexpath : IndexPath?){
        if let indexpath = indexpath {
            switch indexpath.row {
            case 0:
                let storyboard = UIStoryboard(name: "DotAnimationVC", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "DotAnimationVC") as! DotAnimationVC
                self.navigationController?.pushViewController(vc, animated: true)
            case 1:
                let storyboard = UIStoryboard(name: "PulseAnimationVC", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "PulseAnimationVC") as! PulseAnimationVC
                self.navigationController?.pushViewController(vc, animated: true)
            case 2:
                let storyboard = UIStoryboard(name: "ArcSpinnerVC", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "ArcSpinnerVC") as! ArcSpinnerVC
                self.navigationController?.pushViewController(vc, animated: true)
            case 3:
                let storyboard = UIStoryboard(name: "TailDotsVC", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "TailDotsVC") as! TailDotsVC
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        }
    }
}


extension HomeController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animationNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.lblAnimationName.text = animationNameArray[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.gotoAnotherVC(indexpath: indexPath)
    }
}
