module ApplicationHelper
  def has_role?(role)
    current_user && current_user.has_role?(role)
  end
  def current_user?(user)
    user == current_user
  end


end
