@echo off
 
 
:: Rotulo: Menu
:menu
 
    :: Dimensao de Tela
    cls
    mode 90,30
 
    :: Configuracoes Iniciais
 
    echo -----------------------------
    echo = Usuario: %username%
    echo = Computador: %computername%
    echo = Data: %date:/=-%
    echo = Hora:%time:~0,-6%
    echo -----------------------------
    echo.
 
    :: Tela Inicial
    color B
    echo ----------------
    echo *     MENU     *
    echo ----------------
    echo.
    echo [1] Servicos
    echo [2] Inicializacao
    echo [3] Bloco de Notas
    echo [4] Painel de Controle
    echo [5] Limpeza do Sistema
    echo [6] Escanear Disco Local
    echo [7] Gerenciador de Tarefas
    echo [8] Politica de Grupo Local(gpedit)
    echo [9] Saida
    echo.
 
    :: Escolha
    choice /c "123456789" /n /m "Opcao: "
    goto %errorlevel%
 
::::::::::::::::::: FUNCOES :::::::::::::::::::
 
:: Servicos
:1
    :: Funcao
    services.msc
 
    :: Retorno de Menu
    goto menu
 
:: Inicializacao
:2
    :: Funcao
    msconfig
    
    :: Retorno de Menu
    goto menu
    
:: Bloco de Notas
:3
    :: Funcao
    notepad.exe
    
    :: Retorno de Menu
    goto menu
    
:: Painel de Controle
:4
    :: Funcao
    control.exe
    
    :: Retorno de Menu
    goto menu
 
:: Limpeza do Sistema
:5
    :: Funcao
    cleanmgr
    
    :: Retorno de Menu
    goto menu
 
:: Escanear Disco Local
:6
    :: Tela Inicial
    cls
    color E
    echo ====================
    echo *     Scanning     *
    echo ====================
    
    :: Funcao
    chkdsk
    
    :: Retorno ao Menu
    goto menu
    
:: Gerenciador de Tarefas
:7
    :: Funcao
    taskmgr
    
    :: Retorno ao Menu
    goto menu
 
:: Politica de Grupo Local
:8
    :: Funcao
    gpedit.msc
    
    :: Retorno ao Menu
    goto menu
    
:: Saida
:9
    :: Mensagem
    msg /w * "O script sera encerrado !!"
    exit
