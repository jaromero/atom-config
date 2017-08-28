# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)

# UI for An Old Hope
# document.body.classList.add 'an-old-hope-modify-ui'

# Custom commands
atom.commands.add 'atom-text-editor',
  # Smart home/end
  # Check the current editor line and cursor position.

  # Go to first character of wrapped line.
  # If already there (or if the line isn't wrapped), do the
  # standard thing
  'user:smart-home': ->
    if (editor = atom.workspace.getActiveTextEditor())
      # Get buffer _and_ screen positions
      bufferPos = editor.getCursorBufferPosition()
      screenPos = editor.getCursorScreenPosition()

      # Get line text
      bufferLine = editor.lineTextForBufferRow bufferPos.row
      screenLine = editor.lineTextForScreenRow screenPos.row

      # Get screen line start
      screenLineStart = editor.clipScreenPosition [screenPos.row, 0],
        skipSoftWrapIndentation: true

      # Check to see if we're on the first pseudo-line
      if bufferLine.startsWith screenLine
        # Do the normal thing
        editor.moveToFirstCharacterOfLine()
      else if screenPos.column isnt screenLineStart.column
        # Go to the start of the screen line
        editor.moveToFirstCharacterOfLine()
      else
        # Go to the first character
        editor.moveToBeginningOfLine()
        editor.moveToFirstCharacterOfLine()
  ,
  # Go to last character of wrapped line.
  # If already there (or if the line isn't wrapped), do the
  # standard thing
  'user:smart-end': ->
    if (editor = atom.workspace.getActiveTextEditor())
      # Get buffer _and_ screen positions
      bufferPos = editor.getCursorBufferPosition()
      screenPos = editor.getCursorScreenPosition()

      # Get line text
      bufferLine = editor.lineTextForBufferRow bufferPos.row
      screenLine = editor.lineTextForScreenRow screenPos.row

      # Get screen line end
      screenLineEnd = editor.clipScreenPosition [screenPos.row, Infinity],
        skipSoftWrapIndentation: true

      if screenPos.column isnt screenLineEnd.column
        # Go to the start of the screen line
        editor.moveToEndOfScreenLine()
      else
        editor.moveToEndOfLine()
