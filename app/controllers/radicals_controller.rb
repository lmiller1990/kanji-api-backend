class RadicalsController < ApplicationController
  def index
    json_response(Radical.all)
  end
end
