function main()
{
yaup();
Delay(1000, "script execution delayed for 1000 ms")
check();
}

  
function yaup()
{
  TestedApps.notepad.Run();
  Aliases.NOTEPAD.wndNotepad.Edit.Keys("^o");
  Aliases.NOTEPAD.dlgOpen.OpenFile("C:\\Documents and Settings\\Tester\\Desktop\\test1.txt", "Text Documents (*.txt)");
  Aliases.NOTEPAD.wndNotepad.Edit.Keys("^a[Del]12345");
  Aliases.NOTEPAD.wndNotepad.MainMenu.Click("File|Save As...");
  Aliases.NOTEPAD.dlgSaveAs.SaveFile("C:\\Documents and Settings\\Tester\\Desktop\\test12", "Text Documents (*.txt)");
  Aliases.NOTEPAD.wndNotepad.Close();
}
function check()
{
  TestedApps.notepad.Run();
  Aliases.NOTEPAD.wndNotepad.Edit.Keys("^o");
  Aliases.NOTEPAD.dlgOpen.OpenFile("C:\\Documents and Settings\\Tester\\Desktop\\test12", "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.NOTEPAD.wndNotepad.Edit.wText, 0, "12345", false);
  Aliases.NOTEPAD.wndNotepad.Close();
}


