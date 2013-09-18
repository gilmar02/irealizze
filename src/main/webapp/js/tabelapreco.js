(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  App.FormEdicaoTabelaPreco = (function(_super) {

    __extends(FormEdicaoTabelaPreco, _super);

    function FormEdicaoTabelaPreco(modulo) {
      this.modulo = modulo;
      FormEdicaoTabelaPreco.__super__.constructor.call(this, this.modulo);
    }

    FormEdicaoTabelaPreco.prototype.desenharConteudoForm = function(jsonObj) {
      var divNome, divPrecos, labelNome, labelPrecos;
      divNome = $('<div data-role="fieldcontain">');
      this.form.append(divNome);
      labelNome = $('<label for="nome">Nome</label>');
      this.inputNome = $('<input name="nome" id="nome" placeholder="" value="' + jsonObj.nome + '" type="text">');
      divNome.append(labelNome);
      divNome.append(this.inputNome);
      divPrecos = $('<div data-role="fieldcontain">');
      this.form.append(divPrecos);
      labelPrecos = $('<label for="precos">Preço</label>');
      this.inputPrecos = $('<input precos="precos" id="precos" placeholder="" value="' + jsonObj.precos + '" type="numbers">');
      divPrecos.append(labelPrecos);
      divPrecos.append(this.inputPrecos);
      ({
        montarJSON: function() {}
      });
      return "{ 'nome': '" + (this.inputNome.val()) + "' , 'precos': '" + (this.inputPrecos.val()) + "' }";
    };

    return FormEdicaoTabelaPreco;

  })(App.PaginaEdicao);

  App.FormCriacaoTabelaPreco = (function(_super) {

    __extends(FormCriacaoTabelaPreco, _super);

    function FormCriacaoTabelaPreco(modulo) {
      this.modulo = modulo;
      FormCriacaoTabelaPreco.__super__.constructor.call(this, this.modulo);
    }

    FormCriacaoTabelaPreco.prototype.desenharConteudoForm = function() {
      var divNome, divPrecos, labelNome, labelPrecos;
      divNome = $('<div data-role="fieldcontain">');
      this.form.append(divNome);
      labelNome = $('<label for="nome">Nome</label>');
      this.inputNome = $('<input name="nome" id="nome" placeholder="" value="" type="text">');
      divNome.append(labelNome);
      divNome.append(this.inputNome);
      divPrecos = $('<div data-role="fieldcontain">');
      this.form.append(divPrecos);
      labelPrecos = $('<label for="precos">Preço</label>');
      this.inputPrecos = $('<input name="precos" id="precos" placeholder="" value="" type="numbers">');
      divPrecos.append(labelPrecos);
      return divPrecos.append(this.inputPrecos);
    };

    FormCriacaoTabelaPreco.prototype.montarJSON = function() {
      return "{ 'nome': '" + (this.inputNome.val()) + "' , 'precos': '" + (this.inputPrecos.val()) + "'}";
    };

    return FormCriacaoTabelaPreco;

  })(App.PaginaCriacao);

  App.PaginaDetalhesTabelaPreco = (function(_super) {

    __extends(PaginaDetalhesTabelaPreco, _super);

    function PaginaDetalhesTabelaPreco(modulo) {
      this.modulo = modulo;
      PaginaDetalhesTabelaPreco.__super__.constructor.call(this, this.modulo);
    }

    PaginaDetalhesTabelaPreco.prototype.carregar = function(registro) {
      var grid,
        _this = this;
      this.titulo.html("" + registro[this.modulo.propriedade]);
      grid = $('<div class="ui-grid-a">');
      this.content.append(grid);
      $.getJSON('itens', function(jsonObj) {
        return $.each(jsonObj, function(i, item) {
          var divprecoitem, divsegcol, inputprecoitem, nomeitem;
          nomeitem = $('<div class="ui-block-a">' + item.nome + '</div>');
          grid.append(nomeitem);
          divsegcol = $('<div class="ui-block-b">');
          grid.append(divsegcol);
          divprecoitem = $('<div data-role="fieldcontain">');
          divsegcol.append(divprecoitem);
          inputprecoitem = $('<input name="" id="textinput1" placeholder="" value="" type="number" data-mini="true">');
          divprecoitem.append(inputprecoitem);
          return inputprecoitem.change(function() {
            return alert("PUT/" + item.id + ": " + inputprecoitem.val());
          });
        });
      });
      return this.content.trigger("create");
    };

    return PaginaDetalhesTabelaPreco;

  })(App.PaginaDetalhes);

  App.ModuloTabelaPreco = (function(_super) {

    __extends(ModuloTabelaPreco, _super);

    function ModuloTabelaPreco() {
      ModuloTabelaPreco.__super__.constructor.call(this, 'TabelaPreco', 'tabelasprecos', 'nome');
    }

    ModuloTabelaPreco.prototype.criarPaginaEdicao = function() {
      return new App.FormEdicaoTabelaPreco(this);
    };

    ModuloTabelaPreco.prototype.criarPaginaCriacao = function() {
      return new App.FormCriacaoTabelaPreco(this);
    };

    ModuloTabelaPreco.prototype.criarPaginaDetalhes = function() {
      return new App.PaginaDetalhesTabelaPreco(this);
    };

    return ModuloTabelaPreco;

  })(App.Modulo);

}).call(this);
