# class UsersController < ApplicationController
#   before_action :set_user, only: %i[ show edit update destroy ]



#   # GET /users or /users.json
#   def index
#     @users = User.all
#   end

#   def generate_fake_data
#     region = params[:region]
#     seed = params[:seed]
#     error_rate = params[:error_rate].to_f

#     # Generate fake user data based on the provided parameters
#     @users = User.generate_fake_data(region, seed, error_rate)

#     # Respond to the AJAX request with JSON data
#     respond_to do |format|
#       format.json { render json: @users }
#     end
#   end

  

#   # GET /users/1 or /users/1.json
#   def show
#   end

#   # GET /users/new
#   def new
#     @user = User.new
#   end

#   # GET /users/1/edit
#   def edit
#   end

#   # POST /users or /users.json
#   def create
#     @user = User.new(user_params)

#     respond_to do |format|
#       if @user.save
#         format.html { redirect_to user_url(@user), notice: "User was successfully created." }
#         format.json { render :show, status: :created, location: @user }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /users/1 or /users/1.json
#   def update
#     respond_to do |format|
#       if @user.update(user_params)
#         format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
#         format.json { render :show, status: :ok, location: @user }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /users/1 or /users/1.json
#   def destroy
#     @user.destroy!

#     respond_to do |format|
#       format.html { redirect_to users_url, notice: "User was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_user
#       @user = User.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def user_params
#       params.require(:user).permit(:region, :first_name, :middle_name, :last_name, :address, :phone)
#     end
# end


class UsersController < ApplicationController
  def data
    country = params[:country] || 'en' # Default to USA if no country is selected
    data = load_data(country)
    render json: data
    puts params[:country]
  end

  private

  def load_data(country)
    YAML.load_file(Rails.root.join("config/locales/#{country}.yml"))
  end
end




