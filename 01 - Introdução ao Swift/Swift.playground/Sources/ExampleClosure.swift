import Foundation

public func code(for title: String, sampleCode: () -> Void) {
  print("""

  -----------------------------
  Results for: '\(title)'

  """)
  sampleCode()
}
