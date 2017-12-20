/* global atom:false */

/*
 * Your init script
 *
 * Atom will evaluate this file each time a new window is opened. It is run
 * after packages are loaded/activated and after the previous editor state
 * has been restored.
 *
 * An example hack to make opened Markdown files always be soft wrapped:
 *
 * const path = require('path');
 *
 * atom.workspaceView.eachEditorView((editorView) =>
 *   const editor = editorView.getEditor();
 *   if (path.extname(editor.getPath()) === '.md') {
 *     editor.setSoftWrap(true);
 *   }
 * );
 */

console.info('Running init.js');

// UI for An Old Hope
// document.body.classList.add('an-old-hope-modify-ui');

// Custom commands
function smartMove(which = 'home') {
  return () => {
    const editor = atom.workspace.getActiveTextEditor();

    if (editor) {
      // Get buffer and screen positions
      const bufferPos = editor.getCursorBufferPosition();
      const screenPos = editor.getCursorScreenPosition();

      // Get line text
      const bufferLine = editor.lineTextForBufferRow(bufferPos.row);
      const screenLine = editor.lineTextForScreenRow(screenPos.row);

      const screenLineStart = editor.clipScreenPosition([screenPos.row, 0], {
        skipSoftWrapIndentation: true,
      });

      const screenLineEnd = editor.clipScreenPosition([screenPos.row, Infinity], {
        skipSoftWrapIndentation: true,
      });

      if (which === 'home') {
        if (bufferLine.startsWith(screenLine) ||
            screenPos.column !== screenLineStart.column) {
          editor.moveToFirstCharacterOfLine();

          return true;
        }

        editor.moveToBeginningOfLine();
        editor.moveToFirstCharacterOfLine();

        return true;
      }

      if (which === 'end') {
        if (screenPos.column !== screenLineEnd.column) {
          editor.moveToEndOfScreenLine();

          return true;
        }

        editor.moveToEndOfLine();

        return true;
      }
    }
  };
}

atom.commands.add('atom-text-editor', {
  'user:smart-home': smartMove('home'),
  'user:smart-end': smartMove('end'),
});

// Run on workspace
const atomWorkspace = atom.views.getView(atom.workspace);

atom.commands.dispatch(atomWorkspace, 'nyan-indent:toggle');
// atom.commands.dispatch(atomWorkspace, 'tree-view:toggle');
