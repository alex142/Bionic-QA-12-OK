function jhh()
{
  TestedApps.notepad.Run();
  Aliases.NOTEPAD.wndNotepad.MainMenu.Click("File|Save");
  Aliases.NOTEPAD.dlgSaveAs.SaveFile("C:\\Documents and Settings\\Tester\\Desktop\\test12.txt", "Text Documents (*.txt)");
  Aliases.NOTEPAD.dlgSaveAs.btnYes.ClickButton();
}

function dg()
{
  Aliases.NOTEPAD.wndNotepad.Edit.Keys("^s");
}
