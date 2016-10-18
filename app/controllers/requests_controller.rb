class RequestsController < ApplicationController

  REQUESTS_PER_PAGE = 7

  def index
    @requests = Request.order(mark: :desc, department: :asc).
    page(params[:page]).
    per(REQUESTS_PER_PAGE)
    @sales = Request.where(department: 'Sales').count
    @technical = Request.where(department: 'Technical').count
    @marketing = Request.where(department: 'Marketing').count
    @total = Request.all.count

  end

  def new
    @request = Request.new
  end

  def create
    request_params = params.require(:request).permit([:name, :email,:department, :message])
    @request=Request.new request_params

    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def edit
    @request = Request.find params[:id]
  end

  def destroy
    @request = Request.find params[:id]
    @request.destroy
    redirect_to requests_path
  end

  def update
    @request = Request.find params[:id]

    if @request.update request_params
      redirect_to requests_path
    else
      render :edit
    end
  end

  def switch
    @request = Request.find params[:id]
     @request.update_attributes(:mark => !@request.mark)
     redirect_to requests_path
  end

  def search
    @search = params[:content]
    # views/requests/search.html.erb
    # @requests=Request.where(["name ILIKE ?", "%#{@search}%"])||where(["email ILIKE ?", "%#{@search}%"])||where(["department ILIKE ?", "%#{@search}%"])||where(["message ILIKE ?", "%#{@search}%"])
    @requests=Request.where("name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE ?", "%#{@search}%", "%#{@search}%", "%#{@search}%", "%#{@search}%").order(mark: :desc, department: :asc).
                          page(params[:page]).
                          per(REQUESTS_PER_PAGE)
  end


  private
  def request_params
   params.require(:request).permit([:name, :email,:department, :message])
  end

end
