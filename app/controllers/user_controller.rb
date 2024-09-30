class UserController < ApplicationController
    #before_action :authenticate_user!, except: [:get_account]
    before_action :set_user, only: [:update_password, :sidebar]

    def get_all_user
        @users = User.joins(:role, :family_commissary).select(
            :id,
            :email,
            :first_name,
            :last_name,
            :created_at,
            'roles.title AS role_title',
            'family_commissaries.name AS family_commissary_name',
            :enabled

        )
        render json: @users
    end

    def get_user_roles
        @roles = Role.select(:id, :title).order(:title)
        render json: @roles
    end

    def get_ether_account
        response = Faraday.get(ENV['URL_DAPP'] + "Account/getAccount")
        body = nil
        status = nil

        if(response.status == 200)
            status = 200
            body = response.body
        else
            status = 500
        end

        render json: body, status: status
    end

    def get_account
        response = Faraday.get(ENV['URL_DAPP'] + "Account/getAccount")
        body = nil
        status = nil

        if(response.status == 200)
            status = 200
            body = JSON.load(response.body)
            body = { "address" => body['address'] }
        else
            status = 500
        end

        render json: body, status: status
    end
    
    def get_user_group_by_roles
        @users = []
        Role.includes(:users).where.not(code: 'admin').order(:orden).each do |t|
            role = t.attributes.slice('id', 'title', 'code')
            role[:users] = []
            role[:users] = t.users.where(family_commissary_id: current_user.family_commissary_id).select(:id, :first_name, :last_name, :family_commissary_id)
            unless role[:users].empty?
                @users.push(role)
            end
        end
        render json: @users
    end

    def update_password
        if @user.update_with_password(user_params)
            # Sign in the user by passing validation in case their password changed
            #bypass_sign_in(@user)
            render json: {message: "¡Contraseña modificada exitosamente!"}, status: :created        
        else
            render json: @user.errors, status: :bad_request
        end  
    end

    def sidebar
        @sidebar = @user.get_sidebar

        render json: @sidebar, status: :ok        
    end

    def get_profile
        @user = User.find(params[:user_id])
        render json: @user
    end

    def edit_profile
        @user = User.find(params[:user_id])
        if @user.update(profile_params)
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def enable_user
        @user = User.find(params[:user_id])
        

        result = {
            success: false,
            message: ''
        }

        if @user.documents.count > 0 && @user.enabled == true && params[:enabled] == false
            result[:message] = "No puedes #{ enable_user_title(params[:enabled]) } a #{ @user.fullname } porque tiene #{@user.documents.count} denuncia(s) por realizar"
            render json: result

            return
        end

        @user.enabled = params[:enabled]

        if @user.save
            result[:message] = "El usuario #{ @user.fullname } ha sido #{ enable_user_title_2(params[:enabled]) }"
            result[:success] = true
            render json: result
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
    
    private
        def set_user
            @user = current_user
        end

        def profile_params
            params.require(:user).permit(:email, :first_name, :last_name, :role_id, :family_commissary_id)
        end

        def user_params
            params.require(:user).permit(:password, :password_confirmation, :current_password,)
        end

        def enable_user_title(status)
            status ? 'activar' : 'inactivar'
        end     
        
        def enable_user_title_2(status)
            status ? 'activado' : 'inactivado'
        end     
end
