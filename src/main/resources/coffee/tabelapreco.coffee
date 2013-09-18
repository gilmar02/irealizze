class App.FormEdicaoTabelaPreco extends App.PaginaEdicao
  constructor: (@modulo) ->
    super(@modulo)
    
      
  desenharConteudoForm: (jsonObj) ->
    divNome = $('<div data-role="fieldcontain">')
    @form.append divNome    
    labelNome = $('<label for="nome">Nome</label>')        
    @inputNome = $('<input name="nome" id="nome" placeholder="" value="' + jsonObj.nome + '" type="text">')
                
    divNome.append labelNome
    divNome.append @inputNome
    
    divPrecos = $('<div data-role="fieldcontain">')
    @form.append divPrecos    
    labelPrecos = $('<label for="precos">Preço</label>')        
    @inputPrecos = $('<input precos="precos" id="precos" placeholder="" value="' + jsonObj.precos + '" type="numbers">')
                
    divPrecos.append labelPrecos
    divPrecos.append @inputPrecos

    montarJSON: ->
    "{ 'nome': '#{@inputNome.val()}' , 'precos': '#{@inputPrecos.val()}' }"         
    
class App.FormCriacaoTabelaPreco extends App.PaginaCriacao
  constructor: (@modulo) ->
    super(@modulo)
    
  desenharConteudoForm: () ->
    divNome = $('<div data-role="fieldcontain">')
    @form.append divNome    
    labelNome = $('<label for="nome">Nome</label>')        
    @inputNome = $('<input name="nome" id="nome" placeholder="" value="" type="text">')
                
    divNome.append labelNome
    divNome.append @inputNome
    
    divPrecos = $('<div data-role="fieldcontain">')
    @form.append divPrecos   
    labelPrecos = $('<label for="precos">Preço</label>')        
    @inputPrecos = $('<input name="precos" id="precos" placeholder="" value="" type="numbers">')
                
    divPrecos.append labelPrecos
    divPrecos.append @inputPrecos

   montarJSON: ->
    "{ 'nome': '#{@inputNome.val()}' , 'precos': '#{@inputPrecos.val() }'}"                


class App.PaginaDetalhesTabelaPreco extends App.PaginaDetalhes
  constructor:(@modulo)->
    super(@modulo)
  
  carregar: (registro) ->
    @titulo.html "#{registro[@modulo.propriedade]}"
    
    grid = $('<div class="ui-grid-a">')
    @content.append grid
    
    $.getJSON 'itens', (jsonObj) =>
      $.each jsonObj, (i, item) =>
        nomeitem = $('<div class="ui-block-a">' + item.nome + '</div>')
        grid.append nomeitem
        
        divsegcol=$('<div class="ui-block-b">')
        grid.append divsegcol
               
        divprecoitem = $('<div data-role="fieldcontain">')
        divsegcol.append divprecoitem
        
        inputprecoitem = $('<input name="" id="textinput1" placeholder="" value="" type="number" data-mini="true">')
        divprecoitem.append inputprecoitem
        
        inputprecoitem.change =>
          alert( "PUT/" + item.id + ": " + inputprecoitem.val() );        
        
    @content.trigger("create")
    

class App.ModuloTabelaPreco extends App.Modulo
  constructor: () ->
    super('TabelaPreco', 'tabelasprecos', 'nome')
    
  criarPaginaEdicao: ->
    new App.FormEdicaoTabelaPreco(this)
 
  criarPaginaCriacao: ->
    new App.FormCriacaoTabelaPreco(this)
  
   criarPaginaDetalhes: ->
    new App.PaginaDetalhesTabelaPreco(this)
           
    
    