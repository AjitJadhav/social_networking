module ApplicationHelper
  def f_friend?(friend)
   # debugger
    if current_user.friends.where("friend_with = ? and request_accepted = ?",friend.id, true).present?
      return "remove friend"
    elsif Friend.where("user_id = ? and friend_with = ? and request_accepted = ?",friend.id, current_user.id, true).present?
      return "remove friend"
    else
      return "accept request"
    end
  end

end
