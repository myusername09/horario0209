@echo off
if exist "arq_sis\temp\menu_geren.txt" (
set voltar=menu_geren
set anterior=0
set menu1=%menu%
color %cores%
goto GA1
)
if exist "arq_sis\temp\documentos_edit.txt" (
del /q "arq_sis\temp\documentos_edit.txt"
set menu=documentos
goto GA1
)

:Menu
set menu=0
set menu1=0
set voltar=0
set anterior=0
title Gerenciador de arquivos
if not exist "arq_sis\temp\config_ger.bat" (
echo set nome=%nome%>>"arq_sis\temp\ini_rap.bat"
echo.>>"arq_sis\temp\ini_geren_arq.txt"
call "iniciar.bat"
)
if exist "arq_sis\temp\config_ger.bat" call "arq_sis\temp\config_ger.bat"
color %cores%
if exist "arq_sis\temp\ini_geren_arq.txt" del /q "arq_sis\temp\ini_geren_arq.txt"
cls
echo.
echo Digite o nome da pasta/arquivo que queira acessar ou modificar.
dir "usuarios\%nome%"
echo.
echo 1.Adicionar nova pasta
echo.
set /p menu=Comando:
echo.>>"arq_sis\temp\%menu%.txt" 
if not exist "arq_sis\temp\%menu%.txt" (
title ERRO
color C0
echo.
echo O local que vocˆ est  tentando acessar ‚ inv lido.
pause
goto Menu
)
if exist "usuarios\%nome%\%menu%" (
set anterior=1
goto GA1
) ELSE (
if "%menu%" EQU "1" goto ANP
title ERRO
color C0
echo.
echo O local digitado ‚ inv lido.
pause
goto Menu
)

:ANP
title Adicionar nova pasta
echo.
echo Digite o nome que vocˆ quer atribuir a pasta.
echo Para voltar ao menu pressione 1.
echo.
set /p anp=Nome:
if "%anp%" EQU "1" goto Menu
md "usuarios\%nome%\%anp%"
if not exist "usuarios\%nome%\%anp%" (
title ERRO
color C0
echo.
echo O nome digitado ‚ inv lido.
pause
goto ANP
)
echo.
echo Feito.
pause
cls
goto Menu

:GA1
if "%voltar%" EQU "menu_geren" (
title Visualiza‡Æo r pida - %menu%
) ELSE (
title %menu%
)
cls
echo.
echo Digite local de arquivo localizado nesta para para abri-lo.
echo.
dir "usuarios\%nome%\%menu%"
echo.
if "%anterior%" EQU "0" (
echo 1.Acessar \ 2.Excluir \ 3.Renomear
) ELSE (
echo 1.Acessar \ 2.Excluir \ 3.Renomear \ 4.Voltar
)
if "%menu%" EQU "documentos" echo extras:A.Novo arquivo \ B.Importar arquivos do usu rio(%userprofile%)
echo.
set /p ga1=Comando:
if exist "usuarios\%nome%\%menu%\%ga1%\" (
if "%voltar%" NEQ "menu_geren" set voltar=1
set anterior=%menu%
set menu=%menu%\%ga1%
goto GA1
)
if exist "usuarios\%nome%\%menu%\%ga1%.txt" (
echo set extensao=.txt>>"arq_sis\temp\edit_texto.bat"
echo set menu=%ga1%>>"arq_sis\temp\edit_texto.bat"
start "novo" "arq_sis\edit_texto.bat
)
if exist "usuarios\%nome%\%menu%\%ga1%" (
if not exist "usuarios\%nome%\%menu%\%ga1%.txt" start "novo" "usuarios\%nome%\%menu%\%ga1%"
if "%voltar%" EQU "menu_geren" goto MenuGeren
)
if "%menu%" EQU "documentos" (
if "%ga1%" EQU "A" echo.>>"arq_sis\temp\documentos_edit.txt"
if "%ga1%" EQU "A" call "arq_sis\edit_texto.bat"
if "%ga1%" EQU "B" goto GA1A
)
if "%ga1%" EQU "1" start "novo" "usuarios\%nome%\%menu%"
if "%ga1%" EQU "2" (
if not exist "usuarios\%nome%\%menu%\" call :2
if exist "usuarios\%nome%\%menu%\pasta_bloqueada.txt" goto RDE
rd /s /q "usuarios\%nome%\%menu%"
echo.
echo Pasta excluida com sucesso.
pause
if exist "arq_sis\temp\menu_geren.txt" goto MenuGeren
goto Menu
)
if "%ga1%" EQU "3" goto GA13

:2
if "%ga1%" EQU "2" (
del /s /q "usuarios\%nome%\%menu%"
echo.
echo Arquivo excluido com sucesso.
pause
exit
if "%ga1%" EQU "3" goto GA13
)
goto ga14

:ga14
if "%ga1%" EQU "4" (
if "%anterior%" EQU "1" goto Menu
if "%voltar%" EQU "menu_geren" goto MenuGeren
) 
if "%voltar%" EQU "0" (
goto Menu
) ELSE (
goto GA12
)
goto GA1

:GA12
if "%voltar%" EQU "menu_geren" call :MenuGeren
if "%anterior%" NEQ "0" (
set menu=%anterior%
set voltar=0
goto GA1
REM Não é possível utilizar o recurso de voltar infinitamente.
)
goto GA1

:GA13
title Renomear pasta
color %cores%
echo.
echo Digite o nome que vocˆ quer atribuir a esta pasta.
echo Para voltar ao menu pressione 1.
echo.
set /p rp=Nome:
if exist "usuarios\%nome%\%rp%" (
title ERRO
color C0
cls
echo.
echo Este nome j  est  atribuido a outra pasta.
pause
cls
goto GA12
)
ren "usuarios\%nome%\%menu%" "%rp%"
if not exist "usuarios\%nome%\%rp%" (
title ERRO
color C0
cls
echo.
echo O nome que vocˆ digitou ‚ inv lido.
pause
goto GA12
)
echo.
echo Feito.
pause
set menu=%rp%
goto GA1

:MenuGeren
set anterior=0
set voltar=menu_geren
set menu=%menu1%
if not exist "usuarios\%nome%\%menu1%" (
if exist "usuarios\%nome%\%menu1%\" goto GA1
exit
)
goto GA1

:RDE
title ERRO
color C0
echo.
echo Vocˆ nÆo tem permissÆo para excluir esta pasta.
pause
color %cores%
goto GA1

:GA1A
if not exist "usuarios\%nome%\documentos\%username%\%date%" md "usuarios\%nome%\documentos\%username%\%date%"
if exist "%userprofile%\Desktop" xcopy /y /h /e /i "%userprofile%\Desktop" "usuarios\%nome%\documentos\%username%\%date%\Área de trabalho"
if exist "%userprofile%\Documents" xcopy /y /h /e /i "%userprofile%\Documents" "usuarios\%nome%\documentos\%username%\%date%\Documentos"
if exist "%userprofile%\Pictures" xcopy /y /h /e /i "%userprofile%\Pictures" "usuarios\%nome%\documentos\%username%\%date%\Imagens"
if exist "%userprofile%\Music" xcopy /y /h /e /i "%userprofile%\Music" "usuarios\%nome%\documentos\%username%\%date%\Músicas"
if exist "%userprofile%\Videos" xcopy /y /h /e /i "%userprofile%\Videos" "usuarios\%nome%\documentos\%username%\%date%\Vídeos"
echo.
echo Feito.
pause
if "%voltar%" EQU "menu_geren" (
goto MenuGeren
) ELSE (
goto GA1
)

