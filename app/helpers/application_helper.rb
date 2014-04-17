module ApplicationHelper
  def is_friend?(friend)
   # debugger
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

end
