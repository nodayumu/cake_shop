class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, presence: true

  def active_for_authentication?  # 状態は有効ですよ & devise継承 メソッド自作
    super && (self.is_deleted == false )  #falseは有効
    #superは、継承元のメソッドを呼び出すことができるメソッド
   	#ここでのsuperは、deviseに存在している認証機能を継承してくれてる
   	#且つ、退会済みのユーザーを弾く　selfは、ここではEndUserモデルを指す
  end

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy

end
