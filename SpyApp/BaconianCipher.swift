
import Foundation


struct BaconianCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        var comma:Int = 0
        var firstPart: String = ""
        var secondPart: String = ""
        //Baconian

        var encoded = ""
        print(secret.count)
        if secret.count == 3 {
           
                        for achar in secret {
                            if achar == "," {
                                comma = comma + 1
                            }
                            if comma == 0 {
                                firstPart = firstPart+String(achar)
                            }
                            if ((comma > 0) && (achar != ",")) {
                                secondPart = secondPart+String(achar)
                            }
                            
                        }
                        if comma == 1 {
                            let firstCode =  firstPart.unicodeScalars.first!.value
                            let secondCode =  secondPart.unicodeScalars.first!.value
                            if ((firstCode >= 65 && firstCode < 91) && (secondCode >= 65 && secondCode < 91)) {
                            
                                for character in plaintext {
                                    
                                            var unicode = character.unicodeScalars.first!.value
                                    
                                            if ( (unicode >= 65 && unicode <= 90) ||  (unicode >= 48 && unicode <= 57) || (unicode >= 97 && unicode <= 122) ) {
                                                
                                                if ( (unicode >= 97 && unicode <= 122)){
                                                    unicode = unicode-32
                                                    
                                                }
                                                
                                                
                                                var shiftedUnicode = String(unicode , radix:2)
                                                print("shiftencode : \(shiftedUnicode)")
                                                let bitcount = shiftedUnicode.count
                                                
                                                print("bitcount : \(bitcount)")
                                                if (bitcount < 8){
                                                    let looptimes = 8 - bitcount
                                                    for _ in 1...looptimes {
                                                        shiftedUnicode = "0" + shiftedUnicode
                                                    }
                                                }
                                                print("shiftencode after: \(shiftedUnicode)")
                                                let shiftedCharacter = String(shiftedUnicode)
                                                encoded = encoded + shiftedCharacter
                                            }else{
                                                    return " input format have to be A..Z 0..9 "
                                            }
                                    
                                    
                                    
                                    
                                }
                                var binEncoded: String=""
                                for eachcode in encoded {
                                    if eachcode == "1"{
                                    binEncoded = binEncoded + firstPart
                                    }
                                    else{
                                    binEncoded = binEncoded + secondPart
                                    }
                                    
                                }
                                return binEncoded
                            }else{
                                return " secret key format is incorrect "
                                
                            }
                        }else{
                            return " secret key format is incorrect "
                            
                        }
            
        }else{
            return " secret key format is incorrect "
        }
       
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        
        var comma:Int = 0
        var firstPart: String = ""
        var secondPart: String = ""
        //Baconian
        
        var encoded = ""
        print(secret.count)
        if secret.count == 3 {
            
            for achar in secret {
                if achar == "," {
                    comma = comma + 1
                }
                if comma == 0 {
                    firstPart = firstPart+String(achar)
                }
                if ((comma > 0) && (achar != ",")) {
                    secondPart = secondPart+String(achar)
                }
                
            }
            if comma == 1 {
                let firstCode =  firstPart.unicodeScalars.first!.value
                let secondCode =  secondPart.unicodeScalars.first!.value
                if ((firstCode >= 65 && firstCode < 91) && (secondCode >= 65 && secondCode < 91)) {
                    
                    
                    
                                    var binEncoded: String=""
                                    for eachcode in plaintext {
                                        if ((String(eachcode) != firstPart) && (String(eachcode) != secondPart) ) {
                                            return " text to decode have to be only \(firstPart) or \(secondPart)  "
                                        }
                                        
                                        if String(eachcode) == firstPart{
                                            binEncoded = binEncoded + "1"
                                        }
                                        else{
                                            binEncoded = binEncoded + "0"
                                        }
                                        
                                    }
                    print(binEncoded)
                                    var counter : Int = 0
                                    var everyFive : String = ""
                                    for character in binEncoded {
                                        counter = counter + 1
                                        everyFive = everyFive + String(character)
                                        if ( counter % 8 == 0){
                                            print("+++=0")
                                            print(everyFive)
                                            let decimalEveryFive = UInt8(everyFive, radix: 2)!
                                            print("decimaleveryFive \(decimalEveryFive)")
                                            everyFive = ""
                                            let shiftedCharacter = String(Unicode.Scalar(decimalEveryFive))
                                            print("our char : \(shiftedCharacter)")
                                            encoded = encoded + shiftedCharacter
                                            
                                        }
                                        
                                    }
                    
                                    return encoded
                }else{
                    return " secret key format is incorrect "
                    
                }
            }else{
                return " secret key format is incorrect "
                
            }
            
        }else{
            return " secret key format is incorrect "
        }
        
        
        
        
        
        
        
    }
}
