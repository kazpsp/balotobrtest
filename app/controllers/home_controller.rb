class HomeController < ApplicationController
  def index
    #banco=params[:banco].to_sym

    @boleto = Brcobranca::Boleto::BancoBrasil.new

    @boleto.cedente = "Kivanio Barbosa"
    @boleto.documento_cedente = "12345678912"
    @boleto.sacado = "Claudio Pozzebom"
    @boleto.sacado_documento = "12345678900"
    @boleto.valor = 11135.00
    @boleto.agencia = "4042"
    @boleto.conta_corrente = "61900"

    @boleto.convenio = "1238798"
    @boleto.numero_documento = "7777700168"

    @boleto.dias_vencimento = 5
    @boleto.data_documento = "2008-02-01".to_date
    @boleto.instrucao1 = "Pagavel na rede bancaria ate a data de vencimento."
    @boleto.instrucao2 = "Juros de mora de 2.0% mensal(R$ 0,09 ao dia)"
    @boleto.instrucao3 = "DESCONTO DE R$ 29,50 APOS 05/11/2006 ATE 15/11/2006"
    @boleto.instrucao4 = "NaO RECEBER APoS 15/11/2006"
    @boleto.instrucao5 = "Apos vencimento pagavel somente nas agencias do Banco do Brasil"
    @boleto.instrucao6 = "ACRESCER R$ 4,00 REFERENTE AO BOLETO BANCARIO"
    @boleto.sacado_endereco = "Av. Rubens de Mendonca, 157 - 78008-000 - Cuiaba/MT"

    # formato.inspect

    send_data @boleto.to(:pdf), :filename => "bolet2o.pdf"   
  end
end
