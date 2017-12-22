class ChatsController < ApplicationController
    before_filter :set_chat, only: [:show, :edit, :update, :destroy]

  def index
    @chats =  Chat.all
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      flash[:success] = "Chat Guardado con Exito!"
      redirect_to @chat
    else
      flash.now[:danger] = "Error: El chat no pudo ser guardado"
      render :new
    end
  end

  def edit
    
  end

  def update
    if @chat.update(chat_params)
      flash[:success] = "Chat actualizado con Exito!!"
      redirect_to @chat
    else
      flash.now[:danger] = "Error: El chat no pudo ser guardado"
      render :edit
    end
  end

  def show
    
  end

  def destroy
    if @chat.destroy
      flash[:success] = "Chat eliminado Correctamente"
      redirect_to chats_path
    end
  end

  private
    def chat_params
      params.require(:chat).permit(:fecha, :motivo, :csr, :evaluacion)
    end

    def set_chat
      @chat = Chat.find(params[:id])
    end
end
