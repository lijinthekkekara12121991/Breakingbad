require 'rest_client'

class HomeController < ApplicationController
  def index
    @body = JSON.parse((RestClient.get 'https://www.breakingbadapi.com/api/characters').body)
  end

  def create
  end

  def destroy
  end
end
