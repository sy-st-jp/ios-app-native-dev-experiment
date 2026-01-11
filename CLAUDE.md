# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an experimental repository for validating native iOS app development workflows. It also serves to validate Claude in Xcode and Claude Code plugins (wshobson/agents).

### Learning Goals
- SwiftUI basics
- MVVM architecture pattern
- State management (@State, @Binding, @ObservableObject, @EnvironmentObject)
- Data persistence (SwiftData)
- Async/await patterns

### Tech Stack
- iOS 17.0+
- Swift 5.9+
- SwiftUI
- SwiftData

## Learning Support

This is an educational project. While progressing through tasks:

- **Explain iOS native development concepts** as they arise (architecture patterns, SwiftUI lifecycle, state management, etc.)
- **Provide context** on why certain approaches are used and their trade-offs
- **Reference official documentation** using Context7 MCP to fetch up-to-date Apple/Swift documentation
- **Leverage ios-developer subagent** for in-depth iOS/Swift expertise and best practices

Example: When implementing a ViewModel, explain:
- What MVVM is and why it's beneficial for SwiftUI
- How @ObservableObject and @Published work
- The relationship between View and ViewModel in SwiftUI

Always balance practical implementation with educational value.

## Language

- Think and reason in English internally
- Provide all final responses to the user in Japanese

## Tool Usage

Actively leverage the following capabilities for efficient development:

### Skills (Slash Commands)
- `/commit` - Use for git commits
- `/code-review` - Use for PR code reviews
- Other available skills should be used proactively when applicable

### Subagents (Task Tool)
- **Explore**: Use for codebase exploration and understanding code structure
- **Plan**: Use for designing implementation strategies
- **ios-developer**: Use proactively for iOS/Swift development tasks
- **backend-architect**, **frontend-developer**: Use for respective domain tasks
- **code-simplifier**: Use for refactoring and code cleanup

### MCP (Model Context Protocol) Servers
MCP servers provide additional tools and capabilities. Use them actively:

- **Context7**: Fetch up-to-date library documentation
  - `resolve-library-id`: Find library IDs for documentation lookup
  - `query-docs`: Query documentation for specific libraries
- **Greptile**: PR management and code review insights
  - `list_pull_requests`, `get_merge_request`: Manage PRs
  - `trigger_code_review`: Trigger automated code reviews
  - `list_custom_context`, `create_custom_context`: Manage review patterns
- **Swift LSP**: Swift code intelligence
  - `goToDefinition`, `findReferences`, `hover`: Navigate code
  - `documentSymbol`, `workspaceSymbol`: Explore symbols

Always prefer using these specialized tools over manual approaches when they can improve efficiency and accuracy.
