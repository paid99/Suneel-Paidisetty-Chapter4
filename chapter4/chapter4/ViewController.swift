//
//  ViewController.swift
//  chapter4
//
//  Created by Silver_Gold on 5/19/19.
//  Copyright © 2019 Silver_Gold. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var doSomething: UIButton!
    
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        doSomething.isHidden = true
    }
    
    @IBAction func textFieldDoneEditing(sender : UITextField){
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        //nameField.resignFirstResponder()
        //numberField.resignFirstResponder()
    }
    
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(lroundf((sender as AnyObject).value))"
    }
    
    @IBAction func onButtonPerssed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are You Sure?", message:nil, preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "Yes, I'm sure!",
                                      style: .destructive,
                                      handler: { action in
                                        let msg =  "You can breathe easy, everything went OK."
                                        let controller2 = UIAlertController(title:"Something Was Done",
                                                                            message: msg,
                                                                            preferredStyle: .alert)
                                        let cancelAction = UIAlertAction(title: "Phew!",
                                                                         style: .cancel,
                                                                         handler: nil)
                                        controller2.addAction(cancelAction)
                                        self.present(controller2, animated: true, completion: nil)
                                        
        })
        let noAction = UIAlertAction(title: "No way!", style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        present(controller, animated: true, completion: nil)
    }
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            doSomething.isHidden = true
        }else{
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            doSomething.isHidden = false
        }
    }
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let settings = sender.isOn
        leftSwitch.setOn(settings, animated: true)
        rightSwitch.setOn(settings, animated: true)
    }
}

