class ApplicationController < ActionController::Base
  helper_method :logged_in?

  private

  def logged_in?
    !!session[:user_id] # !!はnot演算子、falseまたはnilの時はfalseを、それ以外の値の時はtrueへ変換する
  end
end
