ActiveAdmin.register User do
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    permit_params :email
    #
    # or
    #
    # permit_params do
    #   permitted = [:permitted, :attributes]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
    
    # form do |f|
    #     input :email
    #     # input :password
        
    #     actions
    # end


    form do |f|
        inputs 'Agregar un nuevo
        usuario' do
        input :email
        #input :password
        end
        
        actions :all
    end

 




    
    controller do
        def update
            if (params[:user][:password].blank? && params[:user]
                [:password_confirmation].blank?)
                params[:user].delete("password")
                params[:user].delete("password_confirmation")
            end
            super    
        end
    end
    
 
end
