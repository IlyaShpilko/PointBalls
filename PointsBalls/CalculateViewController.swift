//
//  ViewController.swift
//  PointsBalls
//
//  Created by Ilya Shpilko on 11/13/21.
//

import UIKit

class CalculateViewController: UIViewController {
    
    // FIXME: - Сумма меньше 1 не должна проходить
    // TODO: - Подсчитывать общие количество баллов
    // TODO: - Экран всех баллов
    @IBOutlet weak var productPickerView: UIPickerView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet var numbersButton: [UIButton]!
    @IBOutlet var unavailableButtos: [UIButton]!
    
    var namesProductsArray = ["POS A", "POS_N до 12 мес.", "POS_N более 12 мес."]
    var isComma = false
    var componentName = "POS A"
    
    let model = HelperModel()
    
    // MARK: - Life Cycle View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in numbersButton {
            button.backgroundColor = UIColor.lightGray
            button.tintColor = .white
            button.layer.cornerRadius = button.frame.height / 2
        }
        productPickerView.delegate = self
        productPickerView.dataSource = self
    }

    // MARK: - Actions
    @IBAction func numberButtonss(_ sender: UIButton) {
        guard let string = sender.titleLabel?.text else { return }
        var textTF: String = ""
        
        if string == "," && !isComma {
            textTF += priceTextField.text!.isEmpty ? "0" : ""
            isComma = true
        } else if string == "," && isComma {
            return
        }
        textTF += string
        
        priceTextField.text! += textTF
    }
    
    @IBAction func removeButton(_ sender: UIButton) {
        if !priceTextField.text!.isEmpty {
            
            if priceTextField.text?.last == "," {
                isComma = false
            }
            
            priceTextField.text?.removeLast()
        }
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            let vc = segue.destination as! DetailViewController
            let price = priceTextField.text!
            
            vc.price = price
            vc.product = componentName
            vc.score = model.resultScore(productName: componentName, price: price)
        }
    }
}

    // MARK: - Picker View
extension CalculateViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return namesProductsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return namesProductsArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40.0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        componentName = namesProductsArray[row]
    }
}

extension CalculateViewController: UITextFieldDelegate {
    
}
