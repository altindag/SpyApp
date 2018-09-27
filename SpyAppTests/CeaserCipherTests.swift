import XCTest
@testable import SpyApp

class CeaserCipherTests: XCTestCase {

    var cipher: Cipher!

    override func setUp() {
        super.setUp()
        cipher = CeaserCipher()
    }

    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"

        let result = cipher.encode(plaintext, secret: "0")

        XCTAssertEqual(plaintext.uppercased(), result)
    }

    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")

        XCTAssertNil(result)
    }
    
    func test_NumericInputForSecret() {
        let result = cipher.encode("b", secret: "1")
        
         XCTAssertEqual("C", result)
    }
    
    func test_AllLettersInAphabet() {
        let result = cipher.encode("abcdefghijklmnopqrstuvwxyz0123456789", secret: "1")
        
        XCTAssertEqual("BCDEFGHIJKLMNOPQRSTUVWXYZ0123456789A", result)
    }
    
    func test_decodeAllLettersInAphabet() {
        
        let result = cipher.decode("BCDEFGHIJKLMNOPQRSTUVWXYZ0123456789A", secret: "1")
        
        XCTAssertEqual("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", result)
    }

}
