import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var copyOutput: UITextField!

    let factory = CipherFactory()
    var cipher: Cipher?

    var plaintext: String {
        if let text = input.text {
            return text
        } else {
            return ""
        }
    }

    var secretText: String {
        if let text = secret.text {
            return text
        } else {
            return ""
        }
    }

    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let encoded = cipher.encode(plaintext, secret: secretText) {
            output.text = encoded
            copyOutput.text = encoded
            print(encoded)
        } else {
            output.text = "Error encoding"
        }
    }

    @IBAction func decodeButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let decoded = cipher.decode(plaintext, secret: secretText) {
             print(decoded)
            output.text = decoded
        } else {
            output.text = "Error encoding"
        }
    }
    
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        guard
            let buttonLabel = sender.titleLabel,
            let buttonText = buttonLabel.text
        else {
            output.text = "No button or no button text"
            return
        }
        print(buttonLabel)
        if (buttonLabel.text == "Ceasar" ){
            output.text = "Please enter a pozitive number for secret input ex:1 \n your text needs to be A..Z , a..z , 0..9"
        }else if buttonLabel.text == "Baconian"{
            output.text = "Please enter comma separeted two capital letters for secret input ex:A,B \n your text needs to be A..Z , a..z , 0..9"
            
        }else if buttonLabel.text == "Affine" {
            output.text = "Please enter a pozitive number for secret input ex:1\n your text needs to be A..Z , a..z , 0..9"
        }
        cipher = factory.cipher(for: buttonText)
    }
}

