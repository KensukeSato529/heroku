class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  def index
    @messages = Message.all
  end
    
  def show
  end
    
  def new
    @message = Message.new
  end
    
  def create
    @message = Message.new(message_params)
        
    if @message.save
      flash[:success] = 'メッセージが正常に登録されました'
      redirect_to @message
    else
      flash.now[:danger] = 'メッセージが登録されませんでした'
      render :new
    end
  end
    
  def edit
  end
    
  def update
    if @message.update(message_params)
      flash[:success] = 'メッセージが編集されました'
      redirect_to @message
    else
      flash.now[:danger] = 'メッセージが編集されませんでした'
      render :new
    end
  end
    
  def destroy
    @message.destroy

    flash[:success] = 'メッセージは正常に削除されました'
    redirect_to messages_url
  end
    
  private
  
  def set_message
    @message = Message.find(params[:id])
  end
    
  def message_params
    params.require(:message).permit(:content, :title)
  end
end
