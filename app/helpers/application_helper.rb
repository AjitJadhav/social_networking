module ApplicationHelper
  
  def is_friend?(friend)
    if current_user.friends.where("friend_with = ? and request_accepted = ?",friend.id, true).present?
      return "remove friend"
    elsif Friend.where("user_id = ? and friend_with = ? and request_accepted = ?",friend.id, current_user.id, true).present?
      return "remove friend"
    elsif current_user.friends.where("friend_with = ? and request_accepted = ?",friend.id, false).present?
      return "cancel request"
    else 
      return "accept request"
    end
    
  end

  def is_not_requested?(user)
    
      if current_user.friends.where("friend_with = ?", user.id).present?
        return false
      elsif Friend.where("user_id = ? and friend_with = ? ",user.id, current_user.id).present?
        return false
      else
        return true
     end 
      
  end   
  
  def is_liked?(post)
    post.likes.where("user_id = ?", current_user).first.present?
  end
end

