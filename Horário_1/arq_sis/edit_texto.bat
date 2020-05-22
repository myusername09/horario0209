@echo off

:Menu
title Editor de Texto
if exist "arq_sis\temp\texto.txt" del /q "arq_sis\temp\texto.txt"
if exist "arq_sis\temp\edit_texto.bat" (
call "arq_sis\temp\edit_texto.bat"
goto 1Editar
)
if not exist "arq_sis\temp\config_ger.bat" (
echo set nome=%nome%>>"arq_sis\temp\ini_rap.bat"
echo.>>"arq_sis\temp\ini_texto.txt"
call "iniciar.bat"
)
if exist "arq_sis\temp\config_ger.bat" call "arq_sis\temp\config_ger.bat"
if not exist "usuarios\%nome%\agenda\%date%" md "usuarios\%nome%\agenda\%date%"
if exist "arq_sis\temp\ini_edit_texto.txt" del /q "arq_sis\temp\ini_texto.txt"
cls
color %cores%
echo.
echo Qual ‚ o nome que vocˆ deseja atribuir ao arquivo?
echo OBS:caso a extensÆo seja personalizada adicione-a aqui.
echo.
if exist "arq_sis\temp\documentos_edit.txt" (
echo Digite 1 para voltar para o Gerenciador de Arquivos.
echo.
)
set /p menu=Nome:
if exist "arq_sis\temp\documentos_edit.txt" (
if "%menu%" EQU "1" call "arq_sis\geren_arq.bat"
)
echo.>>"arq_sis\temp\%menu%.txt"
if exist "arq_sis\temp\%menu%.txt" goto Menu1
title ERRO
color C0
echo.
echo Nome de arquivo inv lido.
pause
goto Menu

:Menu1
echo.
echo Qual ‚ o formato que vocˆ vocˆ seja atribuir ao arquivo?
echo OBS:o arquivo %nome% ser  salvo em "usuarios\%nome%\documentos"
echo.
echo 1.Texto(.txt) \ 2.Batch(.bat) \ 3.VBScript(.vbs) \ 4.Nenhum(personalizado)
echo.
set /p menu1=ExtensÆo:
if "%menu1%" EQU "1" (
set extensao=.txt
goto 1Editar
)
if "%menu1%" EQU "2" (
set extensao=.bat
goto 1Editar
)
if "%menu1%" EQU "3" (
set extensao=.vbs
goto 1Editar
)

:1Editar
if exist "usuarios\%nome%\documentos\%menu%%extensao%" echo.>>"arq_sis\temp\edit_continuar.txt"
if exist "arq_sis\temp\config_ger.bat" (
call "arq_sis\temp\config_ger.bat"
color %cores%
) ELSE (
echo set nome=%nome%>>"arq_sis\temp\ini_rap.bat"
echo.>>"arq_sis\temp\ini_texto.txt"
call "iniciar.bat"
)
cls
echo.
echo Quando a edi‡Æo do arquivo estiver pronta, feche o programa.
goto Editar

:Editar
if exist "arq_sis\temp\edit_continuar.txt" (
title Continuar edi‡Æo - %menu%
) ELSE (
title Editar - %menu%
)
echo.
if exist "usuarios\%nome%\documentos\%menu%%extensao%" type "usuarios\%nome%\documentos\%menu%%extensao%"
set /p editar=Texto:
if "%editar%" EQU "HoráriooiràroHorário" set editar=echo.
if "%editar%" EQU "echo." goto editare
echo %editar%>>"usuarios\%nome%\documentos\%menu%%extensao%"
set editar=HoráriooiràroHorário
cls
goto Editar

:editare
echo.>>"usuarios\%nome%\documentos\%menu%%extensao%"
cls
goto Editar
