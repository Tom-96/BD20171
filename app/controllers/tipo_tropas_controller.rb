class TipoTropasController < ApplicationController
  before_action :set_tipo_tropa, only: [:show, :edit, :update, :destroy]

  # GET /tipo_tropas
  # GET /tipo_tropas.json
  def index
    @tipo_tropas = TipoTropa.all
  end

  # GET /tipo_tropas/1
  # GET /tipo_tropas/1.json
  def show
  end

  # GET /tipo_tropas/new
  def new
    @tipo_tropa = TipoTropa.new
  end

  # GET /tipo_tropas/1/edit
  def edit
  end

  # POST /tipo_tropas
  # POST /tipo_tropas.json
  def create
    @tipo_tropa = TipoTropa.new(tipo_tropa_params)

    respond_to do |format|
      if @tipo_tropa.save
        format.html { redirect_to @tipo_tropa, notice: 'Tipo tropa was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_tropa }
      else
        format.html { render :new }
        format.json { render json: @tipo_tropa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_tropas/1
  # PATCH/PUT /tipo_tropas/1.json
  def update
    respond_to do |format|
      if @tipo_tropa.update(tipo_tropa_params)
        format.html { redirect_to @tipo_tropa, notice: 'Tipo tropa was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_tropa }
      else
        format.html { render :edit }
        format.json { render json: @tipo_tropa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_tropas/1
  # DELETE /tipo_tropas/1.json
  def destroy
    @tipo_tropa.destroy
    respond_to do |format|
      format.html { redirect_to tipo_tropas_url, notice: 'Tipo tropa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_tropa
      @tipo_tropa = TipoTropa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_tropa_params
      params.require(:tipo_tropa).permit(:nombre, :boni_atk, :boni_def)
    end
end
