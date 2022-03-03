class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # add routes
  get '/bakeries' do
    all_bakeries = Bakery.all
    all_bakeries.to_json
  end
  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
    # bakery.to_json(include: { baked_goods: { only: [:name, :price] }})
  end
  get '/baked_goods/by_price' do
    all_yummy = BakedGood.all.order(price: :desc)
    all_yummy.to_json( only: [:name, :price] )
  end
  get '/baked_goods/most_expensive' do
    spendy_yummy = BakedGood.all.order(price: :desc).first
    spendy_yummy.to_json
  end
end
