class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # to include mongoid paperclip gem
  include Mongoid::Paperclip
  # initiating field for picture
  has_mongoid_attached_file :picture, styles: {thumb: '100x100#', medium: '250x250#'}
  # validations picture
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  has_many :tweets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :username,           type: String, default: ""
  field :name,               type: String, default: ""
  field :location,           type: String, default: ""
  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  before_validation :generate_username
  validates :username,       uniqueness: true
  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  def to_param
    self.username
  end


  def generate_username
    self.username = self.username.downcase.gsub(/[^\w]/,'-').gsub(/[^\[a-z0-9]]/,'-').gsub(/\-+/,'-').gsub(/\-$/,'').gsub(/^\-/,'')
  end
  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
end
