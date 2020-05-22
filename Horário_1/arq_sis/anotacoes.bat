@echo off
set menu=0

:Menu
title Anota‡äes
if not exist "arq_sis\temp\config_ger.bat" (
echo set nome=%nome%>>"arq_sis\temp\ini_rap.bat"
echo.>>"arq_sis\temp\ini_anotacoes.txt"
call "iniciar.bat"
)
if exist "arq_sis\temp\config_ger.bat" call "arq_sis\temp\config_ger.bat"
if exist "arq_sis\temp\ini_anotacoes.txt" del /q "arq_sis\temp\ini_anotacoes.txt"
if "%tamanho1%" EQU "0" (
mode %tamanho%
) ELSE (
mode %tamanho1%
)
color %cores%
cls
echo.
dir "usuarios\%nome%\anotacoes"
echo.
echo 1.Adicionar \ 2.Remover \ 3.Limpar
echo.
set /p menu=Comando:
if "%menu%" EQU "1" goto Adicionar
if "%menu%" EQU "2" goto Remover
if "%menu%" EQU "3" (
del /q "usuarios\%nome%\anotacoes\*.bat"
echo.
echo Feito.
pause
)
goto Menu

:Adicionar
title Adicionar
cls
echo.
set /p ad1=Nome(nÆo coloque s¡mbolos):
echo.
echo Digite "fim" para finalizar.
echo.
set /p ad21=Coment rio(linha 1/5):
if "%ad21%" EQU "fim" (
set ad22=fim
set ad23=fim
set ad24=fim
set ad25=fim
goto Adicionar1
)
set /p ad22=Coment rio(linha 2/5):
if "%ad22%" EQU "fim" (
set ad23=fim
set ad24=fim
set ad25=fim
goto Adicionar1
)
set /p ad23=Coment rio(linha 3/5):
if "%ad23%" EQU "fim" (
set ad24=fim
set ad25=fim
goto Adicionar1
)
set /p ad24=Coment rio(linha 4/5):
if "%ad24%" EQU "fim" (
set ad25=fim
goto Adicionar1
)
set /p ad25=Coment rio(linha 5/5):
if "%ad25%" EQU "fim" goto Adicionar1
goto Adicionar1

:Adicionar1
echo.
set ad3=%date%
set /p ad3=Data de entrega(00/00/0000):
goto Adicionar11

:Adicionar11
echo.
echo Marcar esta atividade como principal?
echo.
echo 1.Sim \ 2.NÆo
echo.
set /p adicionar11=Comando:
if "%adicionar11%" EQU "1" goto Adicionar2
if "%adicionar11%" EQU "2" goto Adicionar2
cls
goto Adicionar11

:Adicionar2
title %ad1%
cls
echo.
if "%ad21%" NEQ "fim" echo %ad21%
if "%ad22%" NEQ "fim" echo %ad22%
if "%ad23%" NEQ "fim" echo %ad23%
if "%ad24%" NEQ "fim" echo %ad24%
if "%ad25%" NEQ "fim" echo %ad25%
if "%ad21%" NEQ "fim" echo.
echo Data de entrega:%ad3%
echo.
echo 1.Continuar \ 2.Voltar e corrigir informa‡äes \ 3.Cancelar
echo.
set /p adicionar2=Comando:
if "%adicionar2%" EQU "2" goto Adicionar
if "%adicionar2%" EQU "3" goto Menu
if "%adicionar11%" EQU "2" (
if "%adicionar2%" EQU "1" goto AC
) ELSE (
goto ACP
)
goto Adicionar2

:AC
echo @echo off>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo.>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo if exist "arq_sis\temp\%ad1%" (>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo exit>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo ) ELSE (>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo md "arq_sis\temp\%ad1%">>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo )>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo.>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo if exist "arq_sis\temp\config_ger.bat" call "arq_sis\temp\config_ger.bat">>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo if "%%date%%" GEQ "%ad3%" goto Menu>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo if "%%date%%" LSS "%ad3%" exit>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo.>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo :Menu>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo title %ad1%>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo.>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo mode %%tamanho%%>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo color %%cores%%>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo.>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo echo.>>"usuarios\%nome%\anotacoes\%ad1%.bat"
if "%ad21%" NEQ "fim" echo echo %ad21%>>"usuarios\%nome%\anotacoes\%ad1%.bat"
if "%ad22%" NEQ "fim" echo echo %ad22%>>"usuarios\%nome%\anotacoes\%ad1%.bat"
if "%ad23%" NEQ "fim" echo echo %ad23%>>"usuarios\%nome%\anotacoes\%ad1%.bat"
if "%ad24%" NEQ "fim" echo echo %ad24%>>"usuarios\%nome%\anotacoes\%ad1%.bat"
if "%ad25%" NEQ "fim" echo echo %ad25%>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo pause>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo echo.>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo echo O que você deseja fazer com a anota‡Æo?>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo echo.>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo echo 1.Excluir \ 2.Arquivar \ 3.Nada>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo echo.>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo set /p anotacoes=Comando:>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo if "%%anotacoes%%" EQU "1" (>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo del /q "usuarios\%%nome%%\anotacoes\%ad1%.bat">>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo exit>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo )>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo if "%%anotacoes%%" EQU "2" (>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo if not exist "usuarios\%%nome%%\anotacoes\arquivados" md "usuarios\%%nome%%\anotacoes\arquivados">>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo xcopy /y /h /e /i "usuarios\%%nome%%\anotacoes\%ad1%.bat" "arq_sis\temp">>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo if exist "arq_sis\temp\arquivados" rd /s /q "arq_sis\temp\arquivados">>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo xcopy /y /h /e /i "arq_sis\temp\%ad1%.bat" "usuarios\%%nome%%\anotacoes\arquivados">>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo del /q "usuarios\%%nome%%\anotacoes\%ad1%.bat">>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo exit>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo )>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo if "%%anotacoes%%" EQU "3" exit>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo goto Menu>>"usuarios\%nome%\anotacoes\%ad1%.bat"
echo if "%%lembrete%%" EQU "ativado" if exist "usuarios\%nome%\anotacoes\%ad1%.bat" start "novo" "usuarios\%nome%\anotacoes\%ad1%.bat">>"usuarios\%nome%\config\anotacoes.bat"
goto Fim

:Fim
title Fim
cls
echo.
echo Anota‡Æo adicionada com sucesso.
pause
goto Menu

:Remover
title Remover anota‡Æo
cls
echo.
echo Digite o nome da anota‡Æo que ser  removida.
echo Para voltar pressione 1.
echo.
dir "usuarios\%nome%\anotacoes"
echo.
set /p remover=Comando:
if exist "usuarios\%nome%\anotacoes\%remover%.bat" (
del /q "usuarios\%nome%\anotacoes\%remover%.bat"
echo.
echo Feito
pause
goto Menu
)
if not exist "usuarios\%nome%\anotacoes\%remover%.bat" (
if "%remover%" EQU "1" goto Menu
echo.
echo Arquivo nÆo encontrado.
pause
goto Remover
)

:ACP
if exist "usuarios\%nome%\config\anotacoes.bat" (
xcopy /y /h /e /i /g "usuarios\%nome%\config\anotacoes.bat" "usuarios\%nome%\anotacoes"
del /q "usuarios\%nome%\config\anotacoes.bat"
)
echo @echo off>>"usuarios\%nome%\config\anotacoes.bat"
echo.>>"usuarios\%nome%\config\anotacoes.bat"
echo set lembrete=ativado>>"usuarios\%nome%\config\anotacoes.bat"
if "%ad21%" NEQ "fim" echo echo %ad21%>>"usuarios\%nome%\config\anotacoes.bat"
if "%ad22%" NEQ "fim" echo echo %ad22%>>"usuarios\%nome%\config\anotacoes.bat"
if "%ad23%" NEQ "fim" echo echo %ad23%>>"usuarios\%nome%\config\anotacoes.bat"
if "%ad24%" NEQ "fim" echo echo %ad24%>>"usuarios\%nome%\config\anotacoes.bat"
if "%ad25%" NEQ "fim" echo echo %ad25%>>"usuarios\%nome%\config\anotacoes.bat"
echo :Sair>>"usuarios\%nome%\config\anotacoes.bat"
echo if not exist "arq_sis\temp\anotacoes_nc.txt" set lembrete=desativado>>"usuarios\%nome%\config\anotacoes.bat"
echo.
echo Feito.
pause
goto Menu