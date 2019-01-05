Const ForReading = 1    
Const ForWriting = 2
Const strFileName = "retroarch.cfg"

'Read the file
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName, ForReading)
strText = objFile.ReadAll
objFile.Close

'Replace contents
strNewText = Replace(strText, "config_save_on_exit = ""true""", "config_save_on_exit = ""false""")
Set oRegExp = New RegExp
oRegExp.Pattern = "input_overlay = ""[^""]+"""
strNewText = oRegExp.Replace(strNewText, "input_overlay = """"")

'Write the file again
Set objFile = objFSO.OpenTextFile(strFileName, ForWriting)
objFile.Write strNewText  'WriteLine adds extra CR/LF
objFile.Close