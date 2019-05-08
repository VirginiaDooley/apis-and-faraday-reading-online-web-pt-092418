class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
       req.params['client_id'] = 'MUQNPGD0LKF4LRXKIAH4FWII5OGR2ZFK4XMXZGKVDBNGUUWN'
       req.params['client_secret'] = 'YLCV1FSSFXENUGVQQ54BBJZ4WIWTVAFFA0NWXOS5XJSAKWX1'
       req.params['v'] = '20160201'
       req.params['near'] = params[:zipcode]
       req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
