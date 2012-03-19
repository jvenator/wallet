module ApplicationHelper
  
  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end
end
