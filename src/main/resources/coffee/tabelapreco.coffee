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



class App.ModuloTabelaPreco extends App.Modulo
  constructor: (@lista) ->
    super(@lista, 'TabelaPreco', 'tabelasprecos', 'nome')
    
  criarPaginaEdicao: ->
    new App.FormEdicaoTabelaPreco(this)
  criarPaginaCriacao: ->
    new App.FormCriacaoTabelaPreco(this)
  
 
           
    
    