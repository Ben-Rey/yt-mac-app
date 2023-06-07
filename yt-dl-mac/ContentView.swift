//
//  ContentView.swift
//  yt-dl-mac
//
//  Created by Ben on 27/05/2023.
//

import Foundation

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Youtube App!")
            List {
                SomeButtons()
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SomeButtons: View {
    var body: some View {
        Menu {
            Button {
                // do something
            } label: {
                Text("Dl")
                Image(systemName: "arrow.down.right.circle")
            }
            Button {
                // do something
            } label: {
                Text("mp3")
                Image(systemName: "arrow.up.and.down.circle")
            }
        } label: {
             Text("Style")
             Image(systemName: "tag.circle")
        }
    }
}

func shell(_ command: String) -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", command]
    task.launchPath = "/bin/zsh"
    task.standardInput = nil
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!
    
    return output
}
