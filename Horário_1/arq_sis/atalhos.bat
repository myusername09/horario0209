@echo off

:Menu
title Configurar atalhos
if not exist "arq_sis\temp\config_ger.bat" (
echo set nome=%nome%>>"arq_sis\temp\ini_rap.bat"
echo.>>"arq_sis\temp\ini_atalhos.txt"
call "iniciar.bat"
)
if exist "usuarios\%nome%\config\ata1.bat" call "usuarios\%nome%\config\ata1.bat"
if exist "usuarios\%nome%\config\ata2.bat" call "usuarios\%nome%\config\ata2.bat"
if exist "usuarios\%nome%\config\ata3.bat" call "usuarios\%nome%\config\ata3.bat"
if exist "usuarios\%nome%\config\ata4.bat" call "usuarios\%nome%\config\ata4.bat"
if exist "usuarios\%nome%\config\ata5.bat" call "usuarios\%nome%\config\ata5.bat"
if exist "arq_sis\temp\config_ger.bat" call "arq_sis\temp\config_ger.bat"
if "%tamanho1%" EQU "0" (
mode %tamanho%
) ELSE (
mode %tamanho1%
)
color %cores%
if exist "usuarios\%nome%\config\atalhos.bat" call "usuarios\%nome%\config\atalhos.bat"
echo.
echo Digite o n£mero correspondente ao atalho que deseja modificar.
echo.
echo 1.%ata1% \ 2.%ata2% \ 3.%ata3% \ 4.%ata4% \ 5.%ata5% \ 6.Voltar
echo.
echo A.Limpar tudo
echo.
set /p menu=Comando:
if "%menu%" EQU "1" goto Ata
if "%menu%" EQU "2" goto Ata
if "%menu%" EQU "3" goto Ata
if "%menu%" EQU "4" goto Ata
if "%menu%" EQU "5" goto Ata
if "%menu%" EQU "6" call "arq_sis\configuracoes.bat"
if "%menu%" EQU "A" (
if exist "usuarios\%nome%\config\ata.txt" del /q "usuarios\%nome%\config\ata.txt"
if exist "usuarios\%nome%\config\ata1.bat" del /q "usuarios\%nome%\config\ata1.bat"
if exist "usuarios\%nome%\config\ata2.bat" del /q "usuarios\%nome%\config\ata2.bat"
if exist "usuarios\%nome%\config\ata3.bat" del /q "usuarios\%nome%\config\ata3.bat"
if exist "usuarios\%nome%\config\ata4.bat" del /q "usuarios\%nome%\config\ata4.bat"
if exist "usuarios\%nome%\config\ata5.bat" del /q "usuarios\%nome%\config\ata5.bat"
set ata1=
set ata2=
set ata3=
set ata4=
set ata5=
echo.
echo Feito.
pause
)
goto Menu

:Ata
title Atalho %menu%
mode %tamanho%
color %cores%
cls
echo.
echo Digite o comando correspondente a fun‡Æo que ser  adicionada a este atalho.
echo OBS:note que algumas altera‡äes podem provocar erros no Hor rio.
echo.
echo Digite "fim" para finalizar.
echo.
set /p ata=Função(1/3):
set /p ata11=Função(2/3):
if "%ata11%" EQU "fim" (
set ata11=fim
set ata22=fim
goto Ata1
)
set /p ata22=Função(3/3):
if "%ata22%" EQU "fim" (
set ata22=fim
)
goto Ata1

:Ata1
echo.
echo Digite o nome que vocˆ quer atribuir a esta fun‡Æo.
echo.
set /p atan=Nome:
goto Ata2

:Ata2
if exist "usuarios\%nome%\config\ata%menu%.bat" del /q "usuarios\%nome%\config\ata%menu%.bat"
echo set ata%menu%=%atan%>>"usuarios\%nome%\config\ata%menu%.bat"
if "%menu%" EQU "1" echo if "%%menu%%" EQU "A" %ata% >>"usuarios\%nome%\config\ata%menu%.bat"
if "%menu%" EQU "2" echo if "%%menu%%" EQU "B" %ata% >>"usuarios\%nome%\config\ata%menu%.bat"
if "%menu%" EQU "3" echo if "%%menu%%" EQU "C" %ata% >>"usuarios\%nome%\config\ata%menu%.bat"
if "%menu%" EQU "4" echo if "%%menu%%" EQU "D" %ata% >>"usuarios\%nome%\config\ata%menu%.bat"
if "%menu%" EQU "5" echo if "%%menu%%" EQU "E" %ata% >>"usuarios\%nome%\config\ata%menu%.bat"
if "%ata11%" NEQ "fim" echo %ata11%>>"usuarios\%nome%\config\ata%menu%.bat"
if "%ata22%" NEQ "fim" echo %ata22%>>"usuarios\%nome%\config\ata%menu%.bat"
if not exist "usuarios\%nome%\config\ata.txt" echo Remover este arquivo fará os atalhos pararem de funcionar.>>"usuarios\%nome%\config\ata.txt"
if not exist "usuarios\%nome%\config\ata%menu%.bat" (
title ERRO
color C0
echo.
echo NÆo foi poss¡vel configurar o atalho.
echo Certique-se de que nenhum problema est  presente nesta c¢pia do Hor rio.
pause
)
echo.
echo Feito.
pause
goto Menu