import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Affine": AffineCipher(),
        "Baconian": BaconianCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
