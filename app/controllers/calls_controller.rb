class CallsController < ApplicationController
  before_filter :set_call, only: [:show, :edit, :update, :destroy]


    def index
        @calls = Call.all    
    end

    def new
        @call = Call.new
    end

    def create
        @call = Call.new(call_params)
        if @call.save
            flash[:success] = "Llamada Guardada con Exito"
            redirect_to @call 
        else
            flash.now[:danger] = "La llamada no se a guardado"
            render :new
        end
    end

    def edit
        
    end

    def update
        if @call.update(call_params)
            flash[:success] = "Llamada actualizada con Exito!!"
            redirect_to @call
        else
            flash.now[:danger] = "Error La llamada no se pudo Guardar"
            render :edit
        end
    end

    def show
    end

    def destroy
        if @call.destroy
            flash[:success] = "LLamada Eliminada correctamente"
            redirect_to calls_path
        end
    end


    private
        def call_params
            params.require(:call).permit(:fecha, :hora, :rfc, :motivo, :csr)    
        end

        def set_call
            @call = Call.find(params[:id])
        end
    
end