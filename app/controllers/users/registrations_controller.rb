# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
  def update_resource(resource, params)
               resource.update_without_password(params.except(:current_password))
          end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fun,:serious,:friendship,:image,:account,:showweightsize,:research,:myinterests,:description,:weight,:size,:country,:region_id,:email,:iam, :isearchwoman,:isearchman,:yyyy,:mm,:dd,:phone,:nickname,:ajouterprive,:ajouterpublic,:region,:interest_ids=>[],:photopublics_attributes=>{},:photoprives_attributes=>{}])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:fun,:serious,:friendship,:image,:account,:showweightsize,:research,:myinterests,:description,:weight,:size,:country,:region_id,:email,:iam, :isearchwoman,:isearchman,:mm,:dd,:yyyy,:phone,:nickname,:region,:ajouterprive,:ajouterpublic,:interest_ids=>[],:photopublics_attributes=>{},:photoprives_attributes=>{}])
  end

  #The path used after sign up.
  #def after_sign_up_path_for(resource)
  #   super(resource)
  #end

          def after_update_path_for(resource)
                    puts 'this is happening yoyo mama'
                            flash[:notice] = "You send photos"
                            if resource.ajouterprive or resource.ajouterpublic or resource.photopublic or resource.photoprive 
                              "/settings/album"
                            elsif resource.account
                              "/settings/account"
                            elsif resource.myinterests
                              "/settings/interests"
                            elsif resource.research
                              "/settings/research"
                            else
                              "/settings/profile"
                            end
                                        end


  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
