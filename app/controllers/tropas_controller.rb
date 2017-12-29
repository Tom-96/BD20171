class TropasController < ApplicationController
  before_action :set_tropa, only: [:show, :edit, :update, :destroy]

 
  def index
    @tropas = Tropa.all
  end

 
  def show
  end

  
  def new
    @tropa = Tropa.new
    @tipoTropas = TipoTropa.all
    @Recursos = Recurso.all
  end

  
  def edit
    @tipoTropas = TipoTropa.all
    @Recursos = Recurso.all
  end

 
  def create
    @tropa = Tropa.new(tropa_params)

    respond_to do |format|
      if @tropa.save
        format.html { redirect_to @tropa, notice: 'Tropa creada exitosamente' }
    
      else
        format.html { render :new }
        
      end
    end
  end

  def update
    respond_to do |format|
      if @tropa.update(tropa_params)
        format.html { redirect_to @tropa, notice: 'Tropa Editada' }

      else
        format.html { render :edit }
       
      end
    end
  end


  def destroy
    @tropa.destroy
    respond_to do |format|
      format.html { redirect_to tropas_url, notice: 'Tropa Eliminada' }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tropa
      @tropa = Tropa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tropa_params
      params.require(:tropa).permit(:nombre, :atk, :def, :tipo_tropa_id, :recurso_id, :cantidad_rec)
    end
end
