class PeopleController < ApplicationController
  before_action :use_my_key
  def index

    # response = HTTParty.get('https://jsonplaceholder.typicode.com/posts')
    response = HTTParty.get("#{SALESLOFT_URL}")

    render json: {message: JSON.parse(response.body)}
  end
end