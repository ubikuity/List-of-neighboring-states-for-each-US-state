Option Explicit
' Constantes
Public Const ForReading = 1 ' Constante pour le mode lecture des fichiers textes (IOMode)
Public Const ForWriting = 2 ' Constante le mode �criture des fichiers textes (IOMode)
Public Const ForAppending = 8 ' Constante le mode �criture en fin de fichier des fichiers textes (IOMode)
Public Const TristateFalse = 0 ' Constante pour ouvrir un fichier en ASCII
Public Const TristateTrue = -1 ' Constante pour ouvrir un fichier en Unicode (UTF-16 Little Endian)

Main
Sub Main()
	Const NB_ARGS = 1
	' V�rification des arguments
	If WScript.Arguments.Count <> NB_ARGS Then
		WScript.Echo "Error, invalid number of arguments (" & WScript.Arguments.Count & " arguments instead of " & NB_ARGS & ")"
		WScript.Quit 2
	End If
	' R�cup�ration des arguments
	Dim objFso, tabArgs, strFileIn
	Set objFso = CreateObject("Scripting.FileSystemObject")
	Set tabArgs = WScript.Arguments
	strFileIn = tabArgs(0)
	
	' Ouverture fichier en entr�e
	Dim objHandleIn
	Set objHandleIn = objFso.OpenTextFile(strFileIn, ForReading, False, TristateTrue)
	
	' Ouverture fichier en sortie
	Dim strFileOut, objHandleOut 
	strFileOut = strFileIn & ".tmp"
	Set objHandleOut = objFso.OpenTextFile(strFileOut, ForWriting, True, TristateTrue)
	
	' Pr�paration de l'expression r�guli�re
	Dim regEx
	Set regEx = New RegExp
	regEx.IgnoreCase = True
	regEx.Global = True ' Substitution globale
	regEx.Pattern = "/\*\*\*\*\*\* Object:(.*)"
	
	Dim ligne
	Do While Not objHandleIn.AtEndOfStream
		ligne = objHandleIn.ReadLine()
		ligne = regEx.Replace(ligne, "")
		objHandleOut.WriteLine(ligne)
	Loop
	objHandleIn.Close
	objHandleOut.Close
	' Remplacement du fichier source par le fichier modifi�
	objFso.DeleteFile strFileIn
	objFso.MoveFile strFileOut, strFileIn
End Sub