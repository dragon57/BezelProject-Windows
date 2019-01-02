Const ForReading = 1    
Const ForWriting = 2
Const strFileName = "retroarch.cfg"

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName, ForReading)
strText = objFile.ReadAll
objFile.Close

strNewText = Replace(strText, "config_save_on_exit = ""true""", "config_save_on_exit = ""false""")
Set objFile = objFSO.OpenTextFile(strFileName, ForWriting)
objFile.Write strNewText  'WriteLine adds extra CR/LF
objFile.Close