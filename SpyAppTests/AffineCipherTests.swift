import XCTest
@testable import SpyApp

class AffineCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = AffineCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(560, Int(result!))
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("a", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
    func test_NumericInputForSecret() {
        let result = cipher.encode("b", secret: "1")
        
        XCTAssertEqual(760, Int(result!))
    }
    
    func test_AllLettersInAphabet() {
        let result = cipher.encode("abcdefghijklmnopqrstuvwxyz0123456789", secret: "1")
        
        XCTAssertEqual("660760860960070170270370470570670770870970080180280380480580680780880980090190940050150250350450550650750850", result)
    }
    
    func test_decodeAllLettersInAphabet() {
        
        let result = cipher.decode("660760860960070170270370470570670770870970080180280380480580680780880980090190940050150250350450550650750850", secret: "1")
        
        XCTAssertEqual("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", result)
    }

    
    
}
