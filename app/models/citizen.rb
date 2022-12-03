class Citizen < ApplicationRecord
  belongs_to :address
  belongs_to :phone
  has_many_attached :image, dependent: :destroy

  validates :email, format: { with: /\A([\w+-].?)+@[a-z\d-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :cpf, presence: true, uniqueness: true
  validate :cpf_must_be_valid
  validate :cns_must_be_valid

  def cpf_must_be_valid
    errors.add(:cpf, :cpf_must_be_valid) unless CPF.valid?(cpf)
  end

  def cns_must_be_valid
    return errors.add(:cns, :cns_must_be_valid) unless cns.present? && cns.length == 15

    sum = (0..14).sum { |i| cns[i].to_i * (15 - i) }

    errors.add(:cns, :cns_must_be_valid) unless (sum % 11).zero?
  end
end
