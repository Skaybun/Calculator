





import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var keys = (typingNum :true, typingDot : true, typingDec: true)

    var displayValue :Double {
        get {
            
            guard let number = Double(displayLabel.text!) else {fatalError("having problem converting display value to double")}
            return number
        }
        set {
            if newValue == 0 {
                displayLabel.text = "0"
            }else {
                displayLabel.text = String(newValue)
            }
        }
    }
    var firstNumber : Double?
    var method : String?
    var symbol : String?
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        keys.typingNum = true
        let s = sender.currentTitle
        let n = displayValue
        if let symbol = s {
            
        if symbol == "AC" {
            keys.typingDot = true
            keys.typingDec = true
            displayValue = 0
        }
        else if symbol == "+/-"{
            displayValue = displayValue * -1
            
        }
        else if symbol == "%" {
            displayValue = displayValue/100
        }
        else if symbol == "=" {
            if displayLabel.text != ""  {
                let operation = method
                guard let n1 = firstNumber else { fatalError("error with entering first number")}
                switch operation {
                case "+":
                    displayLabel.text  = String(n1 + n)
                case "-":
                    displayLabel.text  = String(n1 - n)
                case "×":
                    displayLabel.text  = String(n1 * n)
                case "÷":
                    displayLabel.text  = String(n1 / n)
                default:
                    fatalError("somethings wrong")
                }
                
                }
            }
        
        else {
            
            firstNumber = n
            method = symbol
            keys.typingDot = true
            keys.typingDec = true
            
        }
    }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        
        if let safeText = sender.currentTitle{
            
            if keys.typingNum && keys.typingDot {
                if safeText == "."{
                    displayLabel.text = "0."
                    
                    keys.typingDot = false
                } else {
                    displayLabel.text = safeText
                    keys.typingNum = false
                }
                
            }
           else  {
               if safeText == "." && keys.typingDec && keys.typingDot {
                   displayLabel.text?.append(safeText)
                   keys.typingDec = false
                   return
               } else if safeText != "."{
                   displayLabel.text?.append(safeText)
               }
          
               
            }
            
            
        }
        
    }
}
