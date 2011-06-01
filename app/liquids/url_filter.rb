module UrlFilter

  def asset_url(input)
    shop = @context['shop'] #ShopDrop
    "/#{shop.asset_path(input)}"
  end

  def global_asset_url(input)
    "/global/#{input}"
  end

  def product_img_url(input, size)
    "#{input[0..-5]}-#{size}#{input[-4..-1]}"
  end

end