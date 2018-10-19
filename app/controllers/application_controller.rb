class ApplicationController < ActionController::Base

    before_action :now_user

    def now_user
        @now_user=User.find_by(id: session[:user_id])
    end    
      
      
    def authenticate_user
        if @now_user==nil
            flash[:notice]="ログインが必要です"
            redirect_to("/login")
        end
    end

    def forbid_login_user
        if @now_user
            flash[:notice]="ログイン時はアクセスできません。"
            redirect_to("/")
        end
    end

end
