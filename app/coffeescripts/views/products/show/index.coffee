App.Views.Product.Show.Index = Backbone.View.extend
  el: '#main'

  events:
    "click #action-links a.edit-btn": "toggleEdit"
    "click #new-variant-link p": "newVariant"

  initialize: ->
    # 先生成修改页面，以便查看页面获取集合名称
    new App.Views.Product.Show.Edit model: @model
    new App.Views.Product.Show.Show model: @model
    # 款式
    new App.Views.Product.Show.Variant.Index collection: App.product_variants
    @model.bind 'change:title', ->
      $('#product_title > a').text self.attributes.title
    @model.bind 'change:options', ->
      new App.Views.Product.Show.Variant.Index collection: App.product_variants

  toggleEdit: ->
    $('#product-edit').toggle()
    $('#product-right-col').toggle()
    $('#product').toggle()
    false

  newVariant: ->
    new App.Views.Product.Show.Variant.New()
    $('#new-variant-link').hide()
    $('#new-variant').show()
    Effect.scrollTo('#new-variant')
    false