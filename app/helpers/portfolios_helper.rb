module PortfoliosHelper
  def image_generator(width:, height:)
    "http://placehold.it/#{width}x#{height}"
  end

  def portfolio_img img, type
    if img.model.main_image? || img.model.thumb_image?
      img
    elsif type == 'thumb'
      image_generator(width: 350, height: 200)
    else
      image_generator(width: 600, height: 400)
    end
  end
end
