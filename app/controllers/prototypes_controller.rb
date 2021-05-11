 class PrototypesController < ApplicationController
   before_action :authenticate_user!, only: [:edit,:destroy, :new]
 

  def index
    @prototypes = Prototype.all 
  end

  def new
   @prototype = Prototype.new
  end

  def create
   @prototype = Prototype.create(proto_params)

   if @prototype.save
     redirect_to root_path 
   else
    render :new
   end
  end

  def show
   @prototype = Prototype.find(params[:id])

   @comment = Comment.new
   
   @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  
    unless current_user.id == @prototype.user_id
      redirect_to action: :index
    end 
     
  end

  def update 
   @prototype = Prototype.find(params[:id])

   if @prototype.update(proto_params)
     redirect_to prototype_path
   else
     render :edit
   end
   
  end

  def destroy
    
   @prototype = Prototype.find(params[:id])
   @prototype.destroy

   redirect_to root_path
  end



   private
   def proto_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
   end
  end
  

