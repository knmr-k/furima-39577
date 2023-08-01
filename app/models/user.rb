class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # has_many :items
  # has_many :orders
  
  # パスワードは、半角英数字混合での入力が必須である
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :nickname, presence: true
  # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須である
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
  # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須である
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
  # お名前カナ(全角)は、全角（カタカナ）での入力が必須である
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  # お名前カナ(全角)は、全角（カタカナ）での入力が必須である
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
