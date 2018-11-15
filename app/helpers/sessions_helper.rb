module SessionsHelper
  def current_user
    if session[:user_id]
      @current_user || User.find_by(id: session[:user_id])
    end
  end

  def logout
    current_user = nil
    session[:user_id] = nil
  end

  def logged?
    !!current_user
  end

  def login(person)
    session[:user_id] = person.id
  end
  
end
