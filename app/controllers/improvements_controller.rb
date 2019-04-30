class ImprovementsController < ApplicationController
  before_action :set_improvement, only: [:show, :edit, :update, :destroy, :vote]
  respond_to :js, :json, :html
  # GET /improvements
  # GET /improvements.json
  def index
    @improvements = Improvement.all
  end

  # GET /improvements/1
  # GET /improvements/1.json
  def show
  end

  # GET /improvements/new
  def new
    @improvement = Improvement.new

  end

  # GET /improvements/1/edit
  def edit
  end

  # POST /improvements
  # POST /improvements.json
  def create

    @project = Project.find(params[:project_id])
    @improvement = @project.improvements.create(improvement_params)
    redirect_to project_path(@project)


  #  respond_to do |format|
  #    if @improvement.save
  #     # format.html { redirect_to @improvement, notice: 'Improvement was successfully created.' }
 
  #      format.html { redirect_to project_path (@project), notice: 'Improvement was successfully created.' }
  #      format.json { render :show, status: :created, location: @improvement } 
  #    else
  #      format.html { render :new }
  #      format.json { render json: @improvement.errors, status: :unprocessable_entity }
  #    end
    
  end

  # PATCH/PUT /improvements/1
  # PATCH/PUT /improvements/1.json
  def update
    respond_to do |format|
      if @improvement.update(improvement_params)
        format.html { redirect_to @improvement, notice: 'Improvement was successfully updated.' }
        format.json { render :show, status: :ok, location: @improvement }
      else
        format.html { render :edit }
        format.json { render json: @improvement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /improvements/1
  # DELETE /improvements/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @improvement = @project.improvements.find(params[:id])
    @improvement.destroy
    redirect_to project_path(@project)
    
  end

  def vote
    @improvement = Improvement.find(params[:id])
    if !current_user.liked? @improvement
      @improvement.liked_by current_user
    elsif current_user.liked? @improvement
      @improvement.unliked_by current_user
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_improvement
      @improvement = Improvement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def improvement_params
      params.require(:improvement).permit(:title, :author, :principle, :description, :image)
    end
end
