# TODO

## Modal “Novo atendimento” do CRM
- [x] Reorganizar visualmente o formulário do modal “Novo atendimento” com hierarquia clara, agrupamento lógico e melhor uso de espaçamento, seguindo a referência visual fornecida.
- [x] Preservar o cadastro e a seleção de paciente no fluxo existente, exigindo nova escolha quando o texto de busca for alterado após uma seleção.
- [x] Preservar a seleção de produto ou processo e sua categoria associada.
- [x] Preservar a definição de status do atendimento.
- [x] Preservar a configuração de doses ou sessões e as regras atuais do formulário.
- [x] Tornar o campo de observações mais confortável para textos maiores.
- [x] Garantir validação clara dos campos obrigatórios, mensagens contextualizadas e estados de foco consistentes.
- [x] Destacar as ações de cancelar e salvar sem alterar o comportamento atual de cadastro.
- [x] Garantir layout responsivo e acessível em desktop, tablet e celular, com rolagem adequada e controles confortáveis para toque.

## Faturamento com pagamento fracionado
- [x] Redefinir a tela de confirmação para permitir dividir o total entre uma ou mais formas de pagamento: Pix, débito, crédito e dinheiro.
- [x] Exibir o valor total alocado, o saldo restante e uma barra de progresso da composição.
- [x] Permitir adicionar, remover e editar pagamentos sem o botão “Usar restante”.
- [x] Exibir parcelamento de 1 a 12 vezes para pagamentos em crédito, com o resumo “x de R$ … sem juros”.
- [x] Bloquear a confirmação enquanto a soma dos pagamentos não corresponder exatamente ao total a pagar.
- [x] Manter o desconto de 5% apenas para uma forma Pix ou dinheiro e manter a criação existente de venda e recebível pendentes.
- [x] Adaptar o endpoint de faturamento para aceitar a composição dos pagamentos sem quebrar requisições antigas.
- [x] Exibir no ícone “Abrir resumo da cobrança” as formas, valores e parcelas usadas no faturamento, inclusive após a cobrança ser faturada.
- [x] Permitir informar e armazenar no banco a data individual de cada pagamento fracionado e exibi-la no resumo.
