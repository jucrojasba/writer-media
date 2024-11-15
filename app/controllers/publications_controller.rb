class PublicationsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_publication, only: %i[show edit update destroy]

  # GET /publications or /publications.json
  def index
    if current_user && current_user.admin?  # Asegurarse de que current_user no es nil
      @publications = Publication.all
    else
      @publications = Publication.where(status: true)
    end

    # Filtrar por fecha
    if params[:start_date].present? && params[:end_date].present?
      @publications = @publications.from_date_range(params[:start_date], params[:end_date])
    end

    # Filtrar por categoría
    if params[:category].present?
      @publications = @publications.by_category(params[:category])
    end
  end

  # GET /publications/1 or /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = current_user.publications.new  # Corregido 'currente_user' por 'current_user'
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications or /publications.json
  def create
    @publication = current_user.publications.new(publication_params)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: "Publication was successfully created." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1 or /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1 or /publications/1.json
  def destroy
    @publication.destroy!

    respond_to do |format|
      format.html { redirect_to publications_path, status: :see_other, notice: "Publication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publication_params
      params.require(:publication).permit(:title, :description, :category, :status)
    end
end
