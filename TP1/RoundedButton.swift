//
//  RoundedButton.swift
//  TP1
//
//  Created by Mamitiana RAKOTO on 19/03/2021.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.layer.cornerRadius = 25.0
	}
}
