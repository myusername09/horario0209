@echo off

:Menu
title Menu
set menu=0
if not exist "arq_sis\temp\config_ger.bat" (
echo set nome=%nome%>>"arq_sis\temp\ini_rap.bat"
echo.>>"arq_sis\temp\ini_menu.txt"
call "iniciar.bat"
)
if exist "arq_sis\temp\config_ger.bat" call "arq_sis\temp\config_ger.bat"
if "%nome%" EQU "" (
title ERRO
color C0
mode 100,20
if exist "arq_sis\temp\ini_menu.bat" del /q "arq_sis\temp\ini_menu.bat"
cls
echo.
echo O usu rio que vocˆ est  tentando acessar nÆo existe.
echo Poss¡velmente vocˆ digitou algum caract‚re inv lido na tela de Login.
pause
exit
)
color %cores%
mode %tamanho%
cls
echo.
if not exist "usuarios\%nome%\config\anotacoes.bat" echo Nenhuma anotação foi adicionada ainda.
if exist "usuarios\%nome%\config\anotacoes.bat" call "usuarios\%nome%\config\anotacoes.bat"
if not exist "usuarios\%nome%\config\ata.txt" goto Painel

:Ata
echo.
if exist "usuarios\%nome%\config\ata1.bat" call "usuarios\%nome%\config\ata1.bat"
if exist "usuarios\%nome%\config\ata2.bat" call "usuarios\%nome%\config\ata2.bat"
if exist "usuarios\%nome%\config\ata3.bat" call "usuarios\%nome%\config\ata3.bat"
if exist "usuarios\%nome%\config\ata4.bat" call "usuarios\%nome%\config\ata4.bat"
if exist "usuarios\%nome%\config\ata5.bat" call "usuarios\%nome%\config\ata5.bat"
echo A.%ata1% \ B.%ata2% \ C.%ata3% \ D.%ata4% \ E.%ata5%

:Painel
echo.
echo 1.Agenda \ 2.Anota‡äes \ 3.Editor de Texto \ 4.Gerenciador de arquivos \ 5.Configura‡äes \ 6.Sair
echo.
set /p menu=Comando:
if "%cteclado%" EQU "0" echo %menu%>>"usuarios\%nome%\documentos\teclado.txt"
if "%menu%" EQU "1" start "novo" "arq_sis\agenda.bat"
if "%menu%" EQU "2" start "novo" "arq_sis\anotacoes.bat"
if "%menu%" EQU "3" start "novo" "arq_sis\edit_texto.bat"
if "%menu%" EQU "4" (
if exist "arq_sis\temp\menu_geren.txt" del /q "arq_sis\temp\menu_geren.txt"
start "novo" "arq_sis\geren_arq.bat"
)
if "%menu%" EQU "5" (
if exist "arq_sis\temp\novo_usuario_config.txt" del /q "arq_sis\temp\novo_usuario_config.txt"
start "novo" "arq_sis\configuracoes.bat"
)
if "%menu%" EQU "6" (
del /q "arq_sis\temp\*.txt"
del /q "arq_sis\temp\*.bat"
attrib +h "usuarios\%nome%\config\senha.bat"
taskkill /f /im cmd.exe
)
if exist "usuarios\%nome%\config\ata.txt" call :Ata1
if exist "usuarios\%nome%\%menu%" (
echo.>>"arq_sis\temp\menu_geren.txt"
start "novo" "arq_sis\geren_arq.bat"
)
goto Menu

:Ata1
if "%menu%" EQU "A" if exist "usuarios\%nome%\config\ata1.bat" call "usuarios\%nome%\config\ata1.bat"
if "%menu%" EQU "B" if exist "usuarios\%nome%\config\ata2.bat" call "usuarios\%nome%\config\ata2.bat"
if "%menu%" EQU "C" if exist "usuarios\%nome%\config\ata3.bat" call "usuarios\%nome%\config\ata3.bat"
if "%menu%" EQU "D" if exist "usuarios\%nome%\config\ata4.bat" call "usuarios\%nome%\config\ata4.bat"
if "%menu%" EQU "E" if exist "usuarios\%nome%\config\ata5.bat" call "usuarios\%nome%\config\ata5.bat"