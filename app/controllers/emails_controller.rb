class EmailsController < ApplicationController
  def new
  end

  def create
    response = RestClient.post("http://desafioapp2.heroku.com/users", {:email => params[:email]})
    if response.code == 201
      flash[:notice] = "E-mail cadastrado com sucesso"
    end
    render :new
  end

end
