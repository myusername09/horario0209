@echo off
:AMenu
if exist "arq_sis\temp\ini_rap.bat" goto IniRap
:Menu
if not exist "arq_sis\verificar.bat" (
title ERRO
color C0
mode 100,20
cls
echo.
echo NÆo foi poss¡vel verificar os arquivos do programa.
pause
exit
)
echo.>>"arq_sis\temp\iniciar.txt"
call "arq_sis\verificar.bat"
if exist "arq_sis\temp\login_1.txt" (
xcopy /y "arq_sis\temp\login_1.txt" "arq_sis"
)
rd /s /q "arq_sis\temp"
md "arq_sis\temp"
if exist "arq_sis\login_1.txt" (
xcopy /y "arq_sis\login_1.txt" "arq_sis\temp"
del /q "arq_sis\login_1.txt"
)
if not exist "usuarios" call "arq_sis\novo_usuario.bat"
if exist "usuarios" goto Login

:Login
title Login
mode 100,20
color 07
set nome=0
set senha=0
set cores=0
set tamanho=0
set tamanho1=0
cls
echo.
echo Qual dos usu rios abaixo ‚ o seu?
echo.
dir "usuarios"
echo.
set /p login=Usu rio:
echo.>>"arq_sis\temp\%login%.txt"
if not exist "arq_sis\temp\%login%.txt" (
title ERRO
color C0
echo.
echo Nome de usu rio inv lido.
pause
goto Login
)
if exist ".txt" (
del /q ".txt"
title ERRO
color C0
echo.
echo Nome de usu rio inv lido.
pause
goto Login
)
if exist "arq_sis\temp\.txt" (
del /q "arq_sis\temp\.txt"
title ERRO
color C0
echo.
echo Vocˆ nÆo pode deixar o nome de usu rio em branco.
pause
goto Login
)
if not exist "usuarios\%login%" (
title ERRO
color C0
echo.
echo Usu rio nÆo encontrado.
pause
goto Login
)
goto Login1

:Login1
if exist "arq_sis\temp\login_1.txt" (
title Aviso
color 67
cls
echo.
echo Mais de um usu rio est  sendo utilizado em uma mesma c¢pia do programa.
echo Pode ser que hajam conflitos nas configura‡äes.
pause
)
call "usuarios\%login%\config\nome.bat"
call "usuarios\%login%\config\senha.bat"
call "usuarios\%login%\config\cores.bat"
call "usuarios\%login%\config\tamanho.bat"
if exist "usuarios\%login%\config\tamanho_1.bat" (
call "usuarios\%login%\config\tamanho_1.bat"
) ELSE (
set tamanho1=0
)
if "%nome%" EQU "0" (
title ERRO
color C0
echo.
echo Vocˆ est  tentando acessar um usu rio que nÆo existe.
pause
goto AMenu
)
echo.
echo Digite 1 para voltar.
echo.
set /p senha1=Senha:
attrib -h "usuarios\%nome%\config\senha.bat"
if "%senha1%" NEQ "%senha%" (
if "%senha1%" EQU "1" goto Login
title ERRO
color C0
echo.
echo A senha est  incorreta.
pause
color 07
cls
attrib +h "usuarios\%nome%\config\senha.bat"
goto Login1
)
goto Continue

:Continue
if exist "usuarios\%nome%\config\backup_aut.txt" call "arq_sis\backup.bat"
echo set nome=%nome%>>"arq_sis\temp\config_ger.bat"
if "%tamanho%" EQU "0" (
echo set tamanho=100,20>>"arq_sis\temp\config_ger.bat"
) ELSE (
echo set tamanho=%tamanho%>>"arq_sis\temp\config_ger.bat"
)
echo set cores=%cores%>>"arq_sis\temp\config_ger.bat"
if "%tamanho1%" EQU "0" (
echo set tamanho=100,20>>"arq_sis\temp\config_ger.bat"
) ELSE (
echo set tamanho1=%tamanho1%>>"arq_sis\temp\config_ger.bat"
)
echo.>>"arq_sis\temp\login_1.txt"
echo.>>"arq_sis\temp\config_normal.txt"
if exist "usuarios\%nome%\config\tis1.txt" start "novo" "arq_sis\agenda.bat"
if exist "usuarios\%nome%\config\tis2.txt" start "novo" "arq_sis\anotacoes.bat"
if exist "usuarios\%nome%\config\tis3.txt" start "novo" "arq_sis\backup.bat"
if exist "usuarios\%nome%\config\tis4.txt" start "novo" "arq_sis\configuracoes.bat"
if exist "usuarios\%nome%\config\tis5.txt" start "novo" "arq_sis\edit_texto.bat"
if exist "usuarios\%nome%\config\tis6.txt" start "novo" "arq_sis\geren_arq.bat"
if exist "usuarios\%nome%\config\anotacoes.bat" (
echo.>>"arq_sis\temp\anotacoes_nc.txt"
call "usuarios\%nome%\config\anotacoes.bat"
del /q "arq_sis\temp\anotacoes_nc.txt"
)
attrib -h "usuarios\%nome%\config\senha.bat"
call "arq_sis\menu.bat"

:ERRO
echo.
echo Houve um erro durante a execu‡Æo do programa.
echo Deseja reiniciar o Hor rio?
echo.
echo 1.Sim
echo 2.NÆo
echo.
set /p erro=Comando:
if "%erro%" EQU "1" goto Menu
if "%erro%" EQU "2" exit
cls
goto ERRO

:IniRap
if exist "arq_sis\temp\ini_rap.bat" (
call "arq_sis\temp\ini_rap.bat"
del /q "arq_sis\temp\ini_rap.bat"
call "usuarios\%nome%\config\nome.bat"
call "usuarios\%nome%\config\tamanho.bat"
if not exist "usuarios\%nome%\config\tamanho_1.bat" set tamanho1=0
if exist "usuarios\%nome%\config\tamanho_1.bat" call "usuarios\%nome%\config\tamanho_1.bat" 
call "usuarios\%nome%\config\cores.bat
if exist "arq_sis\temp\config_ger.bat" del /q "arq_sis\temp\config_ger.bat"
echo set nome=%nome%>>"arq_sis\temp\config_ger.bat"
echo set tamanho=%tamanho%>>"arq_sis\temp\config_ger.bat"
if "%tamanho1%" NEQ "0" echo set tamanho1=%tamanho1%>>"arq_sis\temp\config_ger.bat"
echo set cores=%cores%>>"arq_sis\temp\config_ger.bat"
)
if exist "arq_sis\temp\ini_config.txt" (
del /q "arq_sis\temp\ini_config.txt"
call "arq_sis\configuracoes.bat"
)
if exist "arq_sis\temp\ini_agenda.txt" (
del /q "arq_sis\temp\ini_agenda.txt"
call "arq_sis\agenda.bat"
)
if exist "arq_sis\temp\ini_anotacoes.txt" (
del /q "arq_sis\temp\ini_anotacoes.txt"
call "arq_sis\anotacoes.bat"
)
if exist "arq_sis\temp\ini_backup.txt" (
del /q "arq_sis\temp\ini_backup.txt"
call "arq_sis\backup.bat"
)
if exist "arq_sis\temp\ini_texto.txt" (
del /q "arq_sis\temp\ini_texto.txt"
call "arq_sis\edit_texto.bat"
)
if exist "arq_sis\temp\ini_geren_arq.txt" (
del /q "arq_sis\temp\ini_geren_arq.txt"
call "arq_sis\geren_arq.bat"
)
if exist "arq_sis\temp\ini_menu.txt" (
del /q "arq_sis\temp\ini_menu.txt"
call "arq_sis\menu.bat"
)
if exist "arq_sis\temp\ini_mcjt1.txt" (
call "arq_sis\configuracoes.bat"
)
if exist "arq_sis\temp\ini_mcjt2.txt" (
call "arq_sis\configuracoes.bat"
)