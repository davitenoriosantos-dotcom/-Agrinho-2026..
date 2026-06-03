document.addEventListener("DOMContentLoaded", () => {
    // Elementos da tela
    const valUmidade = document.getElementById("val-umidade");
    const valTemp = document.getElementById("val-temp");
    const valAgua = document.getElementById("val-agua");
    const statusUmidade = document.getElementById("status-umidade");
    const sistemaStatus = document.getElementById("sistema-status");
    const logConsole = document.getElementById("log-console");

    // Botões
    const btnIrrigacao = document.getElementById("btn-irrigacao");
    const btnDrone = document.getElementById("btn-drone");
    const btnModo = document.getElementById("btn-modo");
    const btnAlerta = document.getElementById("btn-alerta");

    // Função auxiliar para adicionar logs na tela
    function registrarLog(mensagem) {
        const hora = new DateTime().toLocaleTimeString('pt-BR'); // Simulação de formato de hora
        const timestamp = new Date().toLocaleTimeString();
        logConsole.innerHTML += `<br>[${timestamp}] ${mensagem}`;
        logConsole.scrollTop = logConsole.scrollHeight; // Rola o log para baixo automaticamente
    }

    // Interação 1: Irrigação por Microgotejamento
    btnIrrigacao.addEventListener("click", () => {
        registrarLog("Enviando requisição POST para PostarIrrigacao() no script.cs...");
        btnIrrigacao.disabled = true;

        setTimeout(() => {
            valUmidade.innerText = "72";
            valAgua.innerText = "82";
            statusUmidade.innerText = "Solo Altamente Hidratado";
            statusUmidade.style.color = "var(--primary)";
            registrarLog("Resposta C#: Status 200 OK. Irrigadores ativados. Umidade subiu para 72%. Água consumida de forma consciente.");
            btnIrrigacao.disabled = false;
        }, 1200);
    });

    // Interação 2: Controle do Drone de Imagem Computacional
    btnDrone.addEventListener("click", () => {
        registrarLog("Comando enviado: Drone decolando para varredura aérea...");
        btnDrone.disabled = true;

        setTimeout(() => {
            registrarLog("Resposta C#: Drone em órbita. Imagens térmicas processadas. Nenhuma anomalia térmica detectada na plantação.");
            btnDrone.disabled = false;
        }, 1500);
    });

    // Interação 3: Alternar Modos Ecológicos
    let modoEco = true;
    btnModo.addEventListener("click", () => {
        modoEco = !modoEco;
        if (!modoEco) {
            btnModo.innerText = "Alternar Modo: Máxima Produção";
            sistemaStatus.innerText = "Modo Alta Performance";
            sistemaStatus.style.backgroundColor = "#fff3e0";
            sistemaStatus.style.color = "#ef6c00";
            registrarLog("Configuração atualizada via C#: Foco alterado para aceleração de colheita.");
        } else {
            btnModo.innerText = "Alternar Modo: Eco-Intensivo";
            sistemaStatus.innerText = "Sistema Online - Modo Sustentável";
            sistemaStatus.style.backgroundColor = "#e8f5e9";
            sistemaStatus.style.color = "var(--primary)";
            registrarLog("Configuração atualizada via C#: Foco alterado para conservação de recursos hídricos.");
        }
    });

    // Interação 4: Simulação de Crise (Alerta)
    btnAlerta.addEventListener("click", () => {
        registrarLog("⚠️ ALERTA ENVIADO: Simulação de foco de lagarta nas bordas do setor norte.");
        valTemp.innerText = "28.1";
        sistemaStatus.innerText = "⚠️ Alerta de Invasão Biológica";
        sistemaStatus.style.backgroundColor = "#ffebee";
        sistemaStatus.style.color = "var(--alert)";
        
        setTimeout(() => {
            registrarLog("C# Callback: Liberação imediata de defensivos biológicos (parasitoides naturais) programada para o setor afetado.");
        }, 1000);
    });

    // Ciclo de variação automática dos dados do tempo (Simulação de Sensores)
    setInterval(() => {
        let tempAtual = parseFloat(valTemp.innerText);
        let variacao = (Math.random() * 0.4 - 0.2); // Sobe ou desce um pouquinho
        valTemp.innerText = (tempAtual + variacao).toFixed(1);
    }, 4000);
});
