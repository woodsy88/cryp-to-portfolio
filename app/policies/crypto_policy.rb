class CryptoPolicy < ApplicationPolicy

  def update?
    # return true if post_approved? && admin?
    # return true if user_or_admin && !post_approved?
    # record.user_id == user.id || admin_types.include?(user.type)
    record.user_id == user.id
  end

  def edit
    record.user_id == user.id
  end

  # def approve?
  #   return true if admin?
  # end

  # def booked?
  #   return true if user_or_admin
  # end

  # private 

  # def user_or_admin
  #   record.user_id == user.id || admin?
  # end

  # def admin?
  #   admin_types.include?(user.type)
  # end

  # def post_approved?
  #   record.approved?
  # end


end