class PostDecorator < Draper::Decorator
  delegate_all
  translates :title, :body, :summary

  def title
    h.smarty_pants super
  end

  def body
    h.markdown super
  end

  def summary
    h.markdown (super.rstrip + "... #{h.link_to("#{I18n.t("words.more")} →", object)}")
  end

  def to_s
    h.truncate(object.to_s, length: 60)
  end
end
