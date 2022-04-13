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
  var score = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  func displayRandomFlags() {
    button1.setImage(UIImage(named: "estonia"), for: .normal)
  }
}
