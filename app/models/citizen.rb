class Citizen < ApplicationRecord
  include TranslateEnum

  belongs_to :address
  belongs_to :phone
  has_many_attached :image, dependent: :destroy

  enum status: {
    active: 'active',
    inactive: 'inactive'
  }

  validates :email, format: { with: /\A([\w+-].?)+@[a-z\d-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :cpf, presence: true, uniqueness: true
  validate :cpf_must_be_valid
  validate :cns_must_be_valid
  validate :birthdate_must_be_valid

  scope :filter_by_name, ->(name) { where('name ILIKE :name', name: "%#{name}%") }
  scope :filter_by_cpf, ->(cpf) { where(cpf: cpf) }
  scope :filter_by_cns, ->(cns) { where(cns: cns) }
  scope :filter_by_email, ->(email) { where(email: email) }
  scope :filter_by_phone, ->(phone) { includes(:phone).where(phone: { number: phone }) }
  scope :filter_by_status, ->(status) { where(status: status) }

  translate_enum :status

  private

  def cpf_must_be_valid
    errors.add(:cpf, :cpf_must_be_valid) unless CPF.valid?(cpf)
  end

  def cns_must_be_valid
    return errors.add(:cns, :cns_must_be_valid) unless cns.present? && cns.length == 15

    sum = (0..14).sum { |i| cns[i].to_i * (15 - i) }

    errors.add(:cns, :cns_must_be_valid) unless (sum % 11).zero?
  end

  def birthdate_must_be_valid
    return errors.add(:cns, :birthdate_must_be_valid) unless birthdate <= Date.today - 5.years

    errors.add(:cns, :birthdate_must_be_valid) unless birthdate >= Date.today - 120.years
  end
end
