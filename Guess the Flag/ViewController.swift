//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Dong Kim on 4/12/22.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var button1: UIButton!
  @IBOutlet var button2: UIButton!
  @IBOutlet var button3: UIButton!
  @IBOutlet var flagLabel: UILabel!

  var buttons: [UIButton] {
    return [button1, button2, button3]
  }

  var score = 0
  var countries = [
    "estonia",
    "france",
    "germany",
    "ireland",
    "italy",
    "monaco",
    "nigeria",
    "poland",
    "russia",
    "spain",
    "uk",
    "us",
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    displayRandomFlags()
    title = "Guess the Country's Flag"
  }

  func displayRandomFlags() {
    countries.shuffle()
    for (idx, button) in buttons.enumerated() {
      button.setImage(UIImage(named: countries[idx]), for: .normal)
      button.layer.borderWidth = 1
      button.layer.borderColor = UIColor.lightGray.cgColor
      button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
    let countryName = countries[Int.random(in: 0 ... 2)].uppercased()
    flagLabel.text = countryName
    flagLabel.font = UIFont.boldSystemFont(ofSize: 35)
  }
}
