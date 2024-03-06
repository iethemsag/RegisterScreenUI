import SwiftUI

struct ContentView: View {
    @State private var nameSurname = ""
    @State private var mail = ""
    @State private var username = ""
    @State private var password = ""
    @State private var wrongNameSurname = 0
    @State private var wrongMail = 0
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.8)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.4)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Registration")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Name & Surname", text: $nameSurname)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongNameSurname))
                    TextField("Mail", text: $mail)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongMail))
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Resgister") {
                        autheticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    NavigationLink(
                        destination: ScreenView(),
                        isActive: $showingLoginScreen
                    ) {
                        EmptyView()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func autheticateUser(username: String, password: String) {
        
        if nameSurname == "IbrahimEthemSag" {
            wrongNameSurname = 0
            if mail == "sagibrahimethem@gmail.com" {
                wrongMail = 0
            } else {
                wrongMail = 2
            }
        } else {
            wrongNameSurname = 2
        }
        
        if username == "iethemsag" {
            wrongUsername = 0
            if password.lowercased() == "abc123" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
