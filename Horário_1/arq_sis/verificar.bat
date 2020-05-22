:Menu
title Verificando arquivos...
if exist "resultado.txt" del /q "resultado.txt"
cls
echo.
echo Falta(m) o(s) seguinte(s) arquivo(s):>>"resultado.txt"
echo.>>"resultado.txt"
set resultado=0
set usuario=0
if not exist "iniciar.bat" (
set resultado=1
echo iniciar.bat>>"resultado.txt"
)
if not exist "arq_sis\temp" (
md "arq_sis\temp"
if not exist "arq_sis\temp" set resultado=1
echo arq_sis\temp>>"resultado.txt"
)
if not exist "arq_sis\atalhos.bat" (
set resultado=1
echo arq_sis\atalhos.bat>>"resultado.txt"
)
if not exist "arq_sis\novo_usuario.bat" (
set resultado=1
echo arq_sis\novo_usuario.bat>>"resultado.txt"
)
if not exist "arq_sis\menu.bat" (
set resultado=1
echo arq_sis\menu.bat>>"resultado.txt"
)
if not exist "arq_sis\agenda.bat" (
set resultado=1
echo arq_sis\agenda.bat>>"resultado.txt"
)
if not exist "arq_sis\anotacoes.bat" (
set resultado=1
echo arq_sis\anotacoes.bat>>"resultado.txt"
)
if not exist "arq_sis\configuracoes.bat" (
set resultado=1
echo arq_sis\configuracoes.bat>>"resultado.txt"
)
if not exist "arq_sis\geren_arq.bat" (
set resultado=1
echo arq_sis\geren_arq.bat>>"resultado.txt"
)
if not exist "arq_sis\backup.bat" (
set resultado=1
echo arq_sis\backup.bat>>"resultado.txt"
)
if not exist "arq_sis\edit_texto.bat" (
set resultado=1
echo arq_sis\edit_texto.bat>>"resultado.txt"
)
if not exist "iniciar.bat" (
set resultado=1
echo iniciar.bat>>"resultado.txt"
)
if "%resultado%" EQU "1" (
title ERRO
color C0
mode 100,20
cls
echo.
if not exist "resultado.txt" call :resultado1
if exist "resultado.txt" type "resultado.txt"
pause
if exist "C:\Windows\System32\resultado.txt" del /q "C:\Windows\System32\resultado.txt"
exit
)
if "%resultado%" EQU "0" (
if exist "arq_sis\temp\verificar_reparo.bat" goto Reparo
del /q "resultado.txt"
if exist "arq_sis\temp\iniciar.txt" goto Sair
title Fim da verificação
cls
echo.
echo Nenhum problema foi encontrado nesta c¢pia.
if "%usuario%" EQU "1" echo Vocˆ ainda nÆo configurou nenhum usu rio.
pause
exit
)

:resultado1
echo Esta c¢pia do Hor rio est  corrompida, por‚m o programa de verifica‡Æo
echo nÆo conseguiu encontrar o arquivo de relat¢rio(relatorio.txt).

:Reparo
if not exist "arq_sis\temp\verificar_reparo.bat" (
title ERRO
color C0
echo.
echo NÆo foi poss¡vel reparar o sistema.
pause
exit
)
call "arq_sis\temp\verificar_reparo.bat"
xcopy /y /h /e /i "%local%\arq_sis" "%reparo%\arq_sis"
xcopy /y /h /e /i "%local%\usuarios" "%reparo%\usuarios"
xcopy /y /h /e /i "%local%\iniciar.bat" "%reparo%"
echo.
echo Feito.

:Sair