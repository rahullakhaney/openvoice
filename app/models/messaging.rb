class Messaging < ActiveRecord::Base

  belongs_to :user

  has_many :replies, :class_name => "Messaging", :foreign_key => "in_reply_to_id"
#  belongs_to :ParentMessage, :foreign_key => "in_reply_to_id"

  validates_presence_of :text
  validates_presence_of :to
  validates_presence_of :from

  before_create :sanitize_numbers
  before_create :set_from_name
  after_create :send_text

  def sanitize_numbers
    self.to.gsub!(/\D/, "") if self.to
    self.from.gsub!(/\D/, "")
  end

  # Looks up contact name by caller_id and set it for every incoming message
  def set_from_name
    if outgoing
      self.from_name = user.name || "You"
      return
    end
    caller = user.contacts.select{ |c| c.number == from }.first
    unless caller.nil?
      self.from_name = caller.name
    else
      self.from_name = "Unknown caller"
    end
  end

  def send_text
    if outgoing
      from = user.profiles.first.voice
      profile = user.profiles.first
      call_url = profile.call_url
      messaging_token = profile.messaging_token
      msg_url = (call_url || TROPO_URL) + messaging_token + '&from='+ from + '&to=' + to + '&text=' + CGI::escape(text)
      HTTParty.get(msg_url)
    end
  end

  def create_reply(params={})
    reply = Messaging.new(params.merge(:in_reply_to_id => self.id))
    reply.user = user
    reply.save
    reply
  end

  def created_at
    unless self.read_attribute(:created_at).nil?
      self.read_attribute(:created_at).strftime("%a, %b %d")
    end
  end

end
