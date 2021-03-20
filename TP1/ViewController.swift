//
//  ViewController.swift
//  TP1
//
//  Created by Mamitiana RAKOTO on 19/03/2021.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var operationLabel: UILabel!
	@IBOutlet weak var resultLabel: UILabel!
	@IBOutlet weak var historyLabel: UILabel!
	var lastOperator: String = "+"
	let syntaxError = "Syntax Error"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	@IBAction func onNumberClick(_ sender: Any) {
		let buttonTxt = (sender as! UIButton).titleLabel!.text!
		if self.historyLabel.text == self.syntaxError {
			self.historyLabel.text = "0"
		}
		if self.operationLabel.text != "0" || buttonTxt == "." {
			self.operationLabel.text! += buttonTxt
			self.historyLabel.text! += buttonTxt
		} else {
			self.operationLabel.text = buttonTxt
			if (self.historyLabel.text?.count == 1) {
				self.historyLabel.text = buttonTxt
			} else {
				self.historyLabel.text! += buttonTxt
			}
		}
	}
	
	@IBAction func onClickOperator(_ sender: Any) {
		let buttonTxt = (sender as! UIButton).titleLabel!.text!
		let result = Double(self.resultLabel!.text!)
		let operation = Double(self.operationLabel!.text!)
		if buttonTxt != "=" {
			self.historyLabel.text! += " \(buttonTxt) "
		}
		// Calcule resultLabel
		let res = self.doOperation(nb1: result!, nb2: operation!)
		self.resultLabel.text = "\(res)"
		self.operationLabel.text = "0"
		self.lastOperator = buttonTxt
	}
	
	func doOperation(nb1: Double, nb2: Double) -> Double {
		switch self.lastOperator {
		case "x":
			return nb1 * nb2
		case "-":
			return nb1 - nb2
		case "+":
			return nb1 + nb2
		case "/":
			if nb2 == 0 {
				showToast(message: "Opération impossible", font: UIFont.init(name: "Arial", size: 15)!)
				self.reset()
				self.historyLabel.text = self.syntaxError
				return 0
			}
			return nb1 / nb2
		default:
			self.lastOperator = "+"
			return self.doOperation(nb1: nb1, nb2: nb2)
		}
	}
	
	@IBAction func onReset(_ sender: Any) {
		
		self.reset()
	}
	
	@IBAction func onClear(_ sender: Any) {
		if self.operationLabel.text?.count == 1 {
			self.operationLabel.text = "0"
		}
		if self.operationLabel.text != "0" {
			self.operationLabel.text?.remove(at: self.operationLabel.text!.index(before: self.operationLabel.text!.endIndex))
			self.historyLabel.text?.remove(at: self.historyLabel.text!.index(before: self.historyLabel.text!.endIndex))
		}
	}
	
	func reset() {
		self.operationLabel.text = "0"
		self.resultLabel.text = "0"
		self.historyLabel.text = "0"
		self.lastOperator = "+"
	}
	
	func showToast(message : String, font: UIFont) {
		
		let toastLabel = UILabel(frame: CGRect(
									x: self.view.frame.size.width/2 - 100,
									y: self.view.frame.size.height - 100,
									width: 200,
									height: 35)
		)
		toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
		toastLabel.textColor = UIColor.white
		toastLabel.font = font
		toastLabel.textAlignment = .center;
		toastLabel.text = message
		toastLabel.alpha = 1.0
		toastLabel.layer.cornerRadius = 10;
		toastLabel.clipsToBounds  =  true
		self.view.addSubview(toastLabel)
		UIView.animate(withDuration: 4, delay: 0.9, options: .curveEaseOut, animations: {
			toastLabel.alpha = 0.0
		}, completion: {(isCompleted) in
			toastLabel.removeFromSuperview()
		})
	}
}

