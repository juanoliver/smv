class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :edit, :update, :destroy]

  # GET /machines
  def index
    @machines = Machine.all
    @json = @machines.to_gmaps4rails do |machine, marker|
            marker.infowindow render_to_string(:partial => "/machines/infowindow", :locals => { :machine => machine})
            marker.title "FieldAgent #{machine.extID}"
    end
#            marker.picture({:picture => "http://mapicons.nicolasmollet.com/wp-content/uploads/mapicons/shape-default/color-3875d7/shapecolor-color/shadow-1/border-dark/symbolstyle-contrast/symbolshadowstyle-dark/gradient-iphone/information.png",
 #           :width => 32,
 #           :height => 32})
  end
 

  # GET /machines/1
  def show
  end

  # GET /machines/new
  def new
    @machine = Machine.new
  end

  # GET /machines/1/edit
  def edit
  end

  # POST /machines
  def create
    @machine = Machine.new(machine_params)

    if @machine.save
      redirect_to @machine, notice: 'Machine was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /machines/1
  def update
    if @machine.update(machine_params)
      redirect_to @machine, notice: 'Machine was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /machines/1
  def destroy
    @machine.destroy
    redirect_to machines_url, notice: 'Machine was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine
      @machine = Machine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def machine_params
      params.require(:machine).permit(:extID, :name, :description, :category, :status)
    end
end
