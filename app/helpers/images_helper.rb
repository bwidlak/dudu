module ImagesHelper

  def header_for_gallery name
    case name
      when "ślub"
        return "header_portfolio_sluby.png"
      when "wesele"
        return "header_portfolio_wesele.png"
      when "chrzest"
        return "header_portfolio_chrzest.png"
      when "plener"
        return "header_portfolio_plener.png"
      when "dzieci"
        return "header_portfolio_dzieci.png"
      when "komunia"
        return "header_portfolio_komunie.png"
      else
        return "header_portfolio_inne.png"
    end
  end

end
