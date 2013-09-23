class Text < ActiveRecord::Base
  before_destroy { false } # Forbid deletion

  def self.find(uid)
    begin
      super(Integer(uid))
    rescue ArgumentError
      controller, action = uid.split("/")
      where(controller: controller, action: action).first
    end
  end
end
