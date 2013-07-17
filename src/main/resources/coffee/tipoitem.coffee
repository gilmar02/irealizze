class App.FormEdicaoTipoItem extends App.PaginaEdicao
  constructor: (@modulo) ->
    super(@modulo)
    
      
  desenharConteudoForm: (jsonObj) ->
    divNome = $('<div data-role="fieldcontain">')
    @form.append divNome    
    labelNome = $('<label for="nome">Nome</label>')        
    @inputNome = $('<input name="nome" id="nome" placeholder="" value="' + jsonObj.nom + '" type="text">')
                
    divNome.append labelNome
    divNome.append @inputNome

    montarJSON: ->
    "{ 'nome': '#{@inputNome.val()}' }"         
    
class App.FormCriacaoTipoItem extends App.PaginaCriacao
  constructor: (@modulo) ->
    super(@modulo)
    
  desenharConteudoForm: () ->
    divNome = $('<div data-role="fieldcontain">')
    @form.append divNome    
    labelNome = $('<label for="nome">Nome</label>')        
    @inputNome = $('<input name="nome" id="nome" placeholder="" value="" type="text">')
                
    divNome.append labelNome
    divNome.append @inputNome


   montarJSON: ->
    "{ 'nome': '#{@inputNome.val()}' }"    
    
class App.PaginaDetalhesTipoItem extends App.PaginaDetalhes
  constructor:(@modulo)->
     super(@modulo)
     
  carregar: (registro) ->
    @titulo.html "#{@modulo.nome} #{registro[@modulo.propriedade]}"
    divNome = $('<div data-role="fieldcontain">')
    @form.append divNome    
    labelNome = $('<label for="nome">Nome</label>')        
    @inputNome = $('<input name="nome" id="nome" placeholder="" value="" type="text">')
                
    divNome.append labelNome
    divNome.append @inputNome
    
     montarJSON: ->
    "{ 'nome do item', 'nome': '#{@inputNome.val()}' }"    


       
     
                

class App.ModuloTipoItem extends App.Modulo
  constructor: (@lista) ->
    super(@lista, 'TipoItem', 'tipositens', 'nome')
    
  criarPaginaEdicao: ->
    new App.FormEdicaoTipoItem(this)
  criarPaginaCriacao: ->
    new App.FormCriacaoTipoItem(this)  
  criarPaginaDetalhes: ->  
    new App.PaginaDetalhesTipoItem(this)

  