//
//  ConfigSceneViewController.swift
//  MatchEmTab
//
//  Created by Guest User on 4/13/22.
//

import UIKit

class ConfigSceneViewController: UIViewController {
    

    
    var MatchEmSceneVC : GameSceneViewController?
    
    
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    print("ConfigVC:\(#function)") // Adjust the message for green
    }

    
    @IBAction func turnOnDarkMode(_ sender: UISwitch) {
        if let mesvc = MatchEmSceneVC, let messv = mesvc.view {
            if(sender.isOn){
            messv.backgroundColor = .black
            mesvc.gameInfoLabel.textColor = .white
            mesvc.gameInfoLabel.backgroundColor = .blue
            }
            else{
                messv.backgroundColor = .systemTeal
                mesvc.gameInfoLabel.textColor = .black
            }
        }
    }
    
    @IBAction func changeTimer(_ sender: UISlider) {
        
        if let mesvc = MatchEmSceneVC, let messv = mesvc.view {
            mesvc.adjustableGameSpeed = CGFloat(sender.value)/10
        }
        
    }
    
    @IBAction func changeGameLength(_ sender: UISlider) {

        if let mesvc = MatchEmSceneVC, let messv = mesvc.view {
            mesvc.adjustableGameTime = CGFloat(ceil(sender.value))
        }
        
    }
    
    @IBOutlet weak var scoreLabel: UILabel!

    private var scoreInfo: String {
        let labelText = String(format: "1:%2d \n 2:%2d \n 3:%2d",
                               GameManager.scores[0], GameManager.scores[1], GameManager.scores[2])
        return labelText
    }
    
    
    @IBAction func changeRectAlpha(_ sender: UIStepper) {
        if let mesvc = MatchEmSceneVC, let messv = mesvc.view {
        mesvc.rectangleDarkness = 1/CGFloat(sender.value)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let mesvc = MatchEmSceneVC, let messv = mesvc.view {
            if let mesvc = MatchEmSceneVC, let messv = mesvc.view {
                mesvc.pauseGameRunning()
            }
        }
        
        scoreLabel.text = scoreInfo
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("ConfigSceneVC: \(#function)")
        
       /* if let mesvc = tabBarController?.viewControllers![0] {
        MatchEmSceneVC = (mesvc as! GameSceneViewController)
        
        }
        */
    
            
        MatchEmSceneVC = self.navigationController?.viewControllers[0] as? GameSceneViewController
        
            
        
        
        
        

        // Do any additional setup after loading the view.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
