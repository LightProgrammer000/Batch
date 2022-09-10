@echo off
cls
 
:: Dimensao de Tela
mode 40,15
 
:: Rotulo
:menu
    
    :: Tela Inicial
    cls
    color B
    title Menu
 
    echo.
    echo ----------------
    echo *     MENU     *
    echo ----------------
    echo.
    echo [1] Calculadora
    echo [2] Tarefas
    echo [3] Bloco de Notas
    echo [4] Worpad
    echo [5] Paint
    echo [6] Internet Explorer
    echo.
 
    :: Entrada de Dados
    set /p esc=Opcao: 
 
    ::::::::::::::::::::::::::
    :: Estrutura de Excecao ::
    ::::::::::::::::::::::::::
 
    :: Caso (leq): <= 0
    if %esc% leq 0 ( 
    
        :: Retorno
        goto menu 
    )
 
    :: Caso(geq): >= 7
    if %esc% geq 7 ( 
        
        :: Retorno
        goto menu 
    )
 
    ::::::::::::::::::::::::::
    :: Estrutura de Decisao ::
    ::::::::::::::::::::::::::
    
    :: Caso: Calculadora
    if %esc% == 1 (
    
        :: Execucao
        start calc.exe
        
        :: Retorno
        goto menu 
    )
 
    :: Caso: Gerenciador de Tarefas
    if %esc% == 2 (
        
        :: Excecucao
        start taskmgr.exe
        
        :: Retorno
        goto menu 
    )
 
    :: Caso: Bloco de Notas
    if %esc% == 3 (
        
        :: Excecucao
        start notepad.exe
        
        :: Retorno
        goto menu
    )
 
    :: Caso: Worpad
    if %esc% == 4 (
        
        :: Execucao
        start write
        
        :: Retorno
        goto menu
    )
 
    :: Caso: Paint
    if %esc% == 5 (
        
        :: Excecucao
        start mspaint.exe
        
        :: Retorno
        goto menu
    )
 
    :: Caso: Internet Explorer
    if %esc% == 6 ( 
        
        :: Execucao
        start iexplore.exe www.google.com.br 
        
        :: Retorno
        goto menu 
    )
