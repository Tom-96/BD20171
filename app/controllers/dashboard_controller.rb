class DashboardController < ApplicationController
  def menu_user
 	if current_admin
  		redirect_to "dashboard#menu_admin"
  	elsif not signed_in?
  		redirect_to "/"
  	end

  @tropas = current_user.tropas_por_usuarios

  end

  def menu_admin
  	if current_user
  		redirect_to "dashboard#menu_user"
  	elsif not signed_in?
  		redirect_to "/"
  	end

  end

  def mostrar_tropas
    @tropas = Tropa.all
  end

  def adquirir_tropa

     @tropa = Tropa.find(params[:id])

     @new_tropa = @tropa.tropas_por_usuarios.build(:user => current_user)
     @new_tropa.fecha = Time.now
     @new_tropa.curr_atk = @tropa.atk
     @new_tropa.curr_def = @tropa.def
    respond_to do |format|
      if @new_tropa.save
        @recurso = current_user.recursos_por_usuarios.where(recurso_id: @new_tropa.tropa.recurso_id).first
        @cantidad = @recurso.cantidad-@new_tropa.tropa.cantidad_rec
        if @recurso.update_attributes(:cantidad => @cantidad)

          format.html { redirect_to dashboard_mostrar_tropas_path, notice: 'Tropa adquirida exitosamente' }

        else
          format.html { redirect_to dashboard_mostrar_tropas_path, notice: 'Error al adquirir tropa' }

        end
      else
        format.html { redirect_to dashboard_mostrar_tropas_path, notice: 'Error al adquirir tropa' }

      end
    end
  end

  def mostrar_recursos
    @recursos = Recurso.all
  end

  def retirarse
    @recursos = RecursosPorUsuario.where(user_id: current_user.id)
    @recursos.each do |recurso|
      @cantidad = recurso.cantidad - 1
      recurso.update_attributes(:cantidad => @cantidad, :ultima_fecha => Time.now)
    end
    respond_to do |format|
      format.html {redirect_to dashboard_mostrar_recursos_path, notice: 'Te has retirado y has perdido 1 de cada recurso'}
    end
  end

  def atacar
    @enemigo = User.where.not(email:current_user.email).order("RANDOM()").first
    @tropas_enemigo = @enemigo.tropas_por_usuarios
    @suma_ataque = @tropas_enemigo.sum(:curr_atk)
    @suma_defensa = @tropas_enemigo.sum(:curr_def)
  end

  def atacar_enemigo
  end

  def add_recurso
    @recurso = Recurso.find(params[:id])

    if RecursosPorUsuario.where(user_id: current_user.id, recurso_id: params[:id]).exists?
      @new_recurso = RecursosPorUsuario.where(user_id: current_user.id, recurso_id: params[:id]).first
      @cantidad = @new_recurso.cantidad + 100
      respond_to do |format|
        if @new_recurso.update_attributes(:cantidad => @cantidad, :ultima_fecha => Time.now)
          format.html { redirect_to dashboard_mostrar_recursos_path, notice: '+ 100 ' }
        else
          format.html { redirect_to dashboard_mostrar_tropas_path, notice: 'Error al adquirir recurso' }
        end
      end

    else
      @new_recurso = @recurso.recursos_por_usuarios.build(:user => current_user)
      @new_recurso.cantidad = 100
      @new_recurso.ultima_fecha = Time.now
      respond_to do |format|
        if @new_recurso.save
          format.html { redirect_to dashboard_mostrar_recursos_path, notice: '+ 100 ' }
        else
          format.html { redirect_to dashboard_mostrar_tropas_path, notice: 'Error al adquirir recurso' }
        end
      end
    end
  end



end
