class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address #aceitar atributos aninhados de endereço (no mesmo formulário)
  #aceitar telefones
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, length: { minimum: 3}
  validates :email, presence: true

end
