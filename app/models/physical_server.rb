class PhysicalServer < ApplicationRecord
  include NewWithTypeStiMixin
  include_concern 'Operations'

  acts_as_miq_taggable

  belongs_to :ext_management_system, :foreign_key => :ems_id, :class_name => "ManageIQ::Providers::PhysicalInfraManager"
  has_many :firmwares, :foreign_key => "ph_server_uuid", :primary_key => "uuid"
  has_one :host, :foreign_key => "service_tag", :primary_key => "serialNumber"
  
  def name_with_details
    details % {
      :name => name,
    }
  end

  def my_zone 
    ems = ext_management_system 
    ems ? ems.my_zone : MiqServer.my_zone 
  end

end
