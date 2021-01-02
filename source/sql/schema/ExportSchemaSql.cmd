@set SQL_SERVER_INST=UBIKVS2010\SQLEXPRESS
@set DATABASE=Geography
@set SCHEMA_SQL_FILE=create-schema.sql

@REM On fait l'export du schema de la base de donnees
@set SQLPUBWIZ_EXE=C:\Program Files\Microsoft SQL Server\90\Tools\Publishing\1.4\sqlpubwiz.exe
"%SQLPUBWIZ_EXE%" script -d "%DATABASE%" -S "%SQL_SERVER_INST%" "%SCHEMA_SQL_FILE%" -f -schemaonly

@REM On supprime les commentaires dans le fichier genere
cscript //NoLogo ExportSchemaSql_DeleteCommentSqlPubWiz.vbs %SCHEMA_SQL_FILE%