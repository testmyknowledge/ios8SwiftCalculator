

import UIKit

class ViewController: UIViewController {

   var operandStack = Array<Double>() // comment this if using model  and uncomment next line
    //var brain = CalculatorBrain ()
   
    @IBOutlet weak var display: UILabel!
    var stilTyping : Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        if stilTyping {
        display.text = display.text! + digit;
        }
        else
        {
            display.text = digit;
            stilTyping = true;
        }
     //   println("digit = \(digit)")
   }
 
    
    
    @IBAction func enter() {
        stilTyping = false;
        // comment these line if using model
        operandStack.append(displayValue)
       println("Operand stack = \(operandStack)")
        
       
    }
    
    //computed property convert display.text
    var displayValue: Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
            
        }
        set{
           
            display.text = "\(newValue)"
            
            stilTyping = false;
        }
        
        
    }
    
    // logic area start
    @IBAction func operate(sender: UIButton) {
        if stilTyping{
            enter()
        }
        
       
        
        if let operation = sender.currentTitle{
             // comment  this code if using model

        switch operation
        {
        case "×": performOperation { $0 * $1 }
            
        case "÷": performOperation { $0 / $1 }
            
        case "+": performOperation { $0 + $1 }
            
        case "−": performOperation { $0 - $1 }
            
        default: break
         }
            
      }

        
       
    
    }
    
    // comment both  perform operation function if using model 
    
    func performOperation(operation : (Double, Double)-> Double){
        
        if operandStack.count >= 2 {
       
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }
        
    }
    
    func performOperation(operation : (Double)-> Double){
        
        if operandStack.count >= 1 {
            
            displayValue = operation(operandStack.removeLast())
            enter()
        }
        
    }

    // comment upto here
    

}// logic area end

