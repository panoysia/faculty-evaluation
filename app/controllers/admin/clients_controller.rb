class Admin::ClientsController < Admin::ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.order(last_name: :asc, first_name: :asc)
  end

  def show
  end

  def new
    @client = Client.new
    @client.build_user_account
  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to admin_clients_path, notice: 'Client record was successfully created.' }
      else
        @client.build_user_account
        format.html { render :new }
      end
    end    
  end

  def edit
  end

  def update
    # render html: params.inspect and return true

    respond_to do |format|    
      if @client.update(client_params)
        format.html {
          redirect_to admin_clients_path,
          notice: 'Client record was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end    
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_clients_path,
        notice: 'Client record was successfully deleted.' 
      }
    end
  end


  private  

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:first_name, :last_name, :description, user_account_attributes: [:username, :password])
  end

end