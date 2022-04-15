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
  @IBOutlet var scoreLabel: UILabel!

  var buttons: [UIButton] {
    return [button1, button2, button3]
  }

  var correctFlag: String?
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
    scoreLabel.font = UIFont.systemFont(ofSize: 25)
  }

  func displayRandomFlags(_: UIAlertAction? = nil) {
    countries.shuffle()
    for (idx, button) in buttons.enumerated() {
      button.setImage(UIImage(named: countries[idx]), for: .normal)
      button.layer.borderWidth = 1
      button.layer.borderColor = UIColor.lightGray.cgColor
      button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
    correctFlag = countries[Int.random(in: 0 ... 2)]
    flagLabel.text = correctFlag?.uppercased()
    flagLabel.font = UIFont.boldSystemFont(ofSize: 35)
  }

  @IBAction func buttonTapped(_ sender: UIButton) {
    var title: String
    let selectedFlag = countries[sender.tag]
    // set the variables to correct score and string display
    if selectedFlag == correctFlag {
      title = "Correct!"
      score += 1
    } else {
      title = """
        "Wrong. You selected the flag for \(selectedFlag.count < 3 ? selectedFlag.uppercased() : selectedFlag.capitalized).
      """
    }
    // display the score and alert
    scoreLabel.text = "SCORE: \(score)"
    let alert = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: displayRandomFlags))
    present(alert, animated: true, completion: nil)
  }
  //
}
