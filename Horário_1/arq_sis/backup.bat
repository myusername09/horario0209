@echo off
set menu=0
if exist "arq_sis\temp\tis31.txt" goto Menu
if exist "usuarios\%nome%\config\backup_aut.txt" (
echo.>>"arq_sis\temp\tis31.txt"
if exist "arq_sis\temp\backup_config.txt" goto Menu
set fb=Backup automatico
set ds=Backup gerado automaticamente pelo Hor†rio em:%time%, %date%
set ba=0
goto FB3
)

:Menu
title Backup
set ba=1
if exist "arq_sis\temp\config_ger.bat" call "arq_sis\temp\config_ger.bat"
if not exist "arq_sis\temp\config_ger.bat" (
echo set nome=%nome%>>"arq_sis\temp\ini_rap.bat"
echo.>>"arq_sis\temp\ini_backup.txt"
call "iniciar.bat"
)
if exist "arq_sis\temp\ini_backup.txt" del /q "arq_sis\temp\ini_backup.txt"
color %cores%
if "%tamanho1%" EQU "0" (
mode %tamanho%
) ELSE (
mode %tamanho1%
)
cls
echo.
if exist "usuarios\%nome%\config\backup_aut.txt" (
echo Os backups est∆o sendo feitos automaticamente.
) ELSE (
echo Os backups n∆o est∆o sendo feitos automaticamente.
)
echo.
echo 1.Ativar/desativar \ 2.Fazer backup \ 3.Restaurar backup \ 4.Excluir backup \ 5.Voltar
echo.
set /p menu=Comando:
if "%menu%" EQU "1" call :Menu2
if "%menu%" EQU "2" goto FB
if "%menu%" EQU "3" goto RB
if "%menu%" EQU "4" goto EB
if "%menu%" EQU "5" call "arq_sis\configuracoes.bat"
goto Menu

:FB
title Fazer backup
cls
echo.
echo Digite um nome para o backup.
echo Para voltar ao menu digite 1.
echo.
set /p fb=Nome:
if "%fb%" EQU "1" goto Menu
echo.
set /p ds=Descriá∆o(1/1 linha):
if "%ds%" EQU "1" goto Menu
goto FB1

:FB1
title %fb%
cls
echo.
echo %ds%
echo.
echo 1.Continuar com o backup \ 2.Voltar e corrigir informaá‰es \ 3.Cancelar
echo.
set /p fb1=Comando:
if "%fb1%" EQU "1" goto FB2
if "%fb1%" EQU "2" goto FB
if "%fb1%" EQU "3" goto Menu
goto FB1

:FB2
if exist "usuarios\%nome%\Documentos\Backup\%fb%" (
title ERRO
color C0
echo.
echo J† existe um backup com este mesmo nome.
pause
goto Menu
)
goto FB3

:FB3
echo Fazendo backup...
call "usuarios\%nome%\documentos\Backup\Backup automatico\descricao.bat"
if "%date%" EQU "%dia%" goto Sair
if "%dia%" NEQ "%date%" rd /s /q "usuarios\%nome%\documentos\Backup\Backup automatico"
md "%userprofile%\Desktop\backup_horario_123"
xcopy /y /h /e /i /q "arq_sis" "%userprofile%\Desktop\backup_horario_123\arq_sis"
xcopy /y /h /e /i /q "usuarios\%nome%" "%userprofile%\Desktop\backup_horario_123\usuarios\%nome%"
xcopy /y /h /e /i /q "iniciar.bat" "%userprofile%\Desktop\backup_horario_123"
xcopy /y /h /e /i /q "%userprofile%\Desktop\backup_horario_123" "usuarios\%nome%\Documentos\Backup\%fb%"
rd /s /q "%userprofile%\Desktop\backup_horario_123"
rd /s /q "usuarios\%nome%\documentos\Backup\%fb%\usuarios\%nome%\documentos\Backup"
echo set descricao=%ds%>>"usuarios\%nome%\Documentos\Backup\%fb%\descricao.bat"
echo set tempo=%time%>>"usuarios\%nome%\Documentos\Backup\%fb%\descricao.bat"
echo set dia=%date%>>"usuarios\%nome%\Documentos\Backup\%fb%\descricao.bat"
if %ba% EQU "0" goto Sair
goto Fim

:Fim
if "%ba%" EQU "0" goto Sair
title Fim
cls
echo.
if "%menu%" EQU "2" echo O backup foi efetuado com sucesso.
if "%menu%" EQU "3" (
if "%rb2%" EQU "1" echo Seus arquivos pessoais foram restaurados com sucesso.
if "%rb2%" EQU "2" echo Os arquivos do sistema foi resutado com sucesso.
if "%rb2%" EQU "3" echo Os arquivos foram restaurados com sucesso.
)
pause
goto Menu

:Menu2
set backup_aut=1
if exist "usuarios\%nome%\config\backup_aut.txt" (
del /q "usuarios\%nome%\config\backup_aut.txt"
set backup_aut=0
)
if not exist "usuarios\%nome%\config\backup_aut.txt" (
if "%backup_aut%" NEQ "0" echo. >>"usuarios\%nome%\config\backup_aut.txt"
)
goto Menu

:RB
title Restaurar backup
cls
echo.
echo Digite o nome do backup que ser† restaurado.
echo Para voltar ao menu digite 1.
echo.
dir "usuarios\%nome%\Documentos\Backup"
echo.
set /p rb=Comando:
if "%rb%" EQU "1" goto Menu
if not exist "usuarios\%nome%\Documentos\Backup\%rb%\descricao.bat" (
title ERRO
color C0
echo.
echo O local digitado n∆o existe ou n∆o Ç v†lido.
pause
goto RB
)
goto RB2

:RB2
title Confirmar backup
call "usuarios\%nome%\Documentos\Backup\%rb%\descricao.bat"
echo.
echo Descriá∆o do backup:%descricao%
echo Data de criaá∆o:%tempo%, %dia%
echo.
echo O que vocà deseja restaurar?
echo.
echo 1.Arquivos pessoais \ 2.Sistema \ 3.Ambos \ 4.Cancelar
echo.
set /p rb2=Comando:
if "%rb2%" EQU "1" goto RB3
if "%rb2%" EQU "2" goto RB3
if "%rb2%" EQU "3" goto RB3
if "%rb2%" EQU "4" goto Menu
goto RB2

:RB3
if "%rb2%" NEQ "2" (
xcopy /y /h /e /i /q "usuarios\%nome%\Documentos\Backup\%rb%\arq_sis" "arq_sis"
xcopy /y /h /e /i /q "usuarios\%nome%\Documentos\Backup\%rb%\iniciar.bat" "iniciar.bat"
)
if "%rb2%" NEQ "1" (
xcopy /y /h /e /i /q "usuarios\%nome%\Documentos\Backup\%rb%\usuarios\%nome%" "usuarios\%nome%"
)
goto Fim

:EB
title Excluir backup
cls
echo.
echo Digite o nome do backup que vocà deseja excluir.
echo Para voltar ao menu digite 1, para limpar todos os backups digite 2.
echo.
dir "usuarios\%nome%\Documentos\Backup"
echo.
set /p eb=Comando:
if not exist "usuarios\%nome%\Documentos\Backup\%eb%\descricao.bat" (
if "%eb%" EQU "1" goto Menu
if "%eb%" EQU "2" goto ATB
title ERRO
color C0
echo.
echo O local digitado n∆o existe ou n∆o Ç v†lido.
pause
goto EB
)
rd /s /q "usuarios\%nome%\Documentos\Backup\%eb%"
echo.
echo O backup foi excluido com sucesso.
pause
goto EB

:ATB
rd /s /q "usuarios\%nome%\Documentos\Backup"
md "usuarios\%nome%\Documentos\Backup"
echo.
echo Os backups foram apagados com sucesso.
pause
goto Menu

:Sair