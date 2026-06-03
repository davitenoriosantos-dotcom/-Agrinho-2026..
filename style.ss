using System;
using System.Threading.Tasks;

namespace AgroSustentavel2026.Controllers
{
    // Modelo de requisição recebida pelo JavaScript
    public class ComandoPainel
    {
        public string TipoComando { get; set; }
        public bool Ativar { get; set; }
        public string ParametroAdicional { get; set; }
    }

    public class AgroDashboardController
    {
        private double NivelAguaReservatorio = 88.0;
        private double UmidadeSolo = 52.0;

        // POST api/agro/processar-comando
        public async Task<object> ProcessarComandoDoUsuario(ComandoPainel comando)
        {
            Console.WriteLine($"[C# API] Comando recebido da página Web: {comando.TipoComando}");

            switch (comando.TipoComando.ToLower())
            {
                case "irrigacao":
                    // Regra de negócio: Se o reservatório estiver muito baixo, não irriga
                    if (NivelAguaReservatorio < 15.0)
                    {
                        return new { Status = "Erro", Mensagem = "Água insuficiente no reservatório para manter a sustentabilidade." };
                    }
                    
                    // Simula a alteração física nos sensores
                    UmidadeSolo += 20.0;
                    NivelAguaReservatorio -= 6.0;

                    await Task.Delay(200); // Simula o tempo de resposta de hardware IoT
                    return new { 
                        Status = "Sucesso", 
                        NovaUmidade = UmidadeSolo, 
                        NovoNivelAgua = NivelAguaReservatorio,
                        Mensagem = "Válvulas de gotejamento ativadas via C# com sucesso." 
                    };

                case "drone":
                    // Integração fictícia com serviço de IA de reconhecimento de imagem
                    string statusVerificacaoIA = "Análise concluída: 100% da área foliar saudável.";
                    return new { Status = "Sucesso", DetalhesDrone = statusVerificacaoIA };

                case "alerta_praga":
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("[ALERTA CRÍTICO] Script C# detectou anomalia. Disparando contra-medidas biológicas.");
                    Console.ResetColor();
                    return new { Status = "AlertaProcessado", Acao = "Drones de controle biológico acionados." };

                default:
                    return new { Status = "Desconhecido", Mensagem = "Comando não implementado." };
            }
        }
    }
}
