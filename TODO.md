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

## Pagamentos fracionados no módulo financeiro
- [x] Permitir cadastrar uma venda manual com uma ou mais formas de pagamento, valores individuais, datas individuais e parcelamento no crédito.
- [x] Validar no backend datas válidas, valores positivos, parcelamento somente no crédito e soma exata dos pagamentos contra o total líquido da venda.
- [x] Persistir a composição em `FinancialReceivable.paymentBreakdown`, mantendo compatibilidade com vendas antigas que usam `paymentMethod` e `installments`.
- [x] Exibir a composição das vendas e contas a receber nas listas de Financeiro, Vendas e Contas a pagar e receber.
- [x] Manter as baixas individuais de recebíveis e pagáveis integradas ao Caixa, com forma, data e conta financeira em cada movimentação.
- [x] Adicionar editor responsivo de pagamentos fracionados sem o botão “Usar restante”.
- [ ] Aplicar a migration `20261117183000_payment_breakdown` em um ambiente com `DATABASE_URL` configurada.

## Recebíveis fracionados e repasse
- [x] Gerar um recebível operacional por componente da venda: Pix de R$ 300,00 e crédito 2x como duas parcelas de R$ 100,00.
- [x] Permitir confirmar cada componente individualmente, vinculando a baixa ao recebível/parcela correto.
- [x] Mostrar no Caixa somente confirmações efetivadas no saldo e exibir componentes pendentes como “Previsto” e “Aguarda repasse”.
- [x] Exibir no Financeiro o faturado, o recebido, a receber, a composição por forma e as entradas previstas por data.
- [ ] Aplicar também a migration `20261118143000_receivable_payment_method` em um ambiente com `DATABASE_URL` configurada.

## Confirmação e repasse de crédito
- [x] Confirmar crédito sem criar imediatamente uma entrada no Caixa.
- [x] Permitir liquidar posteriormente o repasse de crédito por endpoint próprio, criando a entrada no Caixa somente nessa etapa.
- [x] Exibir o crédito confirmado como “Aguarda repasse” nas previsões do Caixa e do Financeiro.
- [x] Permitir estornar crédito confirmado antes do repasse sem criar saída de caixa; pagamentos já repassados geram estorno financeiro.
- [x] Manter taxas de adquirência sem percentual fixo no código, aguardando configuração definida pelo usuário.

## Rotina diária do Caixa
- [x] Registrar abertura e fechamento diários do caixa, identificar as sessões pela data e mostrar o valor de abertura, o valor esperado, o valor contado e a diferença no fechamento.

## Organização das listas financeiras
- [x] Organizar as listas de Vendas, Financeiro e Contas a pagar e receber por data e paciente/pessoa, com opções explícitas de ordenação e pesquisa que considere data e paciente/pessoa.

## Parcelamento do saldo em pagamentos mistos
- [x] Ao informar valores independentes por forma de pagamento, permitir parcelar os pagamentos seguintes no crédito sobre o valor restante.
