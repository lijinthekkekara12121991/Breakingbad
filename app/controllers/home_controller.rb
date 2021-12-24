require 'rest_client'

class HomeController < ApplicationController
  def index
    @body = JSON.parse((RestClient.get 'https://www.breakingbadapi.com/api/characters').body)
  end

  def create
    @options = params[:search_type]
  end

  def destroy
  end

  def search
    @body = []
    unless params[:name_search].blank?
      @body = JSON.parse((RestClient.get 'https://www.breakingbadapi.com/api/characters', { params: { name: params[:name_search].downcase }}).body)
    end
    unless params[:episode_search].blank?
      characters = (JSON.parse((RestClient.get "https://www.breakingbadapi.com/api/episodes/#{params[:episode_search]}").body)[0]['characters'])
      characters.each do |character|
        @body += JSON.parse((RestClient.get 'https://www.breakingbadapi.com/api/characters', { params: { name: character.downcase }}).body)
      end
    end
  end

  private
end
