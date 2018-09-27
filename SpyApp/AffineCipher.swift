
import Foundation


struct AffineCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        var shiftedUnicode : UInt32
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            if ( (unicode >= 65 && unicode <= 90) ||  (unicode >= 48 && unicode <= 57) || (unicode >= 97 && unicode <= 122) ) {
                if ( (unicode >= 97 && unicode <= 122)){
                    shiftedUnicode = unicode-32+shiftBy
                    
                }else{
                    shiftedUnicode = unicode+shiftBy
                    
                }
                var shiftedCharacter : String = ""
                if (shiftedUnicode < 100){
                    shiftedCharacter = "0"+String(shiftedUnicode)
                }
                shiftedCharacter = String(shiftedCharacter.reversed())
                encoded = encoded + shiftedCharacter
                
            }else{
                encoded = " input format have to be A..Z 0..9 "
            }
        }
        
        return encoded
    }
    func decode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return " secret key needs to be digit "
        }
        var encoded = ""
        var everyThreeChar : String = ""
        var count : Int = 0
        var intValue : UInt32! = 0
        var shiftedCharacter : String = ""
        
        for character in plaintext {
            if ((character.unicodeScalars.first!.value < 48) || (character.unicodeScalars.first!.value > 57) ) {
                return " text to decode have to be digits  "
            }
            
            
            count = count + 1
            everyThreeChar = everyThreeChar+String(character)
            if ( count % 3 == 0){
                everyThreeChar = String(everyThreeChar.reversed())
                intValue = UInt32(everyThreeChar)
                intValue = intValue-shiftBy
                if (intValue>127){
                    return " text to decode is not correct "
                }
                shiftedCharacter = String(UnicodeScalar(UInt8(intValue)))
                encoded = encoded + shiftedCharacter
                everyThreeChar = ""
            }
            
            
            
        }
      
        return encoded
    }
    
}
