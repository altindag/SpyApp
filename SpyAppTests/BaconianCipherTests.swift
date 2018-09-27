import XCTest
@testable import SpyApp

class BaconianCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = BaconianCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "A,B")
        
        XCTAssertEqual("BABBBBBA", result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertEqual(" secret key format is incorrect ", result)
    }
    
    
    func test_AllLettersInAphabet() {
        let result = cipher.encode("abcdefghijklmnopqrstuvwxyz0123456789", secret: "A,B")
        
        XCTAssertEqual("BABBBBBABABBBBABBABBBBAABABBBABBBABBBABABABBBAABBABBBAAABABBABBBBABBABBABABBABABBABBABAABABBAABBBABBAABABABBAAABBABBAAAABABABBBBBABABBBABABABBABBABABBAABABABABBBABABABABABABAABBABABAAABABAABBBBABAABBABABAABABBBAABBBBBBAABBBABBAABBABBBAABBAABBAABABBBBAABABABBAABAABBBAABAAABBAAABBBBBAAABBA", result)
    }
    
    func test_decodeAllLettersInAphabet() {
        
        let result = cipher.decode("BABBBBBABABBBBABBABBBBAABABBBABBBABBBABABABBBAABBABBBAAABABBABBBBABBABBABABBABABBABBABAABABBAABBBABBAABABABBAAABBABBAAAABABABBBBBABABBBABABABBABBABABBAABABABABBBABABABABABABAABBABABAAABABAABBBBABAABBABABAABABBBAABBBBBBAABBBABBAABBABBBAABBAABBAABABBBBAABABABBAABAABBBAABAAABBAAABBBBBAAABBA", secret: "A,B")
        
        XCTAssertEqual("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", result)
    }

    
    
}
