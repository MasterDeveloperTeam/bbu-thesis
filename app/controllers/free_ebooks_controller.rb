class FreeEbooksController < ApplicationController
  before_action :set_free_ebook, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, unless: proc{|c| c.devise_controller?}
  # GET /free_ebooks
  # GET /free_ebooks.json
  def index
    @free_ebooks = FreeEbook.all
  end

  # GET /free_ebooks/1
  # GET /free_ebooks/1.json
  def show
  end

  # GET /free_ebooks/new
  def new
    @free_ebook = FreeEbook.new
  end

  # GET /free_ebooks/1/edit
  def edit
  end

  # POST /free_ebooks
  # POST /free_ebooks.json
  def create
    @free_ebook = FreeEbook.new(free_ebook_params)
    @free_book.photo = params[:free_ebook][:photo]
    respond_to do |format|
      if @free_ebook.save
        format.html { redirect_to @free_ebook, notice: 'Free ebook was successfully created.' }
        format.json { render action: 'show', status: :created, location: @free_ebook }
      else
        format.html { render action: 'new' }
        format.json { render json: @free_ebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /free_ebooks/1
  # PATCH/PUT /free_ebooks/1.json
  def update
    respond_to do |format|
      if @free_ebook.update(free_ebook_params)
        format.html { redirect_to @free_ebook, notice: 'Free ebook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @free_ebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /free_ebooks/1
  # DELETE /free_ebooks/1.json
  def destroy
    @free_ebook.destroy
    respond_to do |format|
      format.html { redirect_to free_ebooks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_free_ebook
      @free_ebook = FreeEbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def free_ebook_params
      params.require(:free_ebook).permit(:title, :description, :status, :user_id)
    end
end
