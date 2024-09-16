# Contexts

## Context Hierarchy

```
Global
│
├── Workspace
│   │
│   ├── Pane
│   │   ├── Editor
│   │   ├── BufferSearchBar
│   │   └── MarkdownPreview
│   │
│   └── Dock
│       │
│       ├── AssistantPanel
│       │   │
│       │   └── Pane
│       │       ├── ContextEditor
│       │       │   └── Editor
│       │       └── BufferSearchBar
│       │
│       ├── ProjectPanel
│       │
│       └── Pane
│           └── Terminal
```

## Experiments

### Common Contexts
| Context                           | Buffer | File Finder | Assistant Panel | Terminal | Search Bar | Menu |
|-----------------------------------|--------|-------------|-----------------|----------|------------|------|
| Workspace                         | ✔️     | ✔️          | ✔️              | ✔️       | ✔️         | ✔️   |
| Pane                              | ✔️     | ❌          | ✔️              | ✔️       | ✔️         | ❌   |
| Editor                            | ✔️     | ❌          | ✔️              | ❌       | ✔️         | ✔️   |
| AssistantPanel                    | ❌     | ❌          | ✔️              | ❌       | ❌         | ❌   |
| BufferSearchBar*                  | ❌     | ❌          | ❌              | ❌       | ✔️         | ❌   |
| VimControl                        | ✔️     | ❌          | ✔️              | ❌       | ❌         | ❌   |
| ProjectPanel                      | ❌     | ✔️          | ❌              | ❌       | ❌         | ❌   |
| Picker**                          | ❌     | ❌          | ❌              | ❌       | ❌         | ❌   |
- * _BufferSearchBar works only when triggered from the buffer, NOT the assistant panel_
- ** _Picker works in theme selector for instance_

### Workspace
| Context                           | Buffer | File Finder | Assistant Panel | Terminal | Search Bar | Menu |
|-----------------------------------|--------|-------------|-----------------|----------|------------|------|
| Workspace > Pane                  | ✔️     | ❌          | ❌              | ❌       | ✔️         | ❌   |
| Workspace > Pane > Editor         | ✔️     | ❌          | ❌              | ❌       | ❌         | ❌   |
| Workspace > Pane > BufferSearchBar| ❌     | ❌          | ❌              | ❌       | ✔️         | ❌   |

### Pane
| Context                           | Buffer | File Finder | Assistant Panel | Terminal | Search Bar | Menu |
|-----------------------------------|--------|-------------|-----------------|----------|------------|------|
| Workspace > Pane                  | ✔️     | ❌          | ❌              | ❌       | ✔️         | ❌   |
| Pane > Editor                     | ✔️     | ❌          | ❌              | ❌       | ❌         | ❌   |
| Pane > Terminal                   | ❌     | ❌          | ❌              | ✔️       | ❌         | ❌   |
| Pane > AssistantPanel             | ❌     | ❌          | ❌              | ❌       | ❌         | ❌   |
| Pane > BufferSearchBar            | ❌     | ❌          | ❌              | ❌       | ✔️         | ❌   |

### BufferSearchBar
| Context                           | Buffer | File Finder | Assistant Panel | Terminal | Search Bar | Menu |
|-----------------------------------|--------|-------------|-----------------|----------|------------|------|
| BufferSearchBar > Editor          | ❌     | ❌          | ❌              | ❌       | ✔️         | ❌   |

### AssistantPanel
| Context                                        | Buffer | File Finder | Assistant Panel | Terminal | Search Bar | Menu |
|------------------------------------------------|--------|-------------|-----------------|----------|------------|------|
| AssistantPanel                                 | ❌     | ❌          | ✔️              | ❌       | ✔️         | ❌   |
| AssistantPanel > Pane                          | ❌     | ❌          | ✔️              | ❌       | ✔️         | ❌   |
| AssistantPanel > Pane > ContextEditor          | ❌     | ❌          | ✔️              | ❌       | ❌         | ❌   |
| AssistantPanel > Pane > ContextEditor > Editor | ❌     | ❌          | ✔️              | ❌       | ❌         | ❌   |
| AssistantPanel > Pane > BufferSearchBar        | ❌     | ❌          | ❌              | ❌       | ✔️         | ❌   |
| Pane > AssistantPanel                          | ❌     | ❌          | ❌              | ❌       | ❌         | ❌   |
| Pane > ContextEditor                           | ❌     | ❌          | ✔️              | ❌       | ❌         | ❌   |
| ContextEditor > Editor                         | ❌     | ❌          | ✔️              | ❌       | ❌         | ❌   |
| ContextEditor > Editor && VimControl           | ❌     | ❌          | ✔️              | ❌       | ❌         | ❌   |

### Terminal
| Context                           | Buffer | File Finder | Assistant Panel | Terminal | Search Bar | Menu |
|-----------------------------------|--------|-------------|-----------------|----------|------------|------|
| Terminal                          | ❌     | ❌          | ❌              | ✔️       | ❌         | ❌   |
| Pane > Terminal                   | ❌     | ❌          | ❌              | ✔️       | ❌         | ❌   |
| Dock > Pane > Terminal            | ❌     | ❌          | ❌              | ✔️       | ❌         | ❌   |
| Workspace > Dock > Pane > Terminal| ❌     | ❌          | ❌              | ✔️       | ❌         | ❌   |

## Contexts in default keymap
- `AssistantPanel`
- `BufferSearchBar`
- `BufferSearchBar && in_replace`
- `BufferSearchBar && !in_replace > Editor`
- `ChannelModal`
- `ChannelModal > Picker > Editor`
- `(CollabPanel && editing) > Editor`
- `CollabPanel && not_editing`
- `ContextEditor > Editor`
- `Editor`
- `Editor`
- `Editor`
- `Editor && !inline_completion`
- `Editor && inline_completion && !showing_completions`
- `Editor && jupyter && !ContextEditor`
- `Editor && mode == auto_height`
- `Editor && mode == full`
- `Editor && mode == full`
- `Editor && mode == full`
- `Editor && mode == full && inline_completion`
- `Editor && renaming`
- `Editor && showing_code_actions`
- `Editor && (showing_code_actions || showing_completions)`
- `Editor && showing_completions`
- `FileFinder`
- `Markdown`
- `OutlinePanel`
- `Pane`
- `Pane`
- `Pane`
- `Picker > Editor`
- `Picker || menu`
- `ProjectPanel`
- `ProjectPanel && not_editing`
- `ProjectSearchBar`
- `ProjectSearchBar > Editor`
- `ProjectSearchBar && !in_replace`
- `ProjectSearchBar && in_replace > Editor`
- `ProjectSearchView`
- `Prompt`
- `PromptLibrary`
- `TabSwitcher`
- `!Terminal`
- `Terminal`
- `Workspace`

## Contexts in default vim keymap
- `BufferSearchBar && !in_replace`
- `EmptyPane || SharedScreen`
- `OutlinePanel`
- `ProjectPanel && not_editing`
- `VimControl && !menu`
- `VimControl && VimCount`
- `vim_mode == insert`
- `vim_mode == normal`
- `vim_mode == operator`
- `vim_mode == replace`
- `vim_mode == visual`
- `vim_mode == waiting`
- `vim_operator == <`
- `vim_operator == >`
- `vim_operator == a || vim_operator == i || vim_operator == cs`
- `vim_operator == c`
- `vim_operator == d`
- `vim_operator == g~`
- `vim_operator == gc`
- `vim_operator == gu`
- `vim_operator == gU`
- `vim_operator == y`
- `vim_operator == ys`
