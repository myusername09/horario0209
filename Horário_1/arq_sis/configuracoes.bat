@echo off
set menu=0
if exist "arq_sis\temp\novo_usuario_config.txt" (
del /q "arq_sis\temp\novo_usuario_config.txt"
goto GU
)
echo. >>"C:\Windows\horario_teste.txt"
if exist "C:\Windows\horario_teste.txt" (
if not exist "arq_sis\temp\config_normal.txt" goto IJW
del /q "C:\Windows\horario_teste.txt"
)
:Menu
if not exist "arq_sis\temp\config_ger.bat" (
echo set nome=%nome%>>"arq_sis\temp\ini_rap.bat"
echo.>>"arq_sis\temp\ini_config.txt"
call "iniciar.bat"
)
if exist "arq_sis\temp\config_ger.bat" call "arq_sis\temp\config_ger.bat"
if exist "arq_sis\temp\config_agenda.txt" goto config_agenda
if exist "arq_sis\temp\ini_config.txt" del /q "arq_sis\temp\ini_config.txt"
title Configura‡äes
cls
if "%tamanho1%" EQU "0" (
mode %tamanho%
) ELSE (
mode %tamanho1%
)
color %cores%
if exist "arq_sis\temp\ini_config_mcjt1.txt" (
del /q "arq_sis\temp\ini_config_mcjt1.txt"
call "arq_sis\temp\config_ger.bat"
goto MCJT1
)
if exist "arq_sis\temp\ini_config_mcjt2.txt" (
del /q "arq_sis\temp\ini_config_mcjt2.txt"
call "arq_sis\temp\config_ger.bat"
goto MCJT2
)
if "%nome%" EQU "0" set nome=Usu rio_Fantasma
echo.
echo Usu rio atual:%nome%
echo.
echo 1.Configura‡äes de backup \ 2.Personalizar usu rio \ 3.Tarefas de inicializa‡Æo \ 4.Reparar Hor rio
echo 5.Gerenciar usu rios \ 6.Limpar pasta Temp \ 7.Formatar Hor rio \ 8.Comportamento de Janelas 
echo 9.Iniciar junto com o Windows \ 10.Modificar atalhos do Menu \ 11.Sobre
echo.
set /p menu=Comando:
if "%menu%" EQU "1" goto ADBA
if "%menu%" EQU "2" goto PU
if "%menu%" EQU "3" goto TIS
if "%menu%" EQU "4" goto RH
if "%menu%" EQU "5" goto GU
if "%menu%" EQU "6" goto LMT
if "%menu%" EQU "7" goto FH
if "%menu%" EQU "8" goto MCJ
if "%menu%" EQU "9" goto IJW
if "%menu%" EQU "10" goto MATM
if "%menu%" EQU "11" goto Sobre
goto Menu

:ADBA
echo.>>"arq_sis\temp\backup_config.txt"
call "arq_sis\backup.bat"
goto Menu

:PU
title Personalizar usu rio
cls
echo.
echo Ol , %nome%.
echo O que vocˆ deseja alterar no usu rio?
echo.
echo 1.Nome \ 2.Senha \ 3.Esquema de cores \ 4.Voltar
echo.
set /p pu=Comando:
if "%pu%" EQU "1" goto PUA
if "%pu%" EQU "2" goto PUS
if "%pu%" EQU "3" goto EC
if "%pu%" EQU "4" goto Menu
goto PU

:PUA
title Alterar nome de usu rio
cls
echo.
echo Digite o nome que ser  definido ao usu rio.
echo.
set /p pua=Nome:
del /q "usuarios\%nome%\config\nome.bat"
echo set nome=%pua%>>"usuarios\%nome%\config\nome.bat"
ren "usuarios\%nome%" "%pua%"
start "novo" "iniciar.bat"
exit

:PUS
title Alterar senha de usu rio
cls
echo.
echo Digite a senha que ser  definida ao usu rio.
echo.
set /p pus=Senha:
del /q "usuarios\%nome%\config\senha.bat"
echo set senha=%pus%>>"usuarios\%nome%\config\senha.bat"
start "novo" "iniciar.bat"
exit

:EC
title Alterar esquema de cores
cls
echo.
echo Digite o esquema de cores que ser  definido ao usu rio.
echo.
echo 0 = Preto        8 = Cinza
echo 1 = Azul         9 = Azul claro
echo 2 = Verde        A = Verde claro
echo 3 = Verde- gua   B = Verde- gua claro
echo 4 = Vermelho     C = Vermelho claro
echo 5 = Roxo         D = Lil s
echo 6 = Amarelo      E = Amarelo claro
echo 7 = Branco       F = Branco brilhante
echo.
set /p ec=Esquema de cores:
del /q "usuarios\%nome%\config\cores.bat"
echo set cores=%ec%>>"usuarios\%nome%\config\cores.bat"
pause
start "novo" "iniciar.bat"
exit

:TIS
title Tarefas iniciadas com o sistema
cls
echo.
echo 1.Agenda \ 2.Anota‡äes \ 3.Backup \ 4.Configura‡äes
echo 5.Editor de texto \ 6.Gerenciador de arquivos \ 7.Voltar
echo.
echo OBS
echo.
echo 1.Algumas fun‡äes, mesmo que desabilitadas por aqui, sÆo carregadas pelo sistema.
echo 2.Evite iniciar muitas tarefas ao mesmo tempo.
echo.
set /p tis=Comando:
if "%tis%" EQU "1" goto TIS1
if "%tis%" EQU "2" goto TIS1
if "%tis%" EQU "3" goto TIS1
if "%tis%" EQU "4" goto TIS1
if "%tis%" EQU "5" goto TIS1
if "%tis%" EQU "6" goto TIS1
if "%tis%" EQU "7" goto Menu
goto TIS

:TIS1
cls
echo.
echo 1.Ativar \ 2.Desativar \ 3.Voltar
echo.
set /p tis1=Comando:
if "%tis1%" EQU "1" goto TIS1A
if "%tis1%" EQU "2" goto TIS1D
if "%tis1%" EQU "3" goto TIS
goto TIS1

:TIS1A
if not exist "usuarios\%nome%\config\tis%tis%.txt" (
echo.>>"usuarios\%nome%\config\tis%tis%.txt"
echo.
echo Feito.
pause
goto TIS
)
if exist "usuarios\%nome%\config\tis%tis%.txt" (
title ERRO
echo.
echo O programa j  est  habilitado para inicializa‡Æo.
pause
goto TIS
)

:TIS1D
if exist "usuarios\%nome%\config\tis%tis%.txt" (
del /q "usuarios\%nome%\config\tis%tis%.txt"
echo.
echo Feito.
pause
goto TIS
)
if not exist "usuarios\%nome%\config\tis%tis%.txt" (
title ERRO
echo.
echo O recurso nÆo estava habilitado na inicializa‡Æo.
pause
goto TIS
)

:RH
title Reparar Hor rio
cls
echo.
echo Como vocˆ quer reparar o programa?
echo.
echo 1.M¡dia externa \ 2.Backup \ 3.Cancelar
echo.
set /p rh=Comando:
if "%rh%" EQU "1" goto ME
if "%rh%" EQU "2" goto RHB
if "%rh%" EQU "3" goto Menu
goto RH

:GU
title Gerenciar usu rios
if not exist "arq_sis\temp\config_ger.bat" (
echo. >>"arq_sis\temp\ini_rap.txt"
echo. >>"arq_sis\temp\ini_config.txt"
call "iniciar.bat"
)
if exist "arq_sis\temp\config_ger.bat" call "arq_sis\temp\config_ger.bat"
color %cores%
if "%tamanho1%" EQU "0" (
mode %tamanho%
) ELSE (
mode %tamanho1%
)
cls
echo.
dir "usuarios\"
echo.
echo 1.Adicionar \ 2.Importar \ 3.Cancelar
echo.
set /p gu=Comando:
if "%gu%" EQU "1" (
echo.>>"arq_sis\temp\novo_usuario_config.txt"
call "arq_sis\novo_usuario.bat"
goto GU
)
if "%gu%" EQU "2" goto GUI
if "%gu%" EQU "3" goto Menu
if not exist "usuarios\%gu%" (
title ERRO
color C0
echo.
echo Este usu rio nÆo existe.
pause
goto GU
)
goto GU1

:GU1
title Gerenciar %gu%
cls
echo.
echo O que vocˆ deseja fazer com o usu rio %gu%?
echo.
echo 1.Formatar \ 2.Excluir \ 3.Exportar \ 4.Cancelar
echo.
set /p gu1=Comando:
if "%gu1%" EQU "1" (
rd /s /q "usuarios\%gu%\agenda"
rd /s /q "usuarios\%gu%\anotacoes"
rd /s /q "usuarios\%gu%\documentos"
rd /s /q "usuarios\%gu%\imagens"
rd /s /q "usuarios\%gu%\musicas"
rd /s /q "usuarios\%gu%\videos"
md "usuarios\%gu%\agenda"
md "usuarios\%gu%\anotacoes"
md "usuarios\%gu%\documentos"
md "usuarios\%gu%\imagens"
md "usuarios\%gu%\musicas"
md "usuarios\%gu%\videos"
echo.
echo Feito.
pause
goto GU1
)
if "%gu1%" EQU "2" (
rd /s /q "usuarios\%gu%"
echo.
echo Feito.
pause
goto GU
)
if "%gu1%" EQU "3" goto GUE
if "%gu1%" EQU "4" goto Menu

:LPT
rd /s /q "arq_sis\temp"
md "arq_sis\temp"
echo.>>"arq_sis\temp\ini_rap.txt"
echo.>>"arq_sis\temp\ini_config.txt"
echo.
echo Feito.
call "iniciar.bat"

:FH
title Formatar Hor rio
cls
echo.
echo Ao continuar o programa ir  excluir todos os usu rios do computador.
echo.
echo 1.Continuar \ 2.Cancelar
echo.
set /p fh=Comando:
if "%fh%" EQU "1" goto FH1
if "%fh%" EQU "2" goto Menu
goto FH

:FH1
rd /s /q "arq_sis\temp\*.txt"
rd /s /q "arq_sis\temp\*.bat"
rd /s /q "usuarios"
echo.
echo Feito.
echo Ser  necess rio reiniciar o programa.
pause
start "novo" "iniciar.bat"
exit

:MCJ
title Modificar comportamento das janelas
cls
echo.
echo Note que algumas partes do programa nÆo possuem tamanho espec¡fico, para melhor funcionamento.
echo.
if exist "usuarios\%nome%\config\tamanho_1.bat" (
echo 1.Desativar janelas adapt veis \ 2.Modificar tamanho \ 3.Cancelar
) ELSE (
echo 1.Ativar janelas adapt veis \ 2.Modificar tamanho \ 3.Cancelar
)
echo.
set /p mcj=Comando:
if "%mcj%" EQU "1" (
if not exist "usuarios\%nome%\config\tamanho_1.bat" goto MCJ1
if exist "usuarios\%nome%\config\tamanho_1.bat" del /q "usuarios\%nome%\config\tamanho_1.bat"
)
if "%mcj%" EQU "2" goto MCJT
if "%mcj%" EQU "3" goto Menu
goto MCJ

:MCJ1
cls
echo.
echo Digite o tamanho das janelas menores.
echo OBS:o valor da janela principal nÆo ser  alterado.
echo.
set /p mcj1=Tamanho:
echo set tamanho1=%mcj1%>>"usuarios\%nome%\config\tamanho_1.bat"
echo.
echo Feito.
pause
goto MCJ

:IJW
title Iniciar junto com o Windows
if exist "arq_sis\temp\config_normal.txt" goto IJW1
cls
mode 100,20
echo.
if exist "%programdata%\Microsoft\Windows\Start Menu\Programs\Startup\horario.bat" (
echo O recurso est  ativado.
) ELSE (
echo O recurso nÆo est  ativado.
)
echo.
if not exist "%programdata%\Microsoft\Windows\Start Menu\Programs\Startup\horario.bat" (
echo 1.Ativar \ 2.Sair
) ELSE (
echo 1.Desativar \ 2.Sair
)
echo.
set /p ijw=Comando:
if not exist "%programdata%\Microsoft\Windows\Start Menu\Programs\Startup\horario.bat" (
if "%ijw%" EQU "1" goto IJW2
if "%ijw%" EQU "2" goto IJWS
)
if exist "%programdata%\Microsoft\Windows\Start Menu\Programs\Startup\horario.bat" (
if "%ijw%" EQU "1" goto IJW3
if "%ijw%" EQU "2" goto IJWS
)
goto IJW

:IJW1
cls
echo.
echo Para continuar vocˆ precisa executar o arquivo de configura‡äes como administrador.
echo O arquivo est  nomeado como "configuracoes.bat".
start "novo" "arq_sis"
pause
goto Menu

:IJW2
color %cores%
cls
echo.
echo Digite o local onde o programa Hor rio est  localizado.
echo Para cancelar digite 1.
echo OBS:NÇO MUDE O LOCAL DOS ARQUIVOS.
echo.
set /p ijw2=Local:
if "%ijw2%" EQU "1" goto Menu
if not exist "%ijw2%\arq_sis\verificar.bat" (
title ERRO
color C0
echo.
echo Local inv lido.
pause
goto IJW2
)
echo cd "%ijw2%">>"%programdata%\Microsoft\Windows\Start Menu\Programs\Startup\horario.bat"
echo start "novo" "%ijw2%\iniciar.bat">>"%programdata%\Microsoft\Windows\Start Menu\Programs\Startup\horario.bat"
del /q "C:\Windows\horario_teste.txt"
echo.
echo Feito.
pause
exit

:Sobre
title Sobre
cls
echo.
echo í í  íí  ííí    í ííí í  íí
echo í í í  í í í  íí  í í í í  í
echo ííí í  í íí  í  í íí  í í  í
echo í í í  í í í íííí í í í í  í
echo í í  íí  í í í  í í í í  íí
echo.
echo ver 0.1_alpha
echo Desenvolvedor:Abner Carvalho Costa
echo Data de finaliza‡Æo:24/03/2019
if "%nome%" EQU "Usu rio_Fantasma" echo Quem ‚ vocˆ!?
echo Usu rio:%username%
echo Computador:%computername%
echo.
pause
goto Menu

:ME
title Reparo por m¡dia externa
color %cores%
cls
echo.
echo Digite o local onde est  localizada a m¡dia de reparo.
echo Para voltar digite 1.
echo.
set /p me=Local:
echo.
echo Digite o local onde est  localizada esta c¢pia do programa.
echo.
set /p me1=Local:
if not exist "%me%\arq_sis\verificar.bat" (
title ERRO
color C0
echo.
echo O local digitado nÆo ‚ v lido.
pause
goto ME
) ELSE (
echo set local=%me1%>>"%me%\arq_sis\temp\verificar_reparo.bat"
echo set reparo=%me%>>"%me%\arq_sis\temp\verificar_reparo.bat"
if exist "%me%\arq_sis\verificar.bat" call "%me%\arq_sis\verificar.bat"
pause
goto ME
)

:RHB
title Reparo por backup
cls
echo.
if not exist "usuarios\%nome%\documentos\Backup" (
title ERRO
color C0
echo.
echo Nenhum backup foi encontrado.
pause
goto RH
)
echo.
echo Qual dos backups abaixo vocˆ deseja restaurar?
echo Digite 1 para voltar.
echo.
set /p rhb=Local:
if "%rhb%" EQU "1" goto RH
if not exist "usuarios\%nome%\documentos\%rhb%\descricao.bat" (
title ERRO
color C0
echo.
echo O local digitado ‚ inv lido.
pause
goto RHB
)

:RHB1
title Descri‡Æo do backup
cls
echo.
call "usuarios\%nome%\documentos\%rhb%\descricao.bat"
echo.
echo Continuar com o backup?
echo.
echo 1.Sim \ 2.NÆo
echo.
set /p rhb1=Comando:
if "%rhb1%" EQU "1" goto RHB2
if "%rhb1%" EQU "2" goto RHB
goto RHB1

:RHB2
xcopy /y /h /e /i "usuarios\%nome%\documentos\Backup\arq_sis" "arq_sis"
xcopy /y /h /e /i "usuarios\%nome%\documentos\Backup\usuarios" "usuarios"
xcopy /y /h /e /i "usuarios\%nome%\documentos\Backup\iniciar.bat" "iniciar.bat"
echo.
echo Feito.
pause
exit

:IJWS
del /q "C:\Windows\horario_teste.txt"
exit

:IJW3
del /s /q "%programdata%\Microsoft\Windows\Start Menu\Programs\Startup\horario.bat"
echo.
echo Feito.
pause
goto IJW

:LMT
title Limpar pasta temp
cls
echo.
echo Limpar a pasta "arq_sis\temp" pode resolver alguns problemas do Hor rio.
echo.
echo 1.Continuar \ 2.Voltar
echo.
set /p lmt=Comando:
if "%lmt%" EQU "1" (
del /q "arq_sis\temp\*.bat"
del /q "arq_sis\temp\*.txt"
echo.
echo Feito.
pause
goto LMT
)
if "%lmt%" EQU "2" goto Menu
goto Menu

:MCJT
title Modificar tamanho
cls
echo.
echo 1.Menu \ 2.Janelas \ 3.Cancelar
echo.
set /p mcjt=Comando:
if "%mcjt%" EQU "1" goto MCJT1
if "%mcjt%" EQU "2" goto MCJT2
if "%mcjt%" EQU "3" goto Menu
goto MCJT

:MCJT1
echo.
echo Digite o valor que ser  atribuido ao tamanho do Menu.
echo OBS:NÆo ‚ recomendado colocar o valor abaixo de 100,20.
echo Para voltar, digite 1.
echo.
set /p mcjt1=Tamanho:
if "%mcjt1%" EQU "1" (
if exist "arq_sis\temp\ini_config_mcjt1.txt" del /q "arq_sis\temp\ini_config_mcjt1.txt"
if exist "arq_sis\temp\ini_rap.bat" del /q "arq_sis\temp\ini_rap.bat"
goto MCJT
)
if exist "arq_sis\temp\config_ger.bat" del /q "arq_sis\temp\config_ger.bat"
if exist "usuarios\%nome%\config\tamanho.bat" del /q "usuarios\%nome%\config\tamanho.bat"
echo set tamanho=%mcjt1%>>"usuarios\%nome%\config\tamanho.bat"
echo set nome=%nome%>>"arq_sis\temp\ini_rap.bat"
echo.>>"arq_sis\temp\ini_config_mcjt1.txt"
echo.
echo Feito.
pause
call "iniciar.bat"
cls
goto MCJT1

:MCJT2
echo.
echo Digite o valor que ser  atribuido ao tamanho das janelas.
echo OBS:NÆo ‚ recomendado colocar o valor abaixo de 100,20.
echo Para voltar, digite 1.
echo.
set /p mcjt2=Tamanho:
if "%mcjt2%" EQU "1" (
if exist "arq_sis\temp\ini_config_mcjt2.txt" del /q "arq_sis\temp\ini_config_mcjt2.txt"
if exist "arq_sis\temp\ini_rap.bat" del /q "arq_sis\temp\ini_rap.bat"
goto MCJT
)
if exist "arq_sis\temp\config_ger.bat" del /q "arq_sis\temp\config_ger.bat"
if exist "usuarios\%nome%\config\tamanho.bat" del /q "usuarios\%nome%\config\tamanho_1.bat"
echo set tamanho1=%mcjt2%>>"usuarios\%nome%\config\tamanho_1.bat"
echo set nome=%nome%>>"arq_sis\temp\ini_rap.bat"
echo.>>"arq_sis\temp\ini_config_mcjt2.txt"
echo.
echo Feito.
pause
call "iniciar.bat"
cls
goto MCJT2

:GUE
title Exportar usu rio
echo.
echo Digite o local onde o usu rio ser  copiado.
echo Para voltar ao menu, digite 1.
echo.
set /p gue=Local:
if "%gue%" EQU "1" goto GU1
goto GUE1

:GUE1E
title ERRO
color C0
cls
echo.
echo O local digitado ‚ inv lido.
pause
goto GUE

:GUE1
if "%gue1%" NEQ "0" set gue1=1
if not exist "%gue%" (
if "%gue1%" EQU "0" goto GUE1E
md "%gue%"
set gue1=0
goto GUE1
)
title Confirmar exporta‡Æo de usu rio
cls
echo.
echo Local onde ser  c¢piado:%gue%
echo Usu rio:%gu%
echo.
echo 1.Continuar \ 2.Cancelar
echo.
set /p gue2=Comando:
if "%gue2%" EQU "1" (
if not exist "%gue%\%gu%" md "%gue%\%gu%"
xcopy /y /h /e /i /q "usuarios\%gu%" "%gue%\%gu%"
echo set importar=%gu%>>"%gue%\%gu%\config\usuario_exportado.bat"
echo.
echo Feito.
pause
goto GUE
)
if "%gue2%" EQU "2" (
if "%gue1%" EQU "0" rd /s /q "%gue%"
goto GU1
)

:GUI
title Importar usu rio
set gui=0
cls
echo.
echo Digite o local onde o usu rio est  armazenado.
echo Ex:%userprofile%\Desktop\user_name
echo.
echo Para voltar, digite 1.
echo.
set /p gui=Local:
if not exist "%gui%\config\usuario_exportado.bat" (
if "%gui%" EQU "1" goto Menu
title ERRO
color C0
echo.
echo Local inv lido.
pause
goto GUI
)
call "%gui%\config\usuario_exportado.bat"
md "usuarios\%importar%"
xcopy /y /h /e /i /g /q "%gui%" "usuarios\%importar%"
del /q "usuarios\%importar%\config\usuario_exportado.bat"
echo.
echo Feito.
REM Eu queria fazer um negócio mais legal, mas por algum motivo o FDP do Windows não cópia os arquivos direito.
REM Tudo estava certo. MAS NÃÃÃOO...
pause
goto GU

:MATM
call "arq_sis\atalhos.bat"
goto Menu