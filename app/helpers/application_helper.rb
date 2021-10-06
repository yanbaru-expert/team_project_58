module ApplicationHelper
  def text_title
    if params[:genre] == "php"
      "PHP テキスト教材"
    else
      "Ruby/Rails テキスト教材"
    end
  end

  def max_width
    if controller_name == "texts" && action_name == "show"
      "mw-md"
    elsif devise_controller?
      "mw-sm"
    else
      "mw-xl"
    end
  end

  def movie_title
    if params[:genre] == "php"
      "PHP"
    else
      "Ruby/Rails"
    end
  end
end
