//
//  todo_appApp.swift
//  todo-app
//
//  Created by Shun Yoshida on 2026/01/11.
//

import SwiftUI

/// アプリケーションのエントリーポイント
///
/// - `@main`: アプリの起動点を示す属性。Swift 5.3+で導入
/// - `App`プロトコル: SwiftUIアプリのライフサイクルを管理
/// - `Scene`: アプリのUI階層の最上位。WindowGroupが一般的
@main
struct todo_appApp: App {
    var body: some Scene {
        // WindowGroup: アプリのメインウィンドウを提供
        // iOSでは1つ、macOS/iPadOSでは複数ウィンドウをサポート
        WindowGroup {
            TodoListView()
        }
    }
}
