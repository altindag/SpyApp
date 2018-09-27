import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decode(_ plaintext: String, secret: String) -> String?}

struct CeaserCipher: Cipher {
    var asciiArray: Array<UInt32> = Array()
    init() {
        for eachAsciicode in 65...90 {
            asciiArray.append(UInt32(eachAsciicode))
        }
        for eachAsciicode in 48...57 {
            asciiArray.append(UInt32(eachAsciicode))
        }
       
    }
    func getIndex(_ asciiCodeOfelement : UInt32) -> UInt32 {
        var foundIndex : UInt32 = 0
        for index in 0..<asciiArray.count {
            if asciiCodeOfelement == asciiArray[index]{
                foundIndex = UInt32(index)
                break;
            }
        }
        return foundIndex
    }
    func encode(_ plaintext: String, secret: String) -> String? {
         print("my array :" + String(-5 % 3))
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        var shiftedUnicode : UInt32 = 0
        //var arrayIndex : Int = 0
        var unicode : UInt32
        var arrayIndex : UInt32 = 0
         for character in plaintext {
            unicode = character.unicodeScalars.first!.value
            if ( (unicode >= 65 && unicode <= 90) ||  (unicode >= 48 && unicode <= 57) || (unicode >= 97 && unicode <= 122) ) {
                if ( (unicode >= 97 && unicode <= 122)){
                     unicode = unicode-32
                    
                }
                arrayIndex = UInt32(Int(getIndex(unicode) + shiftBy) % asciiArray.count)
                
                
                let shiftedCharacter = String(UnicodeScalar(UInt8(asciiArray[Int(arrayIndex)])))
                encoded = encoded + shiftedCharacter
                
            }else{
                encoded = " input format have to be A..Z 0..9 "
            }
        }
        return encoded
    }
    func decode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        var unicode : UInt32
        var arrayIndex : Int32 = 0
        for character in plaintext {
            unicode = character.unicodeScalars.first!.value
            
            if ( (unicode >= 65 && unicode <= 90) ||  (unicode >= 48 && unicode <= 57) ) {

                arrayIndex = Int32(Int(getIndex(unicode)  ) )
                arrayIndex = (arrayIndex - Int32(shiftBy)) % Int32(asciiArray.count)
                print("array index decode : \(arrayIndex)")
                if (arrayIndex < 0 ){
                    arrayIndex = (Int32(asciiArray.count)+(arrayIndex))
                }
                
                let shiftedCharacter = String(UnicodeScalar(UInt8(asciiArray[Int(arrayIndex)])))
                encoded = encoded + shiftedCharacter
                
            }else{
                encoded = " input format have to be A..Z 0..9 "
            }
            
           
        }
        return encoded
    }
}

