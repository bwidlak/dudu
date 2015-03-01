# encoding: utf-8

class Image < ActiveRecord::Base

  include CommonStatuses
  include GetText

  YES = 1
  NO = 2
  
  OPTIONS = {
    'Tak' => YES,
    'Nie' => NO,
  }
  
  belongs_to :category
  
  validates_presence_of :url, :category, :status
  validates_inclusion_of :slideshow, :in => OPTIONS.values
  
  before_save :set_other_urls

  scope :slideshow, -> { where("slideshow = ?", YES) }
  scope :no_slideshow, -> { where("slideshow =? ", NO) }
  scope :category_filter, lambda {|options|
    !options.blank? && !options[:category_id].blank? ? {:conditions => options} : {}
  }

  class <<self
    def multi_update ids, options
      find(:all, :conditions => {:id => ids}).each do |img|
        img.update_attributes options
      end
    end
    
    def random_images
      Category.main_categories.map do |category|
        category.images.active.slideshow
        # category_id_equals(category).active.slideshow
      end.compact
    end
  end
  
  def display_slideshow
    OPTIONS.index(slideshow)
  end

  protected
  
  def set_other_urls
    return if url.blank?    
    base_url, ext = url.split('_z_d')
    self.thumbnail_url = [base_url, ext].join(thumb_ext) if thumbnail_url.blank?
    self.small_url = [base_url, ext].join(small_ext) if small_url.blank?
    self.medium_url = [base_url, ext].join(medium_ext) if medium_url.blank?
  end
  
  def thumb_ext
    '_t_d'
  end
  
  def small_ext
    '_m_d'
  end
  
  def medium_ext
    '_d'
  end
end
