class CompaniesController < ApplicationController
  #before_action :authenticate_user!, only: [:create, :update, :edit, :show, :destroy]
  #before_action :authenticate_user!, only: %i[show create edit destroy]
  # before_action :check_permission, only: %i[create show update destroy]
  # before_action :set_company, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!,except:[:index]

  def index
    @companies = Company.order('created_at DESC')
    @company = Company.new
  end

  def create
    @company = Company.new(
      name: params[:company][:name],
      # user_id: current_user.id
    )
    @company.save
    respond_to :js
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    respond_to :js
  end

  def edit
    @company = Company.find(params[:id])
    respond_to :js
  end

  def update
    @company = Company.find(params[:id])
    @company.name = params[:company][:name]
    @company.save
    respond_to :js
  end

  def show
    @company = Company.find(params[:id])
    respond_to :js
  end


  def check_permission
    redirect_to root_path, alert: 'No posee los permisos necesarios.' and return unless current_user
  end
end


# class CompaniesController < ApplicationController
#   before_action :set_company, only: [:show, :edit, :update, :destroy]
#   before_action :check_permission, only: %i[create show update destroy]
  
#   def index
#     @companies = Company.all
#     @company = Company.new
#   end
  
  
#   def show
#   end
  
  
#   def new
#     @company = Company.new
#   end
  
  
#   def edit
#   end
  
  
#   def create
#     @company = Company.create(company_params)
#     respond_to do |format|
#       format.js
#     end
#   end
  
  
#   def update
#     respond_to do |format|
#       if @company.update(company_params)
#         format.html { redirect_to @company, notice: 'Company was successfully updated.' }
#         format.json { render :show, status: :ok, location: @company }
#       else
#         format.html { render :edit }
#         format.json { render json: @company.errors, status: :unprocessable_entity }
#       end
#     end
#   end
  


#   def destroy
#     @company.destroy
#     respond_to do |format|
#     format.js
#     end
#   end



#   private

#   def check_permission
#     redirect_to root_path, alert: 'No posee los permisos necesarios.' and return unless current_user
#   end
  
#   # Use callbacks to share common setup or constraints between actions.
#   def set_company
#     @company = Company.find(params[:id])
#   end
#   # Never trust parameters from the scary internet, only allow the white list through.
#   def company_params
#     params.require(:company).permit(:name)
#   end
# end
