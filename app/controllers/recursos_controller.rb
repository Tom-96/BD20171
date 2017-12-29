class RecursosController < ApplicationController
  before_action :set_recurso, only: [:show, :edit, :update, :destroy]

  def index
  	@recursos = Recurso.all
  end
  

  def show
  end

  
  def new
    @recurso = Recurso.new
  end

  
  def edit
  end

 
  def create
    @recurso = Recurso.new(recurso_params)

    respond_to do |format|
      if @recurso.save
        format.html { redirect_to @recurso, notice: 'Recurso creado exitosamente' }
    
      else
        format.html { render :new }
        
      end
    end
  end

  def update
    respond_to do |format|
      if @recurso.update(recurso_params)
        format.html { redirect_to @recurso, notice: 'Recurso Editado' }

      else
        format.html { render :edit }
       
      end
    end
  end


  def destroy
    @recurso.destroy
    respond_to do |format|
      format.html { redirect_to recursos_url, notice: 'Recursos Eliminados' }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurso
      @recurso = Recurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recurso_params
      params.require(:recurso).permit(:nombre)
    end
end
