import SwiftUI

struct ContentView: View {
    @State private var expression: [String] = []
    @State private var input: String = ""
    @State private var result: String = "0"

    var body: some View {
        VStack(spacing: 16) {
            Text(result)
                .font(.largeTitle)
                .padding()

            HStack {
                Button("1") { addNumber("1") }
                Button("2") { addNumber("2") }
            }
            .buttonStyle(.borderedProminent)

            HStack {
                Button("+") { addOperator("+") }
                Button("=") { calculateResult() }
            }
            .buttonStyle(.bordered)

        }
        .padding()
    }

    private func addNumber(_ number: String) {
        input += number
        result = input
    }

    private func addOperator(_ op: String) {
        if !input.isEmpty {
            expression.append(input)
            expression.append(op)
            input = ""
        }
    }

    private func calculateResult() {
        if !input.isEmpty {
            expression.append(input)
        }

        var total = 0
        var currentOperator: String?

        for item in expression {
            if let number = Int(item) {
                if let op = currentOperator, op == "+" {
                    total += number
                } else {
                    total = number
                }
            } else {
                currentOperator = item
            }
        }

        result = "\(total)"
        expression.removeAll()
        input = ""
    }
}

#Preview {
    ContentView()
}
