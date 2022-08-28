//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Adela Adeoye on 28/08/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentValue: UILabel!
    @IBOutlet weak var tipControll: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        billAmountTextField.text = defaults.string(forKey: "bill")
        let tipPercentages = [0.15, 0.18, 0.2]
        tipPercentValue.text =   "\(String(format: "%.2f", tipPercentages [tipControll.selectedSegmentIndex ] * 100))%"
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0

        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages [tipControll.selectedSegmentIndex]
    
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        let total = bill + tip
        
        tipAmountLabel.text = formatter.string(for: tip)
        //Update Total Amount
       
        totalLabel.text = formatter.string(for: total)
        tipPercentValue.text =   "\(String(format: "%.2f", tipPercentages [tipControll.selectedSegmentIndex ] * 100))%"
        let defaults = UserDefaults.standard
        defaults.set(billAmountTextField.text, forKey: "bill")
        defaults.synchronize()
    }
    
    @IBAction func onTipSliderChange(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0

        let tipPercentages = Double(tipSlider.value)
        let tip = bill * tipPercentages / 100
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        let total = bill + tip
        
        tipAmountLabel.text = formatter.string(for: tip)
        //Update Total Amount
       
        totalLabel.text = formatter.string(for: total)
        tipPercentValue.text =   "\(String(format: "%.2f", tipSlider.value))%"
        let defaults = UserDefaults.standard
        defaults.set(billAmountTextField.text, forKey: "bill")
        defaults.synchronize()
        
    }
    @IBAction func onBillAmountChange(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0

        let tipPercentages = Double(tipSlider.value)
        let tip = bill * tipPercentages / 100
    
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        let total = bill + tip
        
        //Update Total Tip
        tipAmountLabel.text = formatter.string(for: tip)
        //Update Total Amount
       
        totalLabel.text = formatter.string(for: total)
        let defaults = UserDefaults.standard
        defaults.set(billAmountTextField.text, forKey: "bill")
        defaults.synchronize()
    }
}

